package kr.co.solproject;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class GetSqlMapClient {

	private static SqlMapClient sqlMapClient;	//Connection con
	
	//최초 1화만 실행되고 공유됨
	static {
		try {
			
			Reader reader=Resources.getResourceAsReader("kr/co/solproject/SqlMapConfig.xml");
			sqlMapClient=SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
			
		}	catch(IOException e) {
			System.out.println("DB 연결 실패"+e);
		}
	}
	
	public synchronized static SqlMapClient get() {	//DBOpen.getConnection()과 유사한 맥락
		return sqlMapClient;
	}
	
}
