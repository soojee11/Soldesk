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
    System.out.println("---------------BbsDAO 객체 생성");
  }
  
  // 게시글 등록 
  public boolean insert(BbsDTO dto){
    boolean flag = false;
    try{
      int cnt=mybatis.update("sol_bbs.insert",dto);
      if(cnt>0)
        flag=true;
    }catch (Exception e){
      System.out.println("실패: "+e);
    }
    return flag;
  }
  
  // 게시물 목록 불러오기 
  public List list(){
    List list = null;
    try{
      list = mybatis.queryForList("sol_bbs.list");
    }catch (Exception e){
      System.out.println("실패: "+e);
    }
    return list;
  }
  
  // bbs 상세보기
  public BbsDTO read(BbsDTO dto){
    try{
      dto = (BbsDTO) mybatis.queryForObject("sol_bbs.read", dto.getBbsno());
    }
    catch (Exception e){
      System.out.println("실패: "+e);
    }
    return dto;
  }
  
  //bbs 조회수 올리기
  public void increment(BbsDTO dto){
    try{
      mybatis.update("sol_bbs.increment", dto.getBbsno());
    }catch (Exception e){
      System.out.println("실패: "+e);
    }
  }
   // bbs 수정
  public void update(BbsDTO dto){
    try{
      
    }catch (Exception e){
      System.out.println("실패: "+e);
    }
  }
}
