package kr.co.solproject.mypage;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MypageController {

	@Autowired
	private MypageDAO dao = null;

	public MypageController() {
		System.out.println("��------MypageController()��ü ������...");
	}

	// --------------------------------------------------------------------
	@RequestMapping(value = "sol_mypage/calendar.do", method = RequestMethod.GET)
	public String calendar(String s_id,HttpServletRequest req, HttpSession session) {
		
		//�޷�---------------------------------------------------------------------------------------------------
		Calendar cal = Calendar.getInstance();

		//���� ��¥ ���ϱ�
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		//���� 0���� �����ϹǷ� 1�� ǥ�ø� ���� 1�� ���� �ݴϴ�.
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);

		//Ŭ���̾�Ʈ�� �����Ͽ� �Ѿ�� ��¥
		String strYear = req.getParameter("year");
		String strMonth = req.getParameter("month");

		//ǥ���� �޷��� ��,��
		int year = nowYear;
		int month = nowMonth;
		if (strYear != null) {// ���� ������
			year = Integer.parseInt(strYear);//Ŭ���̾�Ʈ�� ������ ���� �Է�
		}
		if (strMonth != null) {// ���� ������
			month = Integer.parseInt(strMonth);//Ŭ���̾�Ʈ�� ������ ���� �Է�
		}

		//���� �̵��� ���ϱ�
		int preYear = year, preMonth = month - 1;
		if (preMonth < 1) {//1�� ������ �۳� 12�� �̴ϱ�...
			preYear = year - 1;
			preMonth = 12;
		}

		//������ ���ϱ�
		int nextYear = year, nextMonth = month + 1;
		if (nextMonth > 12) {//12�� �������� ���� 1�� �̹Ƿ�...
			nextYear = year + 1;
			nextMonth = 1;
		}

		//ǥ���� �޷� ����
		cal.set(year, month - 1, 1);//��,��,��
		int startDay = 1;//���� ù ��
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		//�ų� �ش���� 1�� ���ϱ�
		int week = cal.get(Calendar.DAY_OF_WEEK);

		//�޷�------------------------------------------------------------------------------

		String promise = null;
		String name = null;
		promise = dao.getpromise(s_id);
		name = dao.getname(s_id);
		
		
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

	}// end
	
	
	
	
	
}
