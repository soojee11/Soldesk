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
import net.utility.Paging;
import net.utility.Utility;

@Controller
public class MypageController {

	@Autowired
	private MypageDAO dao = null;
	@Autowired
	private StudyDAO sdao = null;

	StudyDTO sdto = null;
	MypageDTO sy = null;

	public MypageController() {
		System.out.println("▶------MypageController()객체 생성됨...");
	}

	
	
	/*int year, int month,*/
	
	// --------------------------------------------------------------------
	@RequestMapping(value = "sol_mypage/calendar.do", method = RequestMethod.POST)
	public String calendar2(String s_id,HttpServletRequest req, HttpSession session) {
	//System.out.println("1)s_id= "+s_id);
		
	if(s_id != ""){
	
		Calendar cal = Calendar.getInstance();
		//오늘 날짜 구하기
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		//월은 0부터 시작하므로 1월 표시를 위해 1을 더해 줍니다.
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		String nowregdate = (String)(nowYear+"0"+nowMonth+"0"+nowDay);
		String nowregdate2 = null;
		String nowregdate3 = (String)(nowYear+"-"+nowMonth+"-"+nowDay);
		req.setAttribute("nowregdate3", nowregdate3);
		
		if(nowMonth <10 && nowDay <10){
			 nowregdate2 = (String)(nowYear+"00"+nowMonth+"00"+nowDay);
		}
		if(nowMonth >=10 && nowDay >=10){
			 nowregdate2 = (String)(nowYear+"0"+nowMonth+"0"+nowDay);
		}
		if(nowMonth <10 && nowDay >=10){
			 nowregdate2 = (String)(nowYear+"00"+nowMonth+"0"+nowDay);
		}
		if(nowMonth >=10 && nowDay <10){
			 nowregdate2 = (String)(nowYear+"0"+nowMonth+"00"+nowDay);
		}

		
		
		
		List regdatelist = null;
	    regdatelist = dao.getregdate(s_id); //강좌를들은날짜들을 LIST로 가져오자
	    
		List memolist=dao.getMemoList();//sol_study와 조인해서 memo내용을 가져오자
		//System.out.println("1"+memolist);
		
		List lecturelist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
		System.out.println("1"+lecturelist);
		
		
		
		List maxrdtlist=dao.getMaxrdtList(s_id);//각 날짜마다 max(regdate)가져오기
		//System.out.println("1"+maxrdtlist);
		
		List maxregdtlist=dao.getMaxregdtList(s_id);//sol_Study에서 max(regdt)가져오기
		//System.out.println("1"+maxregdtlist);
		req.setAttribute("maxregdtlist", maxregdtlist);
		
		
		List myscorelist=dao.getMyscoretList();//myscore,test,calendar조인
		//System.out.println("1**"+myscorelist);
		req.setAttribute("myscorelist", myscorelist);
		
		List myscorelist2=dao.getMyscoretList2(s_id);//sol_myscore
		//System.out.println("1**"+myscorelist2);
		req.setAttribute("myscorelist2", myscorelist2);
		
		
		//################################################################
		
		//현재 날짜 정보 
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = cr.get(Calendar.MONTH);
		int date = cr.get(Calendar.DATE);
		//오늘 날짜
		String today = year + ":" +(month+1)+ ":"+date; 
		//선택한 연도 / 월
		String input_year = req.getParameter("year");
		String input_month = req.getParameter("month"); 
		 
		if(input_month != null){
		 month = Integer.parseInt(input_month)-1;
		}
		if(input_year != null){
		 year = Integer.parseInt(input_year);
		}
		// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
		cr.set(year, month, 1);
		 
		// 해당 월의 첫날를 구함
		int startDate = cr.getMinimum(Calendar.DATE);
		// 해당 월의 마지막 날을 구함
		int endDate = cr.getActualMaximum(Calendar.DATE);
		// 1일의 요일을 구함
		int startDay = cr.get(Calendar.DAY_OF_WEEK);
		//System.out.println("startDay-"+startDay);
		int count = 0;
		
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("date", date);
		req.setAttribute("today", today);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		req.setAttribute("startDay", startDay);
		req.setAttribute("count", count);
		
		
		//################################################################
		
		

		 List videolist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
		 req.setAttribute("videolist", videolist);
		 List modalmemolist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
		 req.setAttribute("modalmemolist", modalmemolist);
		 List mystudylist=dao.getMyscoretList();//myscore,test,calendar조인
		 req.setAttribute("mystudylist", mystudylist);
			
		 
		 
		
		//--------------------------------------------------------------------------------
			//자유게시판
		    int nowPage=1;      // 현재페이지, 페이지 시작번호 0->1page
		    int numPerPage=5;   // 페이지당 레코드 수
		    String url="calendar.do?s_id="+s_id;  // 이동할 페이지 
		    
		    // 현재 페이지의 정보를 가져옴    
		    if(req.getParameter("nowPage")!=null) {
		      nowPage=Integer.parseInt(req.getParameter("nowPage"));
		    }
		    
		    int sno=((nowPage-1)*numPerPage);
		    
		    
		    Map map = new HashMap();
		    map.put("sno", sno);
		    map.put("id", s_id);
		    map.put("numPerPage", numPerPage);
		    
		    List bbslist=dao.getbbslist(map);
		
		    int total=dao.getTotal(s_id);
		    String paging=Paging.paging5(total,nowPage,numPerPage,url);
			
		    
		    int totalPage = (int) Math.ceil((double)total/(double)numPerPage);
		    
			 req.setAttribute("bbslist", bbslist);
		    req.setAttribute("paging", paging);
		    req.setAttribute("nowPage", nowPage);
		    req.setAttribute("totalPage", totalPage);
		    req.setAttribute("total", total);
		 
		 
			
		    //qna게시판
				Map map2=new HashMap();
				map2.put("sno", sno);
			    map2.put("id", s_id);
			    map2.put("numPerPage", numPerPage);
			
				 List qnalist=dao.getqnalist(map2);
				
				 
				 
				// System.out.println("# " + s_id);
				// System.out.println("# " +qnalist);
				 
				 
				 
				 
				 
				String dbean=Utility.getDate();
				 int total2=dao.getTotal2(s_id);
				
				 String paging2=Paging.paging5(total2,nowPage,numPerPage,url);
					
					
				 int recNo = total2 - (nowPage - 1) * numPerPage + 1 ;
				req.setAttribute("recNo", recNo);
				
				int totalPage2 = (total / numPerPage)+1;
				
				 req.setAttribute("qnalist", qnalist);
				 req.setAttribute("dbean", dbean);
				req.setAttribute("paging2", paging2);
				req.setAttribute("totalPage2", totalPage2);
				  req.setAttribute("total2", total2);
				session.setAttribute("s_id", session.getAttribute("s_id"));
			
		 
		//--------------------------------------------------------------------------------
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
		//로그인안한경우
		return "/sol_mypage/calendarError";
	    }
	}//end
	
	
	// --------------------------------------------------------------------
	
