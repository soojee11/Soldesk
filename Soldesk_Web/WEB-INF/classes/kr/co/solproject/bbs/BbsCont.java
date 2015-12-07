package kr.co.solproject.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.bbs.BbsDAO;

@Controller
public class BbsCont {
	
	@Autowired
	private BbsDAO dao=null;
	
	public BbsCont() {
		System.out.println("solproject ------¡Ú BbsCont°´Ã¼ »ý¼ºµÊ ");
	}
	
	//http://localhost:9090/mybatis/bbs/create.do
	@RequestMapping(value="/sol_bbs/create.do", method=RequestMethod.GET)
	public String createForm() {
		return "sol_bbs/bbsForm";
	}
	
	

}
