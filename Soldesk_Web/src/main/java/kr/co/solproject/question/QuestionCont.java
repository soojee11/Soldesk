package kr.co.solproject.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class QuestionCont {

	@Autowired
	private QuestionDAO dao=null;

	public QuestionCont() {
		System.out.println("---------------QuestionCont°´Ã¼ »ý¼ºµÊ");
	}
	
}
