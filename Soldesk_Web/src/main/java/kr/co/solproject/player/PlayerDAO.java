package kr.co.solproject.player;

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
  
  public int getCategoryno(Map map){
    int categoryno = 0;
    try{
      categoryno = (Integer) mybatis.queryForObject("sol_category.read", map);
    }catch (Exception e){
      System.out.println("실패: "+e);
    }
    return categoryno;
  }
  
  public boolean playerInsert(PlayerDTO dto){
    
    boolean flag = false;
    try{
      int cnt = (Integer) mybatis.insert("sol_category.insert", dto);
      if(cnt>0) flag = true;
    }catch (Exception e){
      System.out.println("실패다: "+e);
    }
    return flag;
  }
  
}
