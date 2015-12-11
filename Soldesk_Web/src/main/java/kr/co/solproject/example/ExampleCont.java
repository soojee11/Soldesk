package kr.co.solproject.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.solproject.question.QuestionDAO;

@Controller
public class ExampleCont {
	@Autowired
	private QuestionDAO dao=null;

	public ExampleCont() {
		System.out.println("---------------ExampleCont°´Ã¼ »ý¼ºµÊ");
	}
}
