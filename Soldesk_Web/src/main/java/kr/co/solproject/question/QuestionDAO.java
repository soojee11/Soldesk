package kr.co.solproject.question;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class QuestionDAO {
	private SqlMapClient mybatis=null;
	
	public QuestionDAO() {
		mybatis=GetSqlMapClient.get();
		System.out.println("---------------QuestionDAO°´Ã¼ »ý¼ºµÊ");
	}
	
	public List getList(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("question.list",map);
		}	catch(Exception e) {
			System.out.println("list error: "+e);		
		}
		return list;
	}//end
	
}

