package kr.co.solproject.lectureqna;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.category.CategoryDTO;

/** Postscript controller������ ����Ʈ��ȸ�� ������ page reload�ؾ��ϴ� �͸� ������. **/

@Controller
public class LectureQnACont {

	@Autowired
	private LectureQnADAO qnaDao = null;

	public LectureQnACont() {
		System.out.println("---------------LectureQnACont��ü ����");
	}

	
	/** �ı� ��� **/
	/*@RequestMapping(value = "/sol_study/create.do", method = RequestMethod.POST)
	public void createProc(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		
		cdto.setGrade(cdto.getGrade());
		cdto.setGwamok(cdto.getGwamok());
		System.out.println(cdto.getGrade());
		System.out.println(cdto.getGwamok());
		
		cdto = qnaDao.getCategory(cdto);
		try {
			//System.out.println("dto>>>>>>"+dto.toString());
			dto.setCategoryno(cdto.getCategoryno());
			int cnt = qnaDao.qnaInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("�ı� ��� �Ϸ�!");
			} else {
				out.write("�ı� ��� ����! �ٽ� �õ��� �ּ���.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	*/
		
}
