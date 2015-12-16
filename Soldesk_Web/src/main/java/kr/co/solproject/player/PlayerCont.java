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
	  private MypageDAO mdao=null; //�ϳ�)�߰�-Ķ����
	 
	 
	public PlayerCont() {
		System.out.println("PlayerCont ��ü ����");
	}

	@RequestMapping(value="/sol_player/player.do", method=RequestMethod.GET)
  public String createForm(HttpServletRequest req, HttpSession session){
	 // System.out.println("-----------session id��"+session.getAttribute("s_id"));
   // System.out.println("-----------session pw��"+session.getAttribute("s_pw"));
    // ���⼭ ������ ������ ��������     
    PlayerDTO dto = null;
    StudyDTO sdto = null;
    MypageDTO mdto = null;//�ϳ�)�߰�-Ķ����
    List list = null;
    
    String id = (String) session.getAttribute("s_id");    // �켱������ id
    int lectureno =3;        // default �켱������ �س� 
    
    if(req.getParameter("lectureno") != null){
      lectureno = Integer.parseInt(req.getParameter("lectureno"));
    }
    dto = dao.read(lectureno);  // play�Ǵ� �������� ���� �������� 
    
    int categoryno = dto.getCategoryno(); // play�Ǵ� ������� categoryno�� ��ġ�ϴ� ������ ��� �������� 
    list = dao.list(categoryno);
    
    int lecNo = list.size();
    
    req.setAttribute("lecNo", lecNo);
    req.setAttribute("list", list);
    req.setAttribute("dto", dto);
    
    // �н� ���̺� ������ �� ��� ����ֱ�( id�� lecturno�� ���� ���ڵ尡 �����ϸ� insert ���� ���� )
    sdao.check(id, lectureno);        // id �� lectureno �� ���� ���ڵ尡 �����ϴ� �� �˻� -> insert O / X
    
    // Ķ���� ���̺� ������ �� ��� ����ֱ�(�н����̺� ������ ��¥�� ���⿡  �����)
    mdao.calinsert(id, lectureno); //�ϳ�)�߰�  -> ���insert, update�¾���.
    
    
    sdto = sdao.read(id, lectureno);  // id      �� lectureno �� ���� ���ڵ� memo �������� 
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
      
      // id�� lectureno�� ��ġ�ϴ� ���ڵ忡 update sol_study
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
	
	// ������ ��� 
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
				req.setAttribute("msg1", "������ ���ε� ����<br/><br/>");
				req.setAttribute("link1", "<input type='button' value='�ٽýõ�' onclick=\"history.back();\">");
				req.setAttribute("link2", "<input type='button' value='������ ���' onclick=\"location.href='./leclist.do'\">");

				return "sol_admin/error";
			}
		
	}//end
	
}
