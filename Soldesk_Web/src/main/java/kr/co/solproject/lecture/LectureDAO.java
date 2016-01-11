package kr.co.solproject.lecture;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class LectureDAO {
	
	private SqlMapClient mybatis = null;
	
	public LectureDAO(){
		mybatis = GetSqlMapClient.get();
		System.out.println("---------------LectureDAO 객체 생성");
	}
	
	/** 학습하기 게시글 조회 **/
	public List getList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_lecture.list",map);
			//System.out.println(list.toString());
		} catch (Exception e) {
			System.out.println("lecture list error"+e);
		}
		return list;
	}// end
	
	/** 학습하기 게시글 갯수 조회 **/
	public int getTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_lecture.total",map);
		}	catch(Exception e) {
			System.out.println("getLectureTotal error: "+e);		
		}
		return res;
	}
	
	/** 학습하기 강좌설명 조회 **/
	public String getCategoryInfo(int grade, String gwamok){
		String categoryInfo = null;
		try {
			Map map = new HashMap();
			map.put("grade", grade);
			map.put("gwamok", gwamok);
			
			categoryInfo = (String) mybatis.queryForObject("sol_lecture.info",map);
			//System.out.println(">>>>>>>>>>>>>>"+categoryInfo);
			
		} catch (Exception e) {
			System.out.println("categoryInfo error: "+e);		
		}
		return categoryInfo;
	}
	
	public String checkAdmin(String adminId) {
		String mlevel = null;
		try {
			mlevel=(String) mybatis.queryForObject("sol_member.checkAdmin",adminId);
			//System.out.println("mlevel"+mlevel);
		}	catch(Exception e) {
			System.out.println("checkAdmin error: "+e);		
		}
		return mlevel;
	}
	
}
