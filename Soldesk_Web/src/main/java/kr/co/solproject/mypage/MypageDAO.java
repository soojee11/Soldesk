package kr.co.solproject.mypage;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class MypageDAO {

	public MypageDAO() {
		mybatis = GetSqlMapClient.get();
		System.out.println("��------MypageDAO()��ü ������...");
	}

	private SqlMapClient mybatis = null; // MyBATIS ȣ��

	// --------------------------------------------------------------------

	public String getpromise(String id) {
		System.out.println("#" + id + "#");
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_calendar.getpromise", id);
			System.out.println("#" + res + "#");
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end

	public String getname(String id) {
		System.out.println("#" + id + "#");
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_calendar.getname", id);
			System.out.println("#" + res + "#");
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
}