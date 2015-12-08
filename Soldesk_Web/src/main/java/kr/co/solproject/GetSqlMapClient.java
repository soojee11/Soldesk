package kr.co.solproject;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// SqlMapConfig.xml ������ �о�� ���� ���� ������ �ε�
// DBOpen Ŭ������ ���� ���

public class GetSqlMapClient {

    //iBatis ���� ��ü
  private static SqlMapClient sqlMapClient;
  
  // ���� 1ȸ�� ����ǰ� ����
  static{
    try{
      Reader reader = Resources.getResourceAsReader("kr/co/solproject/SqlMapConfig.xml");
      sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
      reader.close();
    }catch(IOException e){
      System.out.println("DB ���� ���� " + e);
    }
  }
  
  public synchronized static SqlMapClient get(){  //DBOpen.getConnection() �� ����� ���
    return sqlMapClient;
  }
}
