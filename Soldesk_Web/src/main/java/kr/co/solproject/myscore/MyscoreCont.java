package kr.co.solproject.myscore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.solproject.question.QuestionDAO;
import kr.co.solproject.question.QuestionDTO;

@Controller
public class MyscoreCont {

	@Autowired
	private MyscoreDAO dao=null;
	@Autowired
	private QuestionDAO dao2=null;

	public MyscoreCont() {
		System.out.println("---------------MyscoreCont객체 생성됨");
	}
	
	
	@RequestMapping(value="/sol_test/questionCheck.do")
	public String questionCheck(QuestionDTO dto, HttpServletRequest request, HttpSession session) {
		
		String usetime=request.getParameter("clock");
		int testno=Integer.parseInt(request.getParameter("testno"));
		String s_id=(String) session.getAttribute("s_id");

		String[] checks=request.getParameterValues("answer");
		String str=""; 
		for(int idx=0; idx<checks.length; idx++) {
			str+=checks[idx]+"/";
		}
		str=str.substring(0,str.length()-1);
		//System.out.println(str);
	
		for(int idx=0; idx<str.length(); idx++) {
			if(str.indexOf("*")>-1) {
				//System.out.println(str.indexOf("*"));
				String temp = str.substring(str.indexOf("*"), str.indexOf("*")+2);
				//System.out.println(temp);
				str = str.replace(temp, ",");
			}
		}
		//System.out.println(str);
		
		Map map=new HashMap();
		map.put("usetime", usetime);
		map.put("testno", testno);
		map.put("id", s_id);
		map.put("answerno", str);
		
		int res=dao.getAnswer(map);
		request.setAttribute("res", res);
		
		List list=dao2.getQuestionList(testno);
		request.setAttribute("list", list);
		
		int total=dao2.getQuestionTotal(testno);
		request.setAttribute("recNo", total);
		
		request.setAttribute("usetime", usetime);
		
		
		List answerList = new ArrayList();
		List answerList2 = new ArrayList();
		String[] str2 = str.split("/");		// ","을 기준으로 분리
		for (int idx = 0; idx < str2.length; idx++) {
			//System.out.println(str2[idx]);
			String str3=str2[idx];
			int inof=str2[idx].indexOf(",");
			String str4=str3.substring(inof+1);
			str3=str3.substring(0,inof);
			
			//System.out.println("str3="+str3);
			//System.out.println("str4="+str4);
			answerList.add(str3);
			answerList2.add(str4);
		}
		//System.out.println(answerList2.toString());
		Map map2=new HashMap();
		map2.put("testno", testno);
		map2.put("answerList", answerList);
		
		List resultList=dao.myscoreAnswer(map2);
		//System.out.println(resultList.toString());
		
		for(int idx=0; idx<resultList.size(); idx++) {
			dto=(QuestionDTO) resultList.get(idx);
			//System.out.println(dto.getAnswer());
		}
		
		double oneQuest=100.0/total;	//문제 하나당 점수
		//System.out.println("oneQuest:"+oneQuest);
		
		
		double myscore=0;
		for(int idx=0; idx<resultList.size(); idx++) {
			dto=(QuestionDTO) resultList.get(idx);
			//System.out.println(dto.getAnswer());
			String confirm=(String) answerList2.get(idx);
			if(dto.getAnswer().equals(confirm)) {
				myscore+=oneQuest;
			}	
		}
		myscore=Math.round(myscore);//반올림
		//System.out.println(myscore);
		int myScore =(int)myscore;
		request.setAttribute("myscore", myScore);
		
		
		return "sol_test/questionCheck";
	}
	
	
}
