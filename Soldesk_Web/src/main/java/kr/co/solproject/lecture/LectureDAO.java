package kr.co.solproject.lecture;

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
	}
	
	/** �н��ϱ� �Խñ� ��ȸ **/
	public List getList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_lecture.list",map);
		} catch (Exception e) {
			System.out.println("lecture list error"+e);
		}
		return list;
	}// end
	
	/** �н��ϱ� �Խñ� ��ȸ **/
	public int getTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_lecture.total",map);
		}	catch(Exception e) {
			System.out.println("getLectureTotal error: "+e);		
		}
		return res;
	}
	
	
}