	/*@RequestMapping( "sol_mypage/calendar.do")*/
	@RequestMapping(value = "sol_mypage/calendar.do", method = RequestMethod.GET)
	public String calendar(String s_id,HttpServletRequest req, HttpSession session) {
		//System.out.println("0)s_id= "+s_id);
		if(s_id != ""){
			
			Calendar cal = Calendar.getInstance();
			//오늘 날짜 구하기
			int nowYear = cal.get(Calendar.YEAR);
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			//월은 0부터 시작하므로 1월 표시를 위해 1을 더해 줍니다.
			int nowDay = cal.get(Calendar.DAY_OF_MONTH);
			String nowregdate = (String)(nowYear+"0"+nowMonth+"0"+nowDay);
			String nowregdate2 = null;
			String nowregdate3 = (String)(nowYear+"-"+nowMonth+"-"+nowDay);
			req.setAttribute("nowregdate3", nowregdate3);
			
			if(nowMonth <10 && nowDay <10){
				 nowregdate2 = (String)(nowYear+"00"+nowMonth+"00"+nowDay);
			}
			if(nowMonth >=10 && nowDay >=10){
				 nowregdate2 = (String)(nowYear+"0"+nowMonth+"0"+nowDay);
			}
			if(nowMonth <10 && nowDay >=10){
				 nowregdate2 = (String)(nowYear+"00"+nowMonth+"0"+nowDay);
			}
			if(nowMonth >=10 && nowDay <10){
				 nowregdate2 = (String)(nowYear+"0"+nowMonth+"00"+nowDay);
			}
			
			
			//System.out.println(nowregdate2);
			
			
			
			List regdatelist = null;
		    regdatelist = dao.getregdate(s_id); //강좌를들은날짜들을 LIST로 가져오자
		    
			
			List memolist=dao.getMemoList();//sol_study와 조인해서 memo내용을 가져오자
			//System.out.println("0"+memolist);
			
			List lecturelist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
			//System.out.println("0"+lecturelist);
			
			
			
			
			List maxrdtlist=dao.getMaxrdtList(s_id);//각 날짜마다 max(regdate)가져오기
			//System.out.println("0"+maxrdtlist);
			
			
			List getmemodateList=dao.getmemodateList(s_id);//각 날짜마다 max(memodate)가져오기
			req.setAttribute("getmemodateList", getmemodateList);
			
			
			
			List maxregdtlist=dao.getMaxregdtList(s_id);//sol_Study에서 max(regdt)가져오기
			//System.out.println("0"+maxregdtlist);
			req.setAttribute("maxregdtlist", maxregdtlist);
			
			
			List myscorelist=dao.getMyscoretList();//myscore,test,calendar조인
			//System.out.println("0**"+myscorelist);
			req.setAttribute("myscorelist", myscorelist);
			
			
			List myscorelist2=dao.getMyscoretList2(s_id);//sol_myscore
			//System.out.println("0**"+myscorelist2);
			req.setAttribute("myscorelist2", myscorelist2);
			
			//################################################################
			
			//현재 날짜 정보 
			Calendar cr = Calendar.getInstance();
			int year = cr.get(Calendar.YEAR);
			int month = cr.get(Calendar.MONTH);
			int date = cr.get(Calendar.DATE);
			//오늘 날짜
			String today = year + ":" +(month+1)+ ":"+date; 
			//선택한 연도 / 월
			String input_year = req.getParameter("year");
			String input_month = req.getParameter("month"); 
			 
			if(input_month != null){
			 month = Integer.parseInt(input_month)-1;
			}
			if(input_year != null){
			 year = Integer.parseInt(input_year);
			}
			// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
			cr.set(year, month, 1);
			 
			// 해당 월의 첫날를 구함
			int startDate = cr.getMinimum(Calendar.DATE);
			// 해당 월의 마지막 날을 구함
			int endDate = cr.getActualMaximum(Calendar.DATE);
			// 1일의 요일을 구함
			int startDay = cr.get(Calendar.DAY_OF_WEEK);
			//System.out.println("startDay-"+startDay);
			int count = 0;
			
			
			req.setAttribute("year", year);
			req.setAttribute("month", month);
			req.setAttribute("date", date);
			req.setAttribute("today", today);
			req.setAttribute("input_year", input_year);
			req.setAttribute("input_month", input_month);
			req.setAttribute("startDate", startDate);
			req.setAttribute("endDate", endDate);
			req.setAttribute("startDay", startDay);
			req.setAttribute("count", count);
			
			//################################################################
			
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
			
			
			 List videolist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
			 req.setAttribute("videolist", videolist);
			 List modalmemolist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
			 req.setAttribute("modalmemolist", modalmemolist);
			 List mystudylist=dao.getMyscoretList();//myscore,test,calendar조인
			 req.setAttribute("mystudylist", mystudylist);
				
		
				
				//--------------------------------------------------------------------------------
				 
				//자유게시판
			    int nowPage=1;      // 현재페이지, 페이지 시작번호 0->1page
			    int numPerPage=5;   // 페이지당 레코드 수
			    String url="calendar.do?s_id="+s_id;  // 이동할 페이지 
			    
			    // 현재 페이지의 정보를 가져옴    
			    if(req.getParameter("nowPage")!=null) {
			      nowPage=Integer.parseInt(req.getParameter("nowPage"));
			    }
			    
			    int sno=((nowPage-1)*numPerPage);
			    
			    
			    Map map = new HashMap();
			    map.put("sno", sno);
			    map.put("id", s_id);
			    map.put("numPerPage", numPerPage);
			    
			    List bbslist=dao.getbbslist(map);
			
			    int total=dao.getTotal(s_id);
			    String paging=Paging.paging5(total,nowPage,numPerPage,url);
				
			    
			    int totalPage = (int) Math.ceil((double)total/(double)numPerPage);
			    
				 req.setAttribute("bbslist", bbslist);
			    req.setAttribute("paging", paging);
			    req.setAttribute("nowPage", nowPage);
			    req.setAttribute("totalPage", totalPage);
			    req.setAttribute("total", total);
			 
			 
			 
			 
			   // System.out.println(s_id);
			    //qna게시판
					Map map2=new HashMap();
					map2.put("sno", sno);
				    map2.put("id", s_id);
				    map2.put("numPerPage", numPerPage);
				
					 List qnalist=dao.getqnalist(map2);
					
					 
					
					// System.out.println(qnalist);
					 
					 
					String dbean=Utility.getDate();
					 int total2=dao.getTotal2(s_id);
					
					 String paging2=Paging.paging5(total2,nowPage,numPerPage,url);
						
						
					 int recNo = total2 - (nowPage - 1) * numPerPage + 1 ;
					req.setAttribute("recNo", recNo);
					
					int totalPage2 = (total / numPerPage)+1;
					
					 req.setAttribute("qnalist", qnalist);
					 req.setAttribute("dbean", dbean);
					req.setAttribute("paging2", paging2);
					req.setAttribute("totalPage2", totalPage2);
					  req.setAttribute("total2", total2);
					session.setAttribute("s_id", session.getAttribute("s_id"));
				
				//--------------------------------------------------------------------------------
				
					
					
					
					
			 
			return "/sol_mypage/calendar";
		}
		else{
			//로그인안한경우
			return "/sol_mypage/calendarError";
		    }
		}//end
	
