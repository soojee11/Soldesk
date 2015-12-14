package kr.co.solproject.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.utility.Paging;
import net.utility.Utility;


@Controller
public class TestCont {

	@Autowired
	private TestDAO dao=null;
	
	public TestCont() {
		System.out.println("---------------testCont��ü ������");
	}
	
	//http://localhost:9090/solproject/sol_test/list.do
	@RequestMapping(value="/sol_test/list.do")
	public String list(HttpServletRequest request,HttpSession session) {

		String url="list.do";	// page��ũ�� �̵��� ������
		int nowPage=1;			// ����������, ������ ���۹�ȣ 0->1page
		int numPerPage=5;		// �������� ���ڵ� ��
		
		int recNo=1;	// �Խ��� ��Ͽ� ��µ� �� ��ȣ
		
		String col1=null;//null�̸� <dynamic prepend="where">�� ����ȵ�
		if(request.getParameter("col1")!="") {
			col1=request.getParameter("col1");
			//System.out.println("�г�: "+col1);
		}
		
		String col2=null;
		if(request.getParameter("col2")!="") {
			col2=request.getParameter("col2");
			//System.out.println("����: "+col2);
		}

		// ���� �������� ������ ������
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		//int sno=((nowPage-1)*numPerPage)+1;	//(0*5)+1=1,6,11
		int sno=((nowPage-1)*numPerPage);
		//int eno=nowPage*numPerPage;//1*5=5,10,15
		
		Map map=new HashMap();
		map.put("col1", col1);
		map.put("col2", col2);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		// 1. model���
		List list=dao.getList(map);
		String dbean=Utility.getDate();
		int total=dao.getTotal(map);
		
		String paging=Paging.paging(total,nowPage,numPerPage,col1,col2,url);
		
		recNo=total-(nowPage-1)*numPerPage;
		
		// 2. model����� ������� request������ ����
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col1", col1);
		request.setAttribute("col2", col2);
		request.setAttribute("total", total);
		session.setAttribute("s_id", session.getAttribute("s_id"));
	
		//System.out.println(list.toString());
		// 3. ������� ������ view ����
		return "sol_test/testList";
	}

}
