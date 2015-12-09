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

import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.question.QuestionDTO;
import kr.co.solproject.test.TestDTO;
import net.utility.Paging;
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

	@RequestMapping(value = "sol_admin/testIns.do", method = RequestMethod.GET)
	public String insertForm() {
		return "sol_admin/test/insertForm";
	}

	@RequestMapping(value = "sol_admin/testIns.do", method = RequestMethod.POST)
	public String testInsProc(TestDTO dto, HttpServletRequest request) {

		boolean flag = dao.testIns(dto);

		if (flag) {
			request.setAttribute("flag", "true");
			return "redirect:testList.do";
		} else {
			request.setAttribute("msg", "test지 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2",
					"<input type='button' value='문제지 목록' onclick=\"location.href='testList.do';\">");

			return "sol_admin/error";
		}

	}// end

	@RequestMapping(value = "sol_admin/testList.do", method = RequestMethod.GET)
	public String testList(HttpServletRequest request) {

		String url = "./testList.do";
		int nowPage = 1;
		int numPerPage = 10;

		int recNo = 1;

		// 검색관련 변수
		String col = null;
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
			System.out.println("검색컬럼: " + col);
		}

		String word = null;
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
			System.out.println("검색어: " + word);
		}

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * numPerPage);

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);

		List list = dao.getTestList(map);
		String dbean = Utility.getDate();
		int total = dao.getTestTotal(map);

		String paging = Paging.paging3(total, nowPage, numPerPage, col, word, url);

		recNo = total - (nowPage - 1) * numPerPage + 1;

		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("total", total);

		return "sol_admin/test/testList";
	}// end

	@RequestMapping(value = "sol_admin/question.do", method = RequestMethod.GET)
	public String question(QuestionDTO dto, HttpServletRequest request) {

		String url = "./question.do";
		int nowPage = 1;
		int numPerPage = 10;

		int recNo = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * numPerPage);

		Map<String, Integer> map = new HashMap();
		map.put("sno", sno);
		map.put("testno", dto.getTestno());
		map.put("numPerPage", numPerPage);

		List list = dao.getquestion(map);
		String dbean = Utility.getDate();
		int total = dao.getQuestionTotal(map);

		System.out.println(dto.getTestno());
		System.out.println("--------------");
		/*
		 * String paging = Paging.paging3(total, nowPage, numPerPage, col, word,
		 * url);
		 */

		recNo = total - (nowPage - 1) * numPerPage + 1;

		request.setAttribute("list", list);
		request.setAttribute("testno", dto.getTestno());
		request.setAttribute("dbean", dbean);
		/* request.setAttribute("paging", paging); */
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);

		return "sol_admin/test/questionList";
	}
/*
	@RequestMapping(value = "sol_admin/questIns.do", method = RequestMethod.GET)
	public String questInsForm(QuestionDTO dto, HttpServletRequest request) {
		return "sol_admin/test/questInsForm";
	}

	@RequestMapping(value = "sol_admin/questIns.do", method = RequestMethod.POST)
	public String questInsProc(QuestionDTO dto, HttpServletRequest request) {

		boolean flag = dao.questInsProc(dto);

		if (flag) {
			request.setAttribute("flag", "true");
			return "redirect:testList.do";
		} else {
			request.setAttribute("msg", "문제 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2",
					"<input type='button' value='문제 목록' onclick=\"location.href='question.do';\">");

			return "sol_admin/error";
		}

		return "sol_admin/test/questionList";
	}*/
}
