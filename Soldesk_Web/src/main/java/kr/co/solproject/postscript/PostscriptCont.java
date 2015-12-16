package kr.co.solproject.postscript;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.utility.Paging;
import net.utility.Utility;

/** Postscript controller에서는 리스트조회를 제외한 page reload해야하는 것만 제어함.**/

@Controller
public class PostscriptCont {

	@Autowired
	private PostscriptDAO postDao = null;

	public PostscriptCont() {
		System.out.println("---------------PostscriptCont객체 생성");
	}
	
	
	
}
