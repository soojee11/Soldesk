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

/** Postscript controller������ ����Ʈ��ȸ�� ������ page reload�ؾ��ϴ� �͸� ������.**/

@Controller
public class PostscriptCont {

	@Autowired
	private PostscriptDAO postDao = null;

	public PostscriptCont() {
		System.out.println("---------------PostscriptCont��ü ����");
	}
	
	
	
}
