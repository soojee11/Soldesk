package kr.co.mybatis;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

//SqlMapConfig.xml ������ �о�� ���� ���� ������ �ε�
//DBOPen Ŭ������ ���� ���
public class GetSqlMapClient {
	//iBatis ���ఴü
	private static SqlMapClient sqlMapClient;	//Connection con
	
	//���� 1ȭ�� ����ǰ� ������
	static {
		try {
			//xml�� ���õ� ������ Resources��ü ����Ͽ� �ҷ���
			//sqlMapClient��ü�� sql�������� ����
			Reader reader=Resources.getResourceAsReader("kr/co/mybatis/SqlMapConfig.xml");
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
