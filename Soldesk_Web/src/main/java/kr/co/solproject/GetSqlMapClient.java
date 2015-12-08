package kr.co.solproject;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// SqlMapConfig.xml 파일을 읽어와 쿼리 매핑 정보를 로딩
// DBOpen 클래스와 동일 기능

public class GetSqlMapClient {

    //iBatis 실행 객체
  private static SqlMapClient sqlMapClient;
  
  // 최초 1회만 실행되고 공유
  static{
    try{
      Reader reader = Resources.getResourceAsReader("kr/co/solproject/SqlMapConfig.xml");
      sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
      reader.close();
    }catch(IOException e){
      System.out.println("DB 연결 실패 " + e);
    }
  }
  
  public synchronized static SqlMapClient get(){  //DBOpen.getConnection() 과 비슷한 기능
    return sqlMapClient;
  }
}
