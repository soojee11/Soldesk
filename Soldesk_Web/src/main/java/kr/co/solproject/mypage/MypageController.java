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
	MypageDTO mdto = null;

	public MypageController() {
		System.out.println("▶------MypageController()객체 생성됨...");
	}

	// --------------------------------------------------------------------
	@RequestMapping(value = "sol_mypage/calendar.do", method = RequestMethod.GET)
	public String calendar(String s_id,HttpServletRequest req, HttpSession session) {
		
	
		if(s_id != ""){
		
		//달력---------------------------------------------------------------------------------------------------
		Calendar cal = Calendar.getInstance();

		//오늘 날짜 구하기
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		//월은 0부터 시작하므로 1월 표시를 위해 1을 더해 줍니다.
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		String onldate = (String)(nowYear+"-"+nowMonth+"-"+nowDay);
		
		//클라이언트가 선택하여 넘어온 날짜
		String strYear = req.getParameter("year");
		String strMonth = req.getParameter("month");

		//표시할 달력의 년,월
		int year = nowYear;
		int month = nowMonth;
		if (strYear != null) {// 값이 없으면
			year = Integer.parseInt(strYear);//클라이언트가 선택한 값을 입력
		}
		if (strMonth != null) {// 값이 없으면
			month = Integer.parseInt(strMonth);//클라이언트가 선택한 값을 입력
		}

		//전월 이동을 구하기
		int preYear = year, preMonth = month - 1;
		if (preMonth < 1) {//1월 전월은 작년 12월 이니깐...
			preYear = year - 1;
			preMonth = 12;
		}

		//다음달 구하기
		int nextYear = year, nextMonth = month + 1;
		if (nextMonth > 12) {//12월 다음달은 내년 1월 이므로...
			nextYear = year + 1;
			nextMonth = 1;
		}

		//표시할 달력 세팅
		cal.set(year, month - 1, 1);//년,월,일
		int startDay = 1;//달의 첫 날
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		//매년 해당월의 1일 구하기
		int week = cal.get(Calendar.DAY_OF_WEEK);

		//달력------------------------------------------------------------------------------

		String promise = null;
		String name = null;
		promise = dao.getpromise(s_id);
		name = dao.getname(s_id);
		
		String regdate = null;
	    regdate = dao.getregdate(s_id); //강좌를들은날짜들을 가져오자
		
		System.out.println("regdate: "+regdate);
		
		
		
		//----------------------------------------------------------------------------------

		req.setAttribute("nowYear", nowYear);
		req.setAttribute("nowMonth", nowMonth);
		req.setAttribute("nowDay", nowDay);
		req.setAttribute("strYear", strYear);
		req.setAttribute("strMonth", strMonth);
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("preMonth", preMonth);
		req.setAttribute("nextMonth", nextMonth);
		req.setAttribute("nextYear", nextYear);
		req.setAttribute("preYear", preYear);
		req.setAttribute("nextMonth", nextMonth);
		req.setAttribute("startDay", startDay);
		req.setAttribute("endDay", endDay);
		req.setAttribute("week", week);
		
		req.setAttribute("id", s_id);
		req.setAttribute("promise", promise);
		req.setAttribute("name", name);
		
		return "/sol_mypage/calendar";
		}
		else{
			//로그인안한경우
			return "/sol_mypage/calendarError";
		}
		
	}// end

}
