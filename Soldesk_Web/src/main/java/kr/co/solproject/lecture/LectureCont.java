package kr.co.solproject.lecture;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.solproject.lectureqna.LectureQnADAO;
import net.utility.Paging;
import net.utility.Utility;


@Controller
public class LectureCont {

	@Autowired
	private LectureDAO dao=null;
	
	@Autowired
	private LectureQnADAO qnaDao=null;
	
	public LectureCont() {
		System.out.println("---------------LectureCont객체 생성");
	}
	
	//http://localhost:9090/solproject/sol_study/lectureList.do"
	@RequestMapping(value="/sol_study/lectureList.do")
	public String list(HttpServletRequest request) {

		String url="lectureList.do";	// page링크시 이동할 페이지
		int nowPage=1;			// 현재페이지, 페이지 시작번호 0->1page
		int numPerPage=5;		// 페이지당 레코드 수
		int grade = 1;			// default 1학년으로 설정 
		String gwamok = "국어";
		
		int qnaNowPage=1;
		int qnaNumPerPage=5;
		
		if(request.getParameter("grade") != null){
			grade = Integer.parseInt(request.getParameter("grade"));
		}
		
		if(request.getParameter("gwamok")!=null) {
			gwamok=request.getParameter("gwamok");
		}
		
		int lectureNo=1;	// 게시판 목록에 출력될 글 번호
		int QnAno = 1;
		
		// 현재 페이지의 정보를 가져옴		
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		if(request.getParameter("qnaNowPage")!=null) {
			qnaNowPage=Integer.parseInt(request.getParameter("qnaNowPage"));
		}
		
		//int sno=((nowPage-1)*numPerPage)+1;	//(0*5)+1=1,6,11
		int sno=((nowPage-1)*numPerPage);
		//int eno=nowPage*numPerPage;//1*5=5,10,15
		
		int qno=((qnaNowPage-1)*qnaNumPerPage);
		
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("gwamok", gwamok);
		map.put("grade", grade);
		map.put("numPerPage", numPerPage);
		
		Map qnaMap = new HashMap();
		qnaMap.put("qno", qno);
		qnaMap.put("gwamok", gwamok);
		qnaMap.put("grade", grade);
		qnaMap.put("qnaNumPerPage", qnaNumPerPage);
		
		// 1. model사용
		List list=dao.getList(map);
		String categoryInfo = dao.getCategoryInfo(grade, gwamok);
		String dbean=Utility.getDate();
		int total=dao.getTotal(map);
		
		String paging=Paging.paging4(total,nowPage,numPerPage,url);
		
		List qnaList = qnaDao.getList(qnaMap);
		int qnaTotal = qnaDao.getTotal(qnaMap);
		String qnaPaging = Paging.paging4(qnaTotal, nowPage, numPerPage, url);
		
		lectureNo=list.size();
		QnAno = qnaList.size();
		
		// 2. model사용후 결과값을 request영역에 저장
		request.setAttribute("categoryInfo", categoryInfo);
		request.setAttribute("list", list);
		request.setAttribute("grade", new Integer(grade));
		request.setAttribute("gwamok", gwamok);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("lectureNo", lectureNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);
		
		// qna
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("qnaPaging", qnaPaging);
		request.setAttribute("QnAno", QnAno);
		request.setAttribute("qnaNowPage", qnaNowPage);
		request.setAttribute("qnaTotal", qnaTotal);
		
		//System.out.println(list.toString());
		// 3. 결과값을 보여줄 view 리턴
		return "sol_study/lectureList";
	}
}
