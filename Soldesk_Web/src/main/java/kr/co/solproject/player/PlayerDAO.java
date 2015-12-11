package kr.co.solproject.player;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class PlayerDAO {

  private SqlMapClient mybatis; // Connection con
  
  public PlayerDAO(){
    mybatis = GetSqlMapClient.get();  // con = dbopen.getConnection()
    System.out.println("PlayerDAO ��ü ����");
  }
  
  // admin page���� categoryno �������� 
  public int getCategoryno(Map map){
    int categoryno = 0;
    try{
      categoryno = (Integer) mybatis.queryForObject("sol_category.categorynoRead", map);
    }catch (Exception e){
      System.out.println("����: "+e);
    }
    return categoryno;
  }
  
  // admin page ���� ������ ��� 
  public boolean playerInsert(PlayerDTO dto){
    boolean flag = false;
    try{
      int cnt = mybatis.update("sol_category.lectureInsert", dto);
      if(cnt>0) flag = true;
    }catch (Exception e){
      System.out.println("���д�: "+e);
    }
    return flag;
  }
  
  public PlayerDTO read(int lectureno){
    PlayerDTO dto = null;
    try{
      dto = (PlayerDTO) mybatis.queryForObject("sol_category.lectureRead", lectureno);
    }catch (Exception e){
      System.out.println("read ���д�: "+e);
    }
    return dto;
  }
  
  public List list(int categoryno){
    List list = null;
    try{
      list = mybatis.queryForList("sol_category.lectureList", categoryno);
    }catch (Exception e){
      System.out.println("read ���д�: "+e);
    }
    return list;
  }
  
}
