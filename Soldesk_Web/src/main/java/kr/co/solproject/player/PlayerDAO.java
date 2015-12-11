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
    System.out.println("PlayerDAO 객체 생성");
  }
  
  // admin page에서 categoryno 가져오기 
  public int getCategoryno(Map map){
    int categoryno = 0;
    try{
      categoryno = (Integer) mybatis.queryForObject("sol_category.categorynoRead", map);
    }catch (Exception e){
      System.out.println("실패: "+e);
    }
    return categoryno;
  }
  
  // admin page 에서 동영상 등록 
  public boolean playerInsert(PlayerDTO dto){
    boolean flag = false;
    try{
      int cnt = mybatis.update("sol_category.lectureInsert", dto);
      if(cnt>0) flag = true;
    }catch (Exception e){
      System.out.println("실패다: "+e);
    }
    return flag;
  }
  
  public PlayerDTO read(int lectureno){
    PlayerDTO dto = null;
    try{
      dto = (PlayerDTO) mybatis.queryForObject("sol_category.lectureRead", lectureno);
    }catch (Exception e){
      System.out.println("read 실패다: "+e);
    }
    return dto;
  }
  
  public List list(int categoryno){
    List list = null;
    try{
      list = mybatis.queryForList("sol_category.lectureList", categoryno);
    }catch (Exception e){
      System.out.println("read 실패다: "+e);
    }
    return list;
  }
  
}
