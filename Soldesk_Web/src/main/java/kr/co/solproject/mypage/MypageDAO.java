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
		int cnt = 0,cnt2 = 0;
		 boolean flag = false;
		Map map = new HashMap();
		map.put("id", id);
		map.put("lectureno", lectureno);

		try {
			cnt = (Integer) mybatis.queryForObject("sol_calendar.check", map);
		      if(cnt>0) flag = true;
		      
		      if(flag == false){
		    	  cnt = mybatis.update("sol_calendar.calinsert", map); 
		      }
		      else{
		    	  String regdate =(String) mybatis.queryForObject("sol_calendar.getregdate", map);
		    	  System.out.println("regdate : "+regdate);
		    	  
		    	  cnt2 = mybatis.update("sol_calendar.calupdate", map);
		      }
			
		} catch (Exception e) {
			System.out.println("calinsert: " + e);
		}
	}

	public List getregdate(String id) {
		List res = null;
		try {
			res = mybatis.queryForList("sol_calendar.getregdate", id);

		} catch (Exception e) {
			System.out.println("getregdate: " + e);
		}
		return res;
	}// end


		public List getMemoList() {
			List list = null;
			try {
				list = mybatis.queryForList("sol_calendar.getMemoList");

			} catch (Exception e) {
				System.out.println("getMemoList: " + e);
			}
			return list;
		}// end
	 
	 
}