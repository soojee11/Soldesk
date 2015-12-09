package kr.co.solproject.myscore;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class MyscoreDAO {
	private SqlMapClient mybatis=null;
	
	public MyscoreDAO() {
		mybatis=GetSqlMapClient.get();
	}
	
	public List getList(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("myscore.list",map);
		}	catch(Exception e) {
			System.out.println("list error: "+e);		
		}
		return list;
	}//end
	
}

