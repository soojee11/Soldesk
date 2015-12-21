package kr.co.solproject.mypage;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.study.StudyDAO;
import kr.co.solproject.study.StudyDTO;

@Controller
public class MypageController {

	@Autowired
	private MypageDAO dao = null;
	@Autowired
	private StudyDAO sdao = null;

	StudyDTO sdto = null;
	MypageDTO sy = null;

	public MypageController() {
		System.out.println("��------MypageController()��ü ������...");
	}

	// --------------------------------------------------------------------
	@RequestMapping(value = "sol_mypage/calendar.do", method = RequestMethod.POST)
	public String calendar2(String s_id,HttpServletRequest req, HttpSession session) {
	System.out.println(s_id);
		
	if(s_id != ""){
	
		Calendar cal = Calendar.getInstance();
		//���� ��¥ ���ϱ�
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		//���� 0���� �����ϹǷ� 1�� ǥ�ø� ���� 1�� ���� �ݴϴ�.
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		String nowregdate = (String)(nowYear+"0"+nowMonth+"0"+nowDay);
		String nowregdate2 = (String)(nowYear+"-"+nowMonth+"-"+nowDay);
		
		
		List regdatelist = null;
	    regdatelist = dao.getregdate(s_id); //���¸�������¥���� LIST�� ��������
	    
		
		List memolist=dao.getMemoList();//sol_study�� �����ؼ� memo������ ��������
		System.out.println(memolist);
		
		List lecturelist=dao.getLectureList();//sol_lecture�� �����ؼ� ���������� ��������
		System.out.println(lecturelist);
		
		List maxrdtlist=dao.getMaxrdtList(s_id);//�� ��¥���� max(regdate)��������
		System.out.println("#"+maxrdtlist);
		
		
		String promise = null;
		String name = null;
		promise = dao.getpromise(s_id);
		name = dao.getname(s_id);
		req.setAttribute("promise", promise);
		req.setAttribute("name", name);
		req.setAttribute("id", s_id);
		req.setAttribute("regdatelist", regdatelist);
		req.setAttribute("nowregdate", nowregdate);
		req.setAttribute("nowregdate2", nowregdate2);
		req.setAttribute("memolist", memolist);
		req.setAttribute("lecturelist", lecturelist);
		req.setAttribute("maxrdtlist", maxrdtlist);
		
		return "/sol_mypage/calendar";
	}
	else{
		//�α��ξ��Ѱ��
		return "/sol_mypage/calendarError";
	    }
	}//end
	
	
	// --------------------------------------------------------------------
	
	/*@RequestMapping( "sol_mypage/calendar.do")*/
	@RequestMapping(value = "sol_mypage/calendar.do", method = RequestMethod.GET)
	public String calendar(String s_id,HttpServletRequest req, HttpSession session) {
	
		if(s_id != ""){
			
			Calendar cal = Calendar.getInstance();
			//���� ��¥ ���ϱ�
			int nowYear = cal.get(Calendar.YEAR);
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			//���� 0���� �����ϹǷ� 1�� ǥ�ø� ���� 1�� ���� �ݴϴ�.
			int nowDay = cal.get(Calendar.DAY_OF_MONTH);
			String nowregdate = (String)(nowYear+"0"+nowMonth+"0"+nowDay);
			String nowregdate2 = (String)(nowYear+"-"+nowMonth+"-"+nowDay);
			
			
			List regdatelist = null;
		    regdatelist = dao.getregdate(s_id); //���¸�������¥���� LIST�� ��������
		    
			
			List memolist=dao.getMemoList();//sol_study�� �����ؼ� memo������ ��������
			System.out.println(memolist);
			
			List lecturelist=dao.getLectureList();//sol_lecture�� �����ؼ� ���������� ��������
			System.out.println(lecturelist);
			
			List maxrdtlist=dao.getMaxrdtList(s_id);//�� ��¥���� max(regdate)��������
			System.out.println("#"+maxrdtlist);
			
			
			String promise = null;
			String name = null;
			promise = dao.getpromise(s_id);
			name = dao.getname(s_id);
			req.setAttribute("promise", promise);
			req.setAttribute("name", name);
			req.setAttribute("id", s_id);
			req.setAttribute("regdatelist", regdatelist);
			req.setAttribute("nowregdate", nowregdate);
			req.setAttribute("nowregdate2", nowregdate2);
			req.setAttribute("memolist", memolist);
			req.setAttribute("lecturelist", lecturelist);
			req.setAttribute("maxrdtlist", maxrdtlist);
			
			return "/sol_mypage/calendar";
		}
		else{
			//�α��ξ��Ѱ��
			return "/sol_mypage/calendarError";
		    }
		}//end
	
	// --------------------------------------------------------------------
	
	
	@RequestMapping(value = "sol_mypage/memoGo.do", method = RequestMethod.GET)
	public String memoGo(String now,HttpServletRequest req, HttpSession session) {
		System.out.println("memo: "+now);
		 String s_id = (String) session.getAttribute("s_id");
		
		 List memolist=dao.getLectureList();//sol_lecture�� �����ؼ� ���������� ��������
			System.out.println(memolist);
			req.setAttribute("memolist", memolist);

			
			String promise = null;
			String name = null;
			promise = dao.getpromise(s_id);
			name = dao.getname(s_id);
			req.setAttribute("promise", promise);
			req.setAttribute("name", name);
			req.setAttribute("id", s_id);
			req.setAttribute("now", now);
		return "/sol_mypage/memo";
		
	}//end
	
	@RequestMapping(value = "sol_mypage/videoGo.do", method = RequestMethod.GET)
	public String videoGo(String now,HttpServletRequest req, HttpSession session) {
	System.out.println("video: "+now);
		
		 String s_id = (String) session.getAttribute("s_id");
		 
		 List videolist=dao.getLectureList();//sol_lecture�� �����ؼ� ���������� ��������
			System.out.println("##"+videolist);
			
			String promise = null;
			String name = null;
			promise = dao.getpromise(s_id);
			name = dao.getname(s_id);
			req.setAttribute("promise", promise);
			req.setAttribute("name", name);
			req.setAttribute("id", s_id);
			req.setAttribute("now", now);
			req.setAttribute("videolist", videolist);
		return "/sol_mypage/video";
		
	}//end
	

}
