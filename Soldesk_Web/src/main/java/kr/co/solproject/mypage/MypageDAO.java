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

	public void calinsert(String id, int lectureno,String nowregdate) {
		int cnt = 0,cnt2=0;
		String rdt=null,rdt2=null,calno=null;
		Map map = new HashMap();
		map.put("id", id);
		map.put("lectureno", lectureno);
		map.put("nowregdate", nowregdate);

		try {
			cnt = (Integer) mybatis.queryForObject("sol_calendar.checkcount", map);
			
			System.out.println(id+" "+lectureno+" "+nowregdate);
			System.out.println("##cnt: "+cnt);
			
			if(cnt == 0){
				cnt2 = mybatis.update("sol_calendar.calinsert", map); 
			}
			else{
				rdt =  (String) mybatis.queryForObject("sol_calendar.checkrdt", map);
				System.out.println("##rdt: "+rdt); //regdate중 max최신값가져온다.
				calno =  (String) mybatis.queryForObject("sol_calendar.checkcalno", map);
				System.out.println("##calno: "+calno); //regdate중 max최신값가져온다.
				rdt2 =  rdt.substring(0, 10);
				System.out.println("##rdt2: "+rdt2);//시간제외해줌.
				
				Map map2 = new HashMap();
				map2.put("id", id);
				map2.put("lectureno", lectureno);
				map2.put("regdate", rdt);
				map2.put("calno", calno);
				
				if(nowregdate.equals(rdt2) ){
					cnt2 = mybatis.update("sol_calendar.calupdate", map2); 
					System.out.println("##calupdate: "+cnt2);
				}else{
					cnt2 = mybatis.update("sol_calendar.calinsert", map); 
					System.out.println("##calinsert: "+cnt2);
				}
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
	
	public List getLectureList() { //calendar,study,lecture조인해서 강의제목리스트GET
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getLectureList");

		} catch (Exception e) {
			System.out.println("getLectureList: " + e);
		}
		return list;
	}// end
	
}