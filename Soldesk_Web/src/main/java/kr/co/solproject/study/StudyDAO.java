package kr.co.solproject.study;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class StudyDAO {

private SqlMapClient mybatis; // Connection con
  public StudyDAO(){
    mybatis = GetSqlMapClient.get();  // con = dbopen.getConnection()
    System.out.println("StudyDAO 객체 생성");
  }
  
  public void check(String id, int lectureno){
    boolean flag = false;
    int cnt = 0;
    
    Map map = new HashMap();
    map.put("id", id);
    map.put("lectureno", lectureno);
    map.put("memo", "");
    map.put("memodate", "");
    
    try{
      cnt = (Integer) mybatis.queryForObject("sol_study.check", map);
      if(cnt>0) flag = true;
      
      if(flag == false){
       insert(map);  // 없으면 학습테이블에 isnert
      }
    }catch (Exception e){
      System.out.println("check 실패: "+e);
    }
  }
  
  public void insert(Map map){
    try{
      mybatis.update("sol_study.insert", map);
      
    }
    catch (Exception e){
      System.out.println("insert 실패: "+e);
    }
  }
  
  public void updateMemo(Map map){
    try{
     mybatis.update("sol_study.insertMemo", map); 
    }catch (Exception e){
      System.out.println("memo 저장 실패다: "+e);
    }
  }
  
  public StudyDTO read(String id, int lectureno){
   StudyDTO sdto = null;
   try{
    Map map = new HashMap();
    map.put("id", id);
    map.put("lectureno", lectureno);
    
    sdto = (StudyDTO) mybatis.queryForObject("sol_study.read", map);
    
   }catch (Exception e){
     System.out.println("memo 읽기 실패다: "+e);
   }
   
   return sdto;
  }
  
}
