package kr.co.solproject.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.study.StudyDTO;

@Component
public class MypageDAO {

	public MypageDAO() {
		mybatis = GetSqlMapClient.get();
		System.out.println("��------MypageDAO()��ü ������...");
	}

	private SqlMapClient mybatis = null; // MyBATIS ȣ��

	// --------------------------------------------------------------------

	public String getpromise(String id) {
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_calendar.getpromise", id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end

	public String getname(String id) {
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_calendar.getname", id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end

	
	 // Ķ���� ���̺� ������ �� ��� ����ֱ�->insert(update�¾���,���insert)
	public void calinsert(String id, int lectureno) { 
		int cnt = 0;

		Map map = new HashMap();
		map.put("id", id);
		map.put("lectureno", lectureno);
		map.put("regdate", "");

		try {
				cnt = (Integer) mybatis.insert("sol_calendar.insert", map);
				
		} catch (Exception e) {                                
			System.out.println(e);
		}
	}
	
	public String getregdate(String id) {
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_calendar.getregdate", id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end

}