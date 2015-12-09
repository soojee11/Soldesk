package kr.co.solproject;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class GetSqlMapClient {

	private static SqlMapClient sqlMapClient;	//Connection con
	
	//���� 1ȭ�� ����ǰ� ������
	static {
		try {
			
			Reader reader=Resources.getResourceAsReader("kr/co/solproject/SqlMapConfig.xml");
			sqlMapClient=SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
			
		}	catch(IOException e) {
			System.out.println("DB ���� ����"+e);
		}
	}
	
	public synchronized static SqlMapClient get() {	//DBOpen.getConnection()�� ������ �ƶ�
		return sqlMapClient;
	}
	
}
