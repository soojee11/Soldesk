package kr.co.solproject.question;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionCont {

	@Autowired
	private QuestionDAO dao=null;

	public QuestionCont() {
		System.out.println("---------------QuestionCont°´Ã¼ »ý¼ºµÊ");
	}
	
	@RequestMapping(value="/sol_test/questionList.do")
	public String questionList(String testtitle, int testno, QuestionDTO dto, HttpServletRequest request) {
		
		request.setAttribute("testtitle", testtitle);
		
		List list=dao.getQuestionList(testno);
		request.setAttribute("list", list);
		
		int total=dao.getQuestionTotal(testno);
		request.setAttribute("recNo", total);
		
		return "sol_test/questionList";
	}

}
