package kr.co.solproject.player;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.mypage.MypageDAO;
import kr.co.solproject.mypage.MypageDTO;
import kr.co.solproject.player.PlayerDAO;
import kr.co.solproject.study.StudyDAO;
import kr.co.solproject.study.StudyDTO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class PlayerCont {

	@Autowired
	private PlayerDAO dao = null;
	 @Autowired
	  private StudyDAO sdao=null;
	 @Autowired
	  private MypageDAO mdao=null; //하나)추가-캘린더
	 
	 
	public PlayerCont() {
		System.out.println("PlayerCont 객체 생성");
	}

	@RequestMapping(value="/sol_player/player.do", method=RequestMethod.GET)
  public String createForm(HttpServletRequest req, HttpSession session){
	 // System.out.println("-----------session id값"+session.getAttribute("s_id"));
   // System.out.println("-----------session pw값"+session.getAttribute("s_pw"));
    // 여기서 동영상 정보들 가져오기     
    PlayerDTO dto = null;
    StudyDTO sdto = null;
    MypageDTO mdto = null;//하나)추가-캘린더
    List list = null;
    
    String id = (String) session.getAttribute("s_id");    // 우선적으로 id
    int lectureno =3;        // default 우선적으로 해놈 
    
    if(req.getParameter("lectureno") != null){
      lectureno = Integer.parseInt(req.getParameter("lectureno"));
    }
    dto = dao.read(lectureno);  // play되는 동영상의 정보 가져오기 
    
    int categoryno = dto.getCategoryno(); // play되는 동영상과 categoryno이 일치하는 동영상 목록 가져오기 
    list = dao.list(categoryno);
    
    int lecNo = list.size();
    
    req.setAttribute("lecNo", lecNo);
    req.setAttribute("list", list);
    req.setAttribute("dto", dto);
    
    // 학습 테이블에 동영상 본 기록 집어넣기( id와 lecturno이 같은 레코드가 존재하면 insert 하지 않음 )
    sdao.check(id, lectureno);        // id 와 lectureno 이 같은 레코드가 존재하는 지 검사 -> insert O / X
    
    // 캘린더 테이블에 동영상 본 기록 집어넣기(학습테이블 생성된 날짜가 여기에  저장됨)
    mdao.calinsert(id, lectureno); //하나)추가  -> 계속insert, update는없음.
    
    
    sdto = sdao.read(id, lectureno);  // id      와 lectureno 이 같은 레코드 memo 가져오기 
  //  System.out.println("---------------------"+sdto.getMemo());
    
    req.setAttribute("sdto", sdto);
    
    return "sol_player/player";
} // player.do end
	
	@RequestMapping(value="/sol_player/memoSave.do", method=RequestMethod.POST)
  public void save(StudyDTO dto, HttpServletResponse resp, HttpSession session){
    //System.out.println("----------memo:"+dto.getMemo());
   // System.out.println("----------lectureno:"+dto.getLectureno());
    try {
      String id = (String) session.getAttribute("s_id");
      
      // id랑 lectureno가 일치하는 레코드에 update sol_study
      Map map = new HashMap();
      map.put("id", id);
      map.put("memo", dto.getMemo());
      map.put("lectureno", dto.getLectureno());
      
      sdao.updateMemo(map);
      
      resp.setContentType("text/html; charset=UTF-8");
      PrintWriter out=resp.getWriter();
      out.write("memo");
    } catch(Exception e){
      System.out.println(e);
    }
  }// memoSave.do end 
	
	// 동영상 등록 
	@RequestMapping(value = "sol_admin/lecinsert.do", method = RequestMethod.GET)
	public String adminPlayInsert() {
		return "sol_admin/player/playerInsert";
	}

	@RequestMapping(value = "sol_admin/lecinsert.do", method = RequestMethod.POST)
	public String adminPlayInsertForm(PlayerDTO dto, HttpServletRequest req) {

		CategoryDTO cdto = null;
		cdto = dao.getCategory(dto.getCategoryno());
		
		String basePath = Utility.getRealPath(req, "/sol_admin/player/storage");

		MultipartFile posterMF = dto.getPosterMF();
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		dto.setPoster(poster);

		MultipartFile filenameMF = dto.getFilenameMF();
		String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
		dto.setFilename(filename);
		dto.setFilesize(filenameMF.getSize());
		
		System.out.println("---cateno:" +cdto.getCategoryno()+"-----cate grade: "+cdto.getGrade()+"------cate gwamok"+cdto.getGwamok());
		boolean flag = dao.playerInsert(dto);
			
		if (flag) {
				req.setAttribute("flag", true);
				
				return "redirect:./leclist.do?col1="+cdto.getGrade()+"&col2="+cdto.getGwamok();
			} else {
				req.setAttribute("msg1", "동영상 업로드 실패<br/><br/>");
				req.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
				req.setAttribute("link2", "<input type='button' value='동영상 목록' onclick=\"location.href='./leclist.do'\">");

				return "sol_admin/error";
			}
		
	}//end
	
}
