package kr.co.solproject.example;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class ExampleDAO {
	private SqlMapClient mybatis=null;
	
	public ExampleDAO() {
		mybatis=GetSqlMapClient.get();
	}
}
