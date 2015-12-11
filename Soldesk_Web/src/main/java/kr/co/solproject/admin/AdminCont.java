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
import org.springframework.web.multipart.MultipartFile;

import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.question.QuestionDTO;
import kr.co.solproject.test.TestDTO;
import net.utility.Paging;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class AdminCont {

	@Autowired
	private AdminDAO dao = null;

	public AdminCont() {
		System.out.println("--------------AdminCont객체 생성됨");
	}

	@RequestMapping(value = "sol_admin/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "sol_admin/adminLogin";
	}

	@RequestMapping(value = "sol_admin/logout.do", method = RequestMethod.GET)
	public String logoutForm() {
		return "sol_admin/adminLogout";
	}

	@RequestMapping(value = "sol_admin/adminIndex.do", method = RequestMethod.GET)
	public String indexForm() {
		return "sol_admin/adminIndex";
	}

	@RequestMapping(value = "sol_admin/adminIndex.do", method = RequestMethod.POST)
	public String loginProc(MemberDTO dto, HttpServletRequest request, HttpSession session) {

		String id = request.getParameter("adminid").trim();
		String passwd = request.getParameter("adminpw").trim();

		dto.setId(id);
		dto.setPasswd(passwd);

		String mlevel = dao.loginProc(dto); // 회원등급 가져오기

		if (mlevel == null) { // 로그인 실패
			return "sol_admin/passwderror";

		} else { // 로그인 성공

			if (mlevel.equals("A1") || mlevel.equals("B1") || mlevel.equals("C1")) {
				// A1, B1, C1 등급만 관리자 페이지에 로그인 가능
				session.setAttribute("s_admin_id", id);
				session.setAttribute("s_admin_mlevel", mlevel);
				session.setAttribute("s_admin_passwd", passwd);

				return "sol_admin/adminIndex";

			} else {
				request.setAttribute("flag", "false");
				return "sol_admin/adminLogin";
			}

		}
	}// end

	@RequestMapping(value = "sol_admin/member.do", method = RequestMethod.GET)
	public String loginProc() {
		return "sol_admin/member/memberList";
	}

	@RequestMapping(value = "sol_admin/memlist.do", method = RequestMethod.GET)
	public String memList() {
		return "sol_admin/member/memberList";
	}

// -----------------------------------------------------------------------------------------문제풀기부분 시작
	@RequestMapping(value = "/sol_admin/testList.do")
	public String testList(HttpServletRequest request) {

		String url = "testList.do"; // page링크시 이동할 페이지
		int nowPage = 1; // 현재페이지, 페이지 시작번호 0->1page
		int numPerPage = 5; // 페이지당 레코드 수

		int recNo = 1; // 게시판 목록에 출력될 글 번호

		String col1 = null;// null이면 <dynamic prepend="where">가 적용안됨
		if (request.getParameter("col1") != "") {
			col1 = request.getParameter("col1");
			// System.out.println("학년: "+col1);
		}

		String col2 = null;
		if (request.getParameter("col2") != "") {
			col2 = request.getParameter("col2");
			// System.out.println("과목: "+col2);
		}

		// 현재 페이지의 정보를 가져옴
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// int sno=((nowPage-1)*numPerPage)+1; //(0*5)+1=1,6,11
		int sno = ((nowPage - 1) * numPerPage);
		// int eno=nowPage*numPerPage;//1*5=5,10,15

		Map map = new HashMap();
		map.put("col1", col1);
		map.put("col2", col2);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);

		List list = dao.testList(map);
		String dbean = Utility.getDate();
		int total = dao.testTotal(map);

		String paging = Paging.paging(total, nowPage, numPerPage, col1, col2, url);

		recNo = total - (nowPage - 1) * numPerPage;

		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col1", col1);
		request.setAttribute("col2", col2);
		request.setAttribute("total", total);

		return "sol_admin/test/testList";
	}// end

	@RequestMapping(value = "sol_admin/testForm.do", method = RequestMethod.GET)
	public String testForm() {
		return "sol_admin/test/testForm";
	}

	@RequestMapping(value = "sol_admin/testInsert.do", method = RequestMethod.POST)
	public String testInsert(TestDTO dto, HttpServletRequest request) {

		boolean flag = dao.testInsert(dto);

		if (flag) {
			request.setAttribute("flag", "true");
			return "redirect:testList.do";
		} else {
			request.setAttribute("msg", "문제지 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='문제지 목록' onclick=\"location.href='testList.do';\">");

			return "sol_admin/error";
		}

	}// end

	@RequestMapping(value = "sol_admin/questionList.do")
	public String questionList(QuestionDTO dto, HttpServletRequest request) {
		int nowPage = 1;
		int numPerPage = 10;

		int recNo = 1;

		String col = null;
		if (request.getParameter("col") != "") {
			col = request.getParameter("col");

		}
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * numPerPage);

		Map map=new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("testno", dto.getTestno());
		map.put("numPerPage", numPerPage);

		List list = dao.questionList(map);
		String dbean = Utility.getDate();
		int total = dao.questionTotal(map);

		recNo = total - (nowPage - 1) * numPerPage + 1;

		request.setAttribute("col", col);
		request.setAttribute("list", list);
		request.setAttribute("questno", dto.getTestno());
		request.setAttribute("dbean", dbean);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);
		
		//System.out.println("list.toString()"+list.toString());

		return "sol_admin/test/questionList";
	}
	
	@RequestMapping(value = "sol_admin/questionForm.do", method = RequestMethod.GET)
	public String questionForm() {
		return "sol_admin/test/questionForm";
	}
	
	@RequestMapping(value = "sol_admin/questionInsert.do", method = RequestMethod.POST)
	public String questionInsert(QuestionDTO dto, HttpServletRequest request) {
		// -------------------------------------------------------------
		// 전송된 파일이 저장될 실제 물리적인 경로 파악
		String basePath = Utility.getRealPath(request, "/sol_admin/test/storage");

		// 1) postMF파일 관련
		MultipartFile posterMF = dto.getPosterMF(); // 파일꺼내옴

		// 파일 저장 및 리네임된 파일명 반환
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		dto.setPoster(poster);
		// -------------------------------------------------------------
		
		if(dto.getQtype().equals("OX"))
			dto.setAnswer(request.getParameter("OXAnswer"));
		
		if(dto.getQtype().equals("G")) {
			StringBuffer example = new StringBuffer();
			example.append(request.getParameter("example1"));
			example.append("/");
			example.append(request.getParameter("example2"));
			example.append("/");
			example.append(request.getParameter("example3"));
			example.append("/");
			example.append(request.getParameter("example4"));
			example.append("/");
			example.append(request.getParameter("example5"));
			//System.out.println("example보기:" +example);
	
		
			String exampleCheck=request.getParameter("exampleCheck");
			dto.setAnswer(request.getParameter(exampleCheck));
			String str = example.toString();
			dto.setExample(str);
			
		}
		boolean flag = dao.questionInsert(dto);
		

		if (flag) {
			request.setAttribute("flag", "true");
			return "redirect:questionList.do?testno="+dto.getTestno();
		} else {
			request.setAttribute("msg", "문제 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='문제 목록' onclick=\"location.href='questionList.do';\">");

			return "sol_admin/error";
		}

	}

// -----------------------------------------------------------------------------------------문제풀기부분 끝
}
