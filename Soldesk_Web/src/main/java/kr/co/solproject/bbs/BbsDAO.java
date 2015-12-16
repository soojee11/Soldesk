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
  
  // bbs �󼼺���
  public BbsDTO read(BbsDTO dto){
    try{
      dto = (BbsDTO) mybatis.queryForObject("sol_bbs.read", dto.getBbsno());
    }
    catch (Exception e){
      System.out.println("����: "+e);
    }
    return dto;
  }
  
  //bbs ��ȸ�� �ø���
  public void increment(BbsDTO dto){
    try{
      mybatis.update("sol_bbs.increment", dto.getBbsno());
    }catch (Exception e){
      System.out.println("����: "+e);
    }
  }
   // bbs ����
  public void update(BbsDTO dto){
    try{
      
    }catch (Exception e){
      System.out.println("����: "+e);
    }
  }
}
