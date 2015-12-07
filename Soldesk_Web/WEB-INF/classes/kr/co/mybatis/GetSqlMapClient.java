package kr.co.mybatis;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

//SqlMapConfig.xml 파일을 읽어와 쿼리 매핑 정보를 로딩
//DBOPen 클래스와 동일 기능
public class GetSqlMapClient {
	//iBatis 실행객체
	private static SqlMapClient sqlMapClient;	//Connection con
	
	//최초 1화만 실행되고 공유됨
	static {
		try {
			//xml에 관련된 문서는 Resources객체 사용하여 불러옴
			//sqlMapClient객체에 sql관련정보 저장
			Reader reader=Resources.getResourceAsReader("kr/co/mybatis/SqlMapConfig.xml");
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
