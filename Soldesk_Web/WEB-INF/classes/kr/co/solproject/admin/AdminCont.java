package kr.co.solproject.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AdminCont {
	
	@Autowired
	private AdminDAO dao=null;
	
	public AdminCont() {
		System.out.println("--------------AdminCont°´Ã¼ »ý¼ºµÊ");
	}

}