	// --------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//모달창으로 바꿈	
	
	
/*	@RequestMapping(value = "sol_mypage/memoGo.do", method = RequestMethod.GET)
	public String memoGo(String now,HttpServletRequest req, HttpSession session) {
		//System.out.println("memo: "+now);
		 String s_id = (String) session.getAttribute("s_id");
		
		 List memolist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
			//System.out.println(memolist);
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
		//System.out.println("video: "+now);
		
		 String s_id = (String) session.getAttribute("s_id");
		 
		 List videolist=dao.getLectureList();//sol_lecture와 조인해서 강의제목을 가져오자
			//System.out.println("##"+videolist);
		 
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
	
	@RequestMapping(value = "sol_mypage/mystudyGo.do", method = RequestMethod.GET)
	public String MystudyGo(String now,HttpServletRequest req, HttpSession session) {
		//System.out.println("mystudy: "+now);
		
		 String s_id = (String) session.getAttribute("s_id");
		 
		 List mystudylist=dao.getMyscoretList();//myscore,test,calendar조인
			//System.out.println("##"+mystudylist);
			req.setAttribute("mystudylist", mystudylist);
			
			String promise = null;
			String name = null;
			promise = dao.getpromise(s_id);
			name = dao.getname(s_id);
			req.setAttribute("promise", promise);
			req.setAttribute("name", name);
			req.setAttribute("id", s_id);
			req.setAttribute("now", now);
		
		return "/sol_mypage/mystudy";
		
	}//end
	*/

}
