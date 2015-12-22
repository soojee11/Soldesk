package kr.co.solproject.postscript;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.category.CategoryDTO;

/** Postscript controller에서는 리스트조회를 제외한 page reload해야하는 것만 제어함. **/

@Controller
public class PostscriptCont {

	@Autowired
	private PostscriptDAO postDao = null;

	public PostscriptCont() {
		System.out.println("---------------PostscriptCont객체 생성");
	}

	@RequestMapping(value = "/sol_study/create.do", method = RequestMethod.POST)
	public void createProc(PostscriptDTO dto, HttpServletResponse resp, HttpServletRequest request) {
		System.out.println(">>>>>"+request.getParameter("param"));
		CategoryDTO cdto = null;
		cdto = postDao.getCategory(dto.getCategoryno());
		try {
			System.out.println("dto>>>>>>"+dto.toString());
			int cnt = postDao.postInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("댓글 등록 완료!");
			} else {
				out.write("댓글 등록 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end

}
