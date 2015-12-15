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
		
		if(request.getParameter("grade") != null){
			grade = Integer.parseInt(request.getParameter("grade"));
		}
		
		if(request.getParameter("gwamok")!=null) {
			gwamok=request.getParameter("gwamok");
		}
		
		int lectureNo=1;	// �Խ��� ��Ͽ� ��µ� �� ��ȣ
		int QnAno = 1;
		
		// ���� �������� ������ ������		
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
		
		// 1. model���
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
		
		//System.out.println(list.toString());
		// 3. ������� ������ view ����
		return "sol_study/lectureList";
	}
}
