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
		System.out.println("---------------MyscoreDAO°´Ã¼ »ý¼ºµÊ");
	}
	
	public int getAnswer(Map map) {
		int res=0;
		try {
			res=mybatis.update("sol_myscore.insert",map);
		}	catch(Exception e) {
			System.out.println("getAnswer error: "+e);		
		}
		return res;
	}//end
	
	public List myscoreAnswer(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_question.myscoreAnswer", map);
			
		}	catch(Exception e) {
			System.out.println("myscoreAnswer error: "+e);		
		}
		return list;
	}//end
}

