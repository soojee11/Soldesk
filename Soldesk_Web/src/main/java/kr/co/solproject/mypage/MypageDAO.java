package kr.co.solproject.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.env.SystemEnvironmentPropertySource;
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

	
	
//-------------------------------------------------------------------------------
		
	
	public void calinsert(String id, int lectureno,String nowregdate) {
		int cnt = 0,cnt2=0;
		String rdt=null,rdt2=null,calno=null;
		Map map = new HashMap();
		map.put("id", id);
		map.put("lectureno", lectureno);
		map.put("nowregdate", nowregdate);

		try {
			cnt = (Integer) mybatis.queryForObject("sol_calendar.checkcount", map);
			
			//System.out.println(id+" | "+lectureno+" | "+nowregdate);
			//System.out.println("##cnt: "+cnt);
			
			if(cnt == 0){
				cnt2 = mybatis.update("sol_calendar.calinsert", map); 
				//System.out.println("##calinsert: "+cnt2);
			}
			else{
				rdt =  (String) mybatis.queryForObject("sol_calendar.checkrdt", map);
				//System.out.println("##rdt: "+rdt); //regdate�� max�ֽŰ������´�.
				
				calno =  (String) mybatis.queryForObject("sol_calendar.checkcalno", map);
				//System.out.println("##calno: "+calno); //regdate�� max�ֽŰ������´�.
				
				rdt2 =  rdt.substring(0, 10);
				//System.out.println("##rdt2: "+rdt2);//�ð���������.
				
				Map map2 = new HashMap();
				map2.put("id", id);
				map2.put("lectureno", lectureno);
				map2.put("regdate", rdt);
				map2.put("calno", calno);
				
				
				if(nowregdate.equals(rdt2) ){
					cnt2 = mybatis.update("sol_calendar.calupdate", map2); 
					//System.out.println("###calupdate: "+cnt2);
				
				}else{
					cnt2 = mybatis.update("sol_calendar.calinsert", map); 
					//System.out.println("###calinsert: "+cnt2);
				}
			}
			
			
			
		} catch (Exception e) {
			System.out.println("calinsert: " + e);
		}
	}

	
//-------------------------------------------------------------------------------
	
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
	
	public List getLectureList() { //calendar,study,lecture�����ؼ� �������񸮽�ƮGET
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getLectureList");

		} catch (Exception e) {
			System.out.println("getLectureList: " + e);
		}
		return list;
	}// end
	
	public List getMaxrdtList(String id) { //calendar,study,lecture�����ؼ� max(regdate)����ƮGET
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getMaxrdtList",id);

		} catch (Exception e) {
			System.out.println("getMaxrdtList: " + e);
		}
		return list;
	}// end
	
	
	
	
	public List getmemodateList(String id) { //max(memodate)����ƮGET
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getmemodateList",id);

		} catch (Exception e) {
			System.out.println("getmemodateList: " + e);
		}
		return list;
	}// end
		
	
	public List getMaxregdtList(String id) { //calendar,study,lecture�����ؼ� max(regdate)����ƮGET
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getMaxregdtList",id);

		} catch (Exception e) {
			System.out.println("getMaxregdtList: " + e);
		}
		return list;
	}// end
	
	
	
	public List getMyscoretList() { //myscore,test,calendar����
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getMyscoretList");

		} catch (Exception e) {
			System.out.println("getMyscoretList: " + e);
		}
		return list;
	}// end	
	
	
	
	
	public List getbbslist(Map map) { //sol_Bbs
		List list = null;
		try {
			//System.out.println("map"+map.toString());
			list = mybatis.queryForList("sol_calendar.getbbslist",map);
			//System.out.println(list.toString());
			//System.out.println("0"+list);
			
		} catch (Exception e) {
			System.out.println("getbbslist: " + e);
		}
		return list;
	}// end	
	
	
	
	public List getqnalist(Map map2) { //sol_qna
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.getqnalist",map2);

			//System.out.println("qna ="+list);
			
			
		} catch (Exception e) {
			System.out.println("getqnalist: " + e);
		}
		return list;
	}// end	
	
	
	public List getMyscoretList2(String id) { //sol_qna
		List list = null;
		try {
			list = mybatis.queryForList("sol_calendar.myscorelist2",id);
			//System.out.println("myscorelist2: " +list);
		} catch (Exception e) {
			System.out.println("myscorelist2: " + e);
		}
		return list;
	}// end	
	
	// �Խù� ��ü ���� �ҷ�����
		public int getTotal(String id) {
			int cnt = 0;
			try {
				cnt = (Integer) mybatis.queryForObject("sol_calendar.total",id);
					//System.out.println(cnt);
					
			} catch (Exception e) {
				System.out.println("getTotal() ����: " + e);
			}
			return cnt;
		}
	
		// �Խù� ��ü ���� �ҷ�����
		public int getTotal2(String id) {
			int cnt = 0;
			try {
				cnt = (Integer) mybatis.queryForObject("sol_calendar.total2",id);
			} catch (Exception e) {
				System.out.println("getTotal2() ����: " + e);
			}
			return cnt;
		}
}