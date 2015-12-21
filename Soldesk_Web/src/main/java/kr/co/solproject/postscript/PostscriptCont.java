package kr.co.solproject.postscript;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** Postscript controller에서는 리스트조회를 제외한 page reload해야하는 것만 제어함. **/

@Controller
public class PostscriptCont {

	@Autowired
	private PostscriptDAO postDao = null;

	public PostscriptCont() {
		System.out.println("---------------PostscriptCont객체 생성");
	}

	@RequestMapping(value = "/sol_study/lectureList.do", method = RequestMethod.POST)
	public void createProc(PostscriptDTO dto, HttpServletResponse resp) {

		try {
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
