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
	@RequestMapping(value = "/sol_study/create.do", method = RequestMethod.POST)
	public void createProc(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		
		/*cdto.setGrade(cdto.getGrade());
		cdto.setGwamok(cdto.getGwamok());
		System.out.println(cdto.getGrade());
		System.out.println(cdto.getGwamok());*/
		
		cdto = qnaDao.getCategory(cdto);
		try {
			//System.out.println("dto>>>>>>"+dto.toString());
			dto.setCategoryno(cdto.getCategoryno());
			int cnt = qnaDao.qnaInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("후기 등록 완료!");
			} else {
				out.write("후기 등록 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	
	/** 후기 삭제 **/
	@RequestMapping(value = "/sol_study/delete.do", method = RequestMethod.GET)
	public void deleteProc(LectureQnADTO dto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		
		try {
			//System.out.println("dto>>>>>>"+dto.toString());
			int cnt = qnaDao.qnaDelete(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("후기 삭제 완료!");
			} else {
				out.write("후기 삭제 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end

	/** 후기 수정: 후기 조회 **/
	@RequestMapping(value = "/sol_study/read.do", method = RequestMethod.GET)
	public void updateRead(LectureQnADTO dto, HttpServletResponse resp, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		try {	
			dto = qnaDao.qnaRead(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.write(dto.getContent());

		} catch (Exception e) {
			System.out.println("오류임:::"+e);
		}

	}// end
	

	/** 후기 수정 **/
	@RequestMapping(value = "/sol_study/update.do", method = RequestMethod.POST)
	public void updateProc(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));		
		//cdto = postDao.getCategory(cdto);
		
		try {						
			//System.out.println("수정!!!!!!!!!!"+dto.toString());		
			//dto.setCategoryno(cdto.getCategoryno());
			
			int cnt = qnaDao.qnaUpdate(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("후기 수정 완료!");
			} else {
				out.write("후기 수정 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	
	
}
