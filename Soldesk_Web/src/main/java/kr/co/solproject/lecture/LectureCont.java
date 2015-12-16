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
import net.utility.Utility;


@Controller
public class LectureCont {

	@Autowired
	private LectureDAO dao=null;
	
	@Autowired
	private LectureQnADAO qnaDao=null;
	
	@Autowired
	private PostscriptDAO postDao = null;
	
	public LectureCont() {
		System.out.println("---------------LectureCont��ü ����");
	}
	
	//http://localhost:9090/solproject/sol_study/lectureList.do"
	@RequestMapping(value="/sol_study/lectureList.do")
	public String list(HttpServletRequest request) {

		String url="lectureList.do";	// page��ũ�� �̵��� ������
		int nowPage=1;			// ����������, ������ ���۹�ȣ 0->1page
		int numPerPage=5;		// �������� ���ڵ� ��
		int grade = 1;			// default 1�г����� ���� 
		String gwamok = "����";
		
		int qnaNowPage=1;
		int qnaNumPerPage=5;
		
		int postNowPage=1;
		int postNumPerPage=5;
		
		if(request.getParameter("grade") != null){
			grade = Integer.parseInt(request.getParameter("grade"));
		}
		
		if(request.getParameter("gwamok")!=null) {
			gwamok=request.getParameter("gwamok");
		}
		
		int lectureNo=1;	// �Խ��� ��Ͽ� ��µ� �� ��ȣ
		int QnAno = 1;
		int postscriptNo = 1;
		
		// ���� �������� ������ ������		
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		if(request.getParameter("qnaNowPage")!=null) {
			qnaNowPage=Integer.parseInt(request.getParameter("qnaNowPage"));
		}
		
		if(request.getParameter("postNowPage")!=null) {
			postNowPage=Integer.parseInt(request.getParameter("postNowPage"));
		}
		
		//int sno=((nowPage-1)*numPerPage)+1;	//(0*5)+1=1,6,11
		int sno=((nowPage-1)*numPerPage);
		//int eno=nowPage*numPerPage;//1*5=5,10,15
		
		int qno=((qnaNowPage-1)*qnaNumPerPage);
		
		int postno = ((postNowPage-1)*postNumPerPage);
		
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
		
		Map postMap = new HashMap();
		postMap.put("postno", postno);
		postMap.put("gwamok", gwamok);
		postMap.put("grade", grade);
		postMap.put("postNumPerPage", postNumPerPage);
		
		
		// 1. model���
		List list=dao.getList(map);
		String categoryInfo = dao.getCategoryInfo(grade, gwamok);
		String dbean=Utility.getDate();
		int total=dao.getTotal(map);
		String paging=Paging.paging4(total,nowPage,numPerPage,url);
		
		// qna
		List qnaList = qnaDao.getList(qnaMap);
		int qnaTotal = qnaDao.getTotal(qnaMap);
		String qnaPaging = Paging.paging4(qnaTotal, qnaNowPage, qnaNumPerPage, url);
		
		// post
		List postList = postDao.getList(postMap);
		int postTotal = qnaDao.getTotal(postMap);
		String postPaging = Paging.paging4(postTotal, postNowPage, postNumPerPage, url);
		
		
		
		lectureNo=list.size();
		QnAno = qnaList.size();
		postscriptNo = postList.size();
		
		// 2. model����� ������� request������ ����
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
		
		// post
		request.setAttribute("postList", postList);
		request.setAttribute("postPaging", postPaging);
		request.setAttribute("postscriptNo", postscriptNo);
		request.setAttribute("postNowPage", postNowPage);
		request.setAttribute("postTotal", postTotal);
		
		
		//System.out.println(list.toString());
		// 3. ������� ������ view ����
		return "sol_study/lectureList";
	}
}
