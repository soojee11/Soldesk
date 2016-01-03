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

/** Postscript controller에서는 리스트조회를 제외한 page reload해야하는 것만 제어함. **/

@Controller
public class LectureQnACont {

	@Autowired
	private LectureQnADAO qnaDao = null;

	public LectureQnACont() {
		System.out.println("---------------LectureQnACont객체 생성");
	}

	
	/** 후기 등록 **/
	@RequestMapping(value = "/sol_study/qnaCreate.do", method = RequestMethod.POST)
	public void createProc(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		
		cdto = qnaDao.getCategory(cdto);
		try {
			//System.out.println("질문나와라dto>>>>>>"+dto.toString());
			dto.setCategoryno(cdto.getCategoryno());
			int cnt = qnaDao.qnaInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("QnA 등록 완료!");
			} else {
				out.write("QnA 등록 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
	}// end
	
		
}
