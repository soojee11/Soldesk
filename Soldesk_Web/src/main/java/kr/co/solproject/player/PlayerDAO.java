package kr.co.solproject.player;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.test.TestDTO;

@Component
public class PlayerDAO {

  private SqlMapClient mybatis;
  
  public PlayerDAO(){
    mybatis = GetSqlMapClient.get(); 
    System.out.println("PlayerDAO 객체 생성");
  }
  
  public Boolean categoryIns(Map map){
	  boolean flag=false;
	    try{
	    	int cnt=mybatis.update("sol_category.categoryIns",map);
			if(cnt>0)
				flag=true;
	    }catch (Exception e){
	      System.out.println("실패: "+e);
	    }
	    return flag;
	  }
  
  public int getCategoryno(Map map){
    int categoryno = 0;
    try{
      categoryno = (Integer) mybatis.queryForObject("sol_category.read", map);
      System.out.println("dao categoryno: "+categoryno);

    }catch (Exception e){
      System.out.println("실패: "+e);
    }
    return categoryno;
  }
  
  public boolean playerInsert(PlayerDTO dto){
    boolean flag = false;

	    try{
	    	//dto.getCategoryno();
	    	int cnt=mybatis.update("sol_category.insert",dto);
			if(cnt>0)
				flag=true;
	    }catch (Exception e){
	      System.out.println("실패: "+e);
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
  
  public CategoryDTO getCategory(int categoryno){
	   CategoryDTO dto = null;
	    try{
	      System.out.println("---------------getCategory 전");
	      dto = (CategoryDTO) mybatis.queryForObject("sol_category.getCategory", categoryno);
	      System.out.println("---------------getCategory 후");
	    }catch (Exception e){
	      System.out.println("read 실패다: "+e);
	    }
	    return dto;
	  }//end
  
}
