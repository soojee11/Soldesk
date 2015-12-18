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

/** Postscript controller������ ����Ʈ��ȸ�� ������ page reload�ؾ��ϴ� �͸� ������. **/

@Controller
public class PostscriptCont {

	@Autowired
	private PostscriptDAO postDao = null;

	public PostscriptCont() {
		System.out.println("---------------PostscriptCont��ü ����");
	}

	@RequestMapping(value = "/sol_study/lectureList.do", method = RequestMethod.POST)
	public void createProc(PostscriptDTO dto, HttpServletResponse resp) {

		try {
			int cnt = postDao.postInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("��� ��� �Ϸ�!");
			} else {
				out.write("��� ��� ����! �ٽ� �õ��� �ּ���.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end

}
