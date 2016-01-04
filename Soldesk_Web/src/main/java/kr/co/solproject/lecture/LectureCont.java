package kr.co.solproject.lecture;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.solproject.lectureqna.LectureQnADAO;
import kr.co.solproject.postscript.PostscriptDAO;
import net.utility.Paging;


@Controller
public class LectureCont {

	@Autowired
	private LectureDAO dao=null;
	
	@Autowired
	private LectureQnADAO qnaDao=null;
	
	@Autowired
	private PostscriptDAO postDao = null;
	
	public LectureCont() {
		System.out.println("---------------LectureCont객체 생성");
	}

	@RequestMapping(value="/sol_study/lectureInfo.do")
	public String lectureInfo(HttpServletRequest request) {

		int grade = 1;
		String gwamok = "국어";

		if(request.getParameter("grade") != null){
			grade = Integer.parseInt(request.getParameter("grade"));
		}
			
		if(request.getParameter("gwamok")!=null) {
			gwamok=request.getParameter("gwamok");
		}
		
		request.setAttribute("grade", new Integer(grade));
		request.setAttribute("gwamok", gwamok);
		
		return "sol_study/lectureInfo";
	}
	
	@RequestMapping(value="/sol_study/lectureList.do")
	public String lectureList(HttpServletRequest request) {
		String url="lectureList.do";
		int grade = 1;			// default 1학년으로 설정 
		String gwamok = "국어";
		
		if(request.getParameter("grade") != null){
			grade = Integer.parseInt(request.getParameter("grade"));
		}
		
		if(request.getParameter("gwamok")!=null) {
			gwamok=request.getParameter("gwamok");
		}

		String categoryInfo = dao.getCategoryInfo(grade, gwamok);
		
		int tabNum=Integer.parseInt(request.getParameter("tabNum"));
		if(tabNum==1) {
			int nowPage=1;
			int numPerPage=5;
			int lectureNo=1;
				
			if(request.getParameter("nowPage")!=null) {
				nowPage=Integer.parseInt(request.getParameter("nowPage"));
			}
			int sno=((nowPage-1)*numPerPage);
			
			Map map=new HashMap();
			map.put("sno", sno);
			map.put("gwamok", gwamok);
			map.put("grade", grade);
			map.put("numPerPage", numPerPage);
			
			List list=dao.getList(map);
			int total=dao.getTotal(map);
			String paging=Paging.paging9(total,nowPage,numPerPage,url,tabNum,grade,gwamok);
			
			lectureNo=total - (nowPage - 1) * numPerPage + 1;
			
			request.setAttribute("categoryInfo", categoryInfo);
			request.setAttribute("list", list);
			request.setAttribute("grade", grade);
			request.setAttribute("gwamok", gwamok);
			request.setAttribute("paging", paging);
			request.setAttribute("lectureNo", lectureNo);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("total", total);
			request.setAttribute("tabNum", tabNum);
		}
		if(tabNum==2) {
			int qnaNowPage=1;
			int qnaNumPerPage=5;
			int QnAno = 1;
			
			if(request.getParameter("nowPage")!=null) {
				qnaNowPage=Integer.parseInt(request.getParameter("nowPage"));
			}
			int qno=((qnaNowPage-1)*qnaNumPerPage);
			
			Map qnaMap = new HashMap();
			qnaMap.put("qno", qno);
			qnaMap.put("gwamok", gwamok);
			qnaMap.put("grade", grade);
			qnaMap.put("qnaNumPerPage", qnaNumPerPage);
			
			List qnaList = qnaDao.getList(qnaMap);
			int qnaTotal = qnaDao.getTotal(qnaMap);
			String qnaPaging = Paging.paging9(qnaTotal, qnaNowPage, qnaNumPerPage, url, tabNum,grade,gwamok);
			
			QnAno = qnaTotal - (qnaNowPage - 1) * qnaNumPerPage + 1;

			request.setAttribute("categoryInfo", categoryInfo);
			request.setAttribute("grade", grade);
			request.setAttribute("gwamok", gwamok);
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("qnaPaging", qnaPaging);
			request.setAttribute("QnAno", QnAno);
			request.setAttribute("qnaNowPage", qnaNowPage);
			request.setAttribute("qnaTotal", qnaTotal);
			request.setAttribute("tabNum", tabNum);
			
		}
		if(tabNum==3) {
			int postNowPage=1;
			int postNumPerPage=5;
			int postNo = 1;
			
			if(request.getParameter("nowPage")!=null) {
				postNowPage=Integer.parseInt(request.getParameter("nowPage"));
			}
			int postno = ((postNowPage-1)*postNumPerPage);
			
			Map postMap = new HashMap();
			postMap.put("postno", postno);
			postMap.put("gwamok", gwamok);
			postMap.put("grade", grade);
			postMap.put("postNumPerPage", postNumPerPage);
			
			List postList = postDao.getList(postMap);
			int postTotal = postDao.getTotal(postMap);
			
			String postPaging = Paging.paging9(postTotal, postNowPage, postNumPerPage, url, tabNum,grade,gwamok);
			
			postNo = postTotal - (postNowPage - 1) * postNumPerPage + 1;
			
			request.setAttribute("categoryInfo", categoryInfo);
			request.setAttribute("grade", grade);
			request.setAttribute("gwamok", gwamok);
			request.setAttribute("postList", postList);
			request.setAttribute("postPaging", postPaging);
			request.setAttribute("postNo", postNo);
			request.setAttribute("postNowPage", postNowPage);
			request.setAttribute("postTotal", postTotal);

			request.setAttribute("tabNum", tabNum);
		}

		return "sol_study/lectureList";
	}
}
