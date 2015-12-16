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
		System.out.println("▶------MypageDAO()객체 생성됨...");
	}

	private SqlMapClient mybatis = null; // MyBATIS 호출

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

	
	 // 캘린더 테이블에 동영상 본 기록 집어넣기->insert(update는없음,계속insert)
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