package kr.co.solproject.lecture;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.utility.Paging;
import net.utility.Utility;


@Controller
public class LectureCont {

	@Autowired
	private LectureDAO dao=null;
	
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
		
		if(request.getParameter("grade") != null){
			grade = Integer.parseInt(request.getParameter("grade"));
		}
		
		if(request.getParameter("gwamok")!=null) {
			gwamok=request.getParameter("gwamok");
		}
		
		int lectureNo=1;	// �Խ��� ��Ͽ� ��µ� �� ��ȣ

		// ���� �������� ������ ������
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		
		//int sno=((nowPage-1)*numPerPage)+1;	//(0*5)+1=1,6,11
		int sno=((nowPage-1)*numPerPage);
		//int eno=nowPage*numPerPage;//1*5=5,10,15
		
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("gwamok", gwamok);
		map.put("grade", grade);
		map.put("numPerPage", numPerPage);
		
		
		// 1. model���
		List list=dao.getList(map);
		String categoryInfo = dao.getCategoryInfo(grade, gwamok);
		String dbean=Utility.getDate();
		int total=dao.getTotal(map);
		
		String paging=Paging.paging4(total,nowPage,numPerPage,url);
		
		lectureNo=total-(nowPage-1)*numPerPage;
		
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
		
		//System.out.println(list.toString());
		// 3. ������� ������ view ����
		return "sol_study/lectureList";
	}
}
