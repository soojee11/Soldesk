package kr.co.solproject.bbs;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class BbsDAO {
  
  private SqlMapClient mybatis; // Connection con
  
  public BbsDAO(){
    mybatis = GetSqlMapClient.get();  // con = dbopen.getConnection()
    System.out.println("---------------BbsDAO ��ü ����");
  }
  
  // �Խñ� ��� 
  public boolean insert(BbsDTO dto){
    boolean flag = false;
    try{
      int cnt=mybatis.update("sol_bbs.insert",dto);
      if(cnt>0)
        flag=true;
    }catch (Exception e){
      System.out.println("����: "+e);
    }
    return flag;
  }
  
  // �Խù� ��� �ҷ����� 
  public List list(){
    List list = null;
    try{
      list = mybatis.queryForList("sol_bbs.list");
    }catch (Exception e){
      System.out.println("����: "+e);
    }
    return list;
  }
}
