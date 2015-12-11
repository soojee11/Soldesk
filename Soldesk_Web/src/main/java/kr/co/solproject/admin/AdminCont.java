package kr.co.solproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.player.PlayerDTO;
import kr.co.solproject.question.QuestionDTO;
import kr.co.solproject.test.TestDTO;
import net.utility.Paging;
import net.utility.Utility;


@Controller
public class AdminCont {
	
	@Autowired
	private AdminDAO dao=null;
	
	public AdminCont() {
		System.out.println("--------------AdminCont객체 생성됨");
	}
	
	
	//----------------------------------------------------------- login/out ----------------------------------------------------------------------------------------------
	
	
	@RequestMapping(value="sol_admin/login.do", method=RequestMethod.GET)
	public String loginForm() {
		return "sol_admin/adminLogin";
	}
	
	@RequestMapping(value="sol_admin/logout.do", method=RequestMethod.GET)
	public String logoutForm() {
		return "sol_admin/adminLogout";
	}
	
	@RequestMapping(value="sol_admin/adminIndex.do", method=RequestMethod.GET)
	public String indexForm() {
		return "sol_admin/adminIndex";
	}
	
	@RequestMapping(value="sol_admin/adminIndex.do", method=RequestMethod.POST)
	public String loginProc(MemberDTO dto, HttpServletRequest request, HttpSession session) {
		
		String id = request.getParameter("adminid").trim();
		String passwd = request.getParameter("adminpw").trim();
		
		dto.setId(id);
		dto.setPasswd(passwd);
		
		String mlevel = dao.loginProc(dto);		// 회원등급 가져오기
		
		if(mlevel==null){						// 로그인 실패
			return "sol_admin/passwderror";
		
		}else{ 	// 로그인 성공 
			
			if(mlevel.equals("A")){
				// A1, B1, C1 등급만 관리자 페이지에 로그인 가능
				session.setAttribute("s_admin_id", id);
				session.setAttribute("s_admin_mlevel", mlevel);
				session.setAttribute("s_admin_passwd", passwd);
				
				return "sol_admin/adminIndex";
				
			}else{
				request.setAttribute("flag","false");
				return "sol_admin/adminLogin";
			}
			
		}
	}//end
	
	//----------------------------------------------------------- member ----------------------------------------------------------------------------------------------
		
	@RequestMapping(value="sol_admin/member.do", method=RequestMethod.GET)
	public String loginProc() {
		return "sol_admin/member/memberList";
	}
	
	
	@RequestMapping(value="sol_admin/memlist.do", method=RequestMethod.GET)
	public String memList() {
		return "sol_admin/member/memberList";
	}
	
	//----------------------------------------------------------- test ----------------------------------------------------------------------------------------------
	
	
	//----------------------------------------------------------- lecture ----------------------------------------------------------------------------------------------

	@RequestMapping(value="sol_admin/leclist.do")
	public String lecList(HttpServletRequest request) {
		
		String url = "./leclist.do";	
		
		int nowPage=1;	
		int numPerPage=5;
		
		int recNo=1;
		
		// 검색관련 변수
		String co1 = null;
		if(request.getParameter("col1") != null){
			co1 = request.getParameter("col1");
			System.out.println("검색컬럼: "+co1);
		}
		
		String col2 = null;
		if(request.getParameter("col2") != null){
			col2 = request.getParameter("col2");
			System.out.println("검색컬럼: "+col2);
		}
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage-1)*numPerPage);
		
		Map map = new HashMap();
		map.put("col1", co1);
		map.put("col2",col2);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list = null;
		int categoryno = 0;
		int total = 0;
		
		if((co1=="" && col2=="")||(co1==null||col2==null)){
			
			list = dao.getLecList();
			total = dao.getLecTotal();
			
		}else{
			
			categoryno = dao.getCategoryno(map);
		
			list = dao.getLecList(categoryno);
			total = dao.getLecTotal(categoryno);
			
		}
		
		String dbean = Utility.getDate();
		String paging = Paging.paging4(total, nowPage, numPerPage, url);
		
		recNo = total - (nowPage - 1) * numPerPage + 1 ;
		
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col1", co1); //gwamok
		request.setAttribute("col2", col2);
		request.setAttribute("total", total);
	
		return "sol_admin/player/playerList";
		
	}//end
	
	@RequestMapping(value="sol_admin/lecread.do", method=RequestMethod.GET)
	public String lecRead(PlayerDTO dto, HttpServletRequest request) {
		
		dto = dao.lecRead(dto.getLectureno());

		String filename = dto.getFilename();
		filename = filename.toUpperCase();

		if (filename.endsWith(".MP3")) {
			request.setAttribute("file_end", "MP3");
			
		} else if (filename.endsWith(".MP4")) {
			request.setAttribute("file_end", "MP4");
		}
		
		int categoryno = dto.getCategoryno();
		CategoryDTO dto2 = null;
		dto2 = dao.categoryRead(categoryno);

		request.setAttribute("dto", dto);
		request.setAttribute("dto2", dto2);
		request.setAttribute("root", Utility.getRoot());

		return "sol_admin/player/playerRead";
	}//end
	
	@RequestMapping(value="sol_admin/lecDel.do", method=RequestMethod.GET)
	public String lecDel(HttpServletRequest request) {
		
		PlayerDTO dto = null;
		CategoryDTO dto2 = null;
		
		//System.out.println("------lecno"+request.getParameter("lectureno"));
		//System.out.println("------cateno"+request.getParameter("categoryno"));
		
		int lectureno = Integer.parseInt(request.getParameter("lectureno"));
		int categoryno = Integer.parseInt(request.getParameter("categoryno"));
		
		dto = dao.lecRead(lectureno);
		dto2 = dao.categoryRead(categoryno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("dto2", dto2);
				
		return "sol_admin/player/playerDel";
	}//end
	
	@RequestMapping(value="sol_admin/lecDelProc.do", method=RequestMethod.GET)
	public String lecDelProc(int lectureno, int categoryno, HttpServletRequest request) {
		
		dao.categoryDelProc(categoryno);
		
		request.setAttribute("root", Utility.getRoot());

		// 실제 물리적인 경로
		String basePath = Utility.getRealPath(request, "/sol_admin/player/storage");

		// 파일 삭제
		PlayerDTO oldDTO = dao.lecRead(lectureno); // 기존에 등록된 파일 정보 가져오기
		Utility.deleteFile(basePath, oldDTO.getPoster());
		Utility.deleteFile(basePath, oldDTO.getFilename());

		dao.lecDelProc(lectureno);
		
		return "redirect:./leclist.do";
		
	}//end
	
	
	
}
