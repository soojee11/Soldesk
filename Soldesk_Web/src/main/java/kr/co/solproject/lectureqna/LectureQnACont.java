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
import kr.co.solproject.postscript.PostscriptDTO;

/** Postscript controller������ ����Ʈ��ȸ�� ������ page reload�ؾ��ϴ� �͸� ������. **/

@Controller
public class LectureQnACont {

	@Autowired
	private LectureQnADAO qnaDao = null;

	public LectureQnACont() {
		System.out.println("---------------LectureQnACont��ü ����");
	}

	@RequestMapping(value = "/sol_study/qnaCreate.do", method = RequestMethod.POST)
	public void qnaCreate(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp,HttpSession session) {

		dto.setId((String) session.getAttribute("s_id"));
		cdto.setGrade(cdto.getGrade());
		cdto.setGwamok(cdto.getGwamok());
		
		cdto = qnaDao.getCategory(cdto);
		try {
			dto.setCategoryno(cdto.getCategoryno());
			int cnt = qnaDao.qnaInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("q&a ��� �Ϸ�!");
			} else {
				out.write("q&a ��� ����! �ٽ� �õ��� �ּ���.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
}
