package kr.co.solproject.test;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class TestDAO {
	private SqlMapClient mybatis=null;
	
	public TestDAO() {
		mybatis=GetSqlMapClient.get();
		System.out.println("---------------testCont°´Ã¼ »ý¼ºµÊ");
	}
	
	public List getList(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_test.list",map);

		}	catch(Exception e) {
			System.out.println("list error: "+e);		
		}
		return list;
	}//end
	
	public int getTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_test.total",map);
		}	catch(Exception e) {
			System.out.println("getTotal error: "+e);		
		}
		return res;
	}
	
}

