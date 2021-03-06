package kr.co.solproject.question;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionCont {

	@Autowired
	private QuestionDAO dao=null;

	public QuestionCont() {
		System.out.println("---------------QuestionCont��ü ������");
	}
	
	@RequestMapping(value="/sol_test/test/questionList.do")
	public String questionList(String testtitle, int testno, QuestionDTO dto, HttpServletRequest request,HttpSession session) {
		
		request.setAttribute("testtitle", testtitle);
		
		List list=dao.getQuestionList(testno);
		request.setAttribute("list", list);
		
		int total=dao.getQuestionTotal(testno);
		int gtotal=dao.getG_QuestionTotal(testno);
		request.setAttribute("recNo", total);
		request.setAttribute("gtotal", gtotal);
		
		
		return "sol_test/test/questionList";
	}

}
