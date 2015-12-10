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
		System.out.println("--------------AdminCont��ü ������");
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

		String mlevel = dao.loginProc(dto); // ȸ����� ��������

		if (mlevel == null) { // �α��� ����
			return "sol_admin/passwderror";

		} else { // �α��� ����

			if (mlevel.equals("A1") || mlevel.equals("B1") || mlevel.equals("C1")) {
				// A1, B1, C1 ��޸� ������ �������� �α��� ����
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

// -----------------------------------------------------------------------------------------����Ǯ��κ� ����
	@RequestMapping(value = "/sol_admin/testList.do")
	public String testList(HttpServletRequest request) {

		String url = "testList.do"; // page��ũ�� �̵��� ������
		int nowPage = 1; // ����������, ������ ���۹�ȣ 0->1page
		int numPerPage = 5; // �������� ���ڵ� ��

		int recNo = 1; // �Խ��� ��Ͽ� ��µ� �� ��ȣ

		String col1 = null;// null�̸� <dynamic prepend="where">�� ����ȵ�
		if (request.getParameter("col1") != "") {
			col1 = request.getParameter("col1");
			// System.out.println("�г�: "+col1);
		}

		String col2 = null;
		if (request.getParameter("col2") != "") {
			col2 = request.getParameter("col2");
			// System.out.println("����: "+col2);
		}

		// ���� �������� ������ ������
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
			request.setAttribute("msg", "������ ��Ͽ� �����Ͽ����ϴ�.<br /><br /> �ٽ� �õ��� �ֽʽÿ�.");
			request.setAttribute("link1", "<input type='button' value='�ٽýõ�' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='������ ���' onclick=\"location.href='testList.do';\">");

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
		// ���۵� ������ ����� ���� �������� ��� �ľ�
		String basePath = Utility.getRealPath(request, "/sol_admin/test/storage");

		// 1) postMF���� ����
		MultipartFile posterMF = dto.getPosterMF(); // ���ϲ�����

		// ���� ���� �� �����ӵ� ���ϸ� ��ȯ
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
			//System.out.println("example����:" +example);
	
		
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
			request.setAttribute("msg", "���� ��Ͽ� �����Ͽ����ϴ�.<br /><br /> �ٽ� �õ��� �ֽʽÿ�.");
			request.setAttribute("link1", "<input type='button' value='�ٽýõ�' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='���� ���' onclick=\"location.href='questionList.do';\">");

			return "sol_admin/error";
		}

	}

// -----------------------------------------------------------------------------------------����Ǯ��κ� ��
}
