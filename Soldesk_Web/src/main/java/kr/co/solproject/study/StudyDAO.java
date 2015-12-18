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
    System.out.println("StudyDAO ��ü ����");
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
       insert(map);  // ������ �н����̺� isnert
      }
    }catch (Exception e){
      System.out.println("check ����: "+e);
    }
  }
  
  public void insert(Map map){
    try{
      mybatis.update("sol_study.insert", map);
      
    }
    catch (Exception e){
      System.out.println("insert ����: "+e);
    }
  }
  
  public void updateMemo(Map map){
    try{
     mybatis.update("sol_study.insertMemo", map); 
    }catch (Exception e){
      System.out.println("memo ���� ���д�: "+e);
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
     System.out.println("memo �б� ���д�: "+e);
   }
   
   return sdto;
  }
  
}
