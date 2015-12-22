package kr.co.solproject.member;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class VideoDAO {
  public VideoDAO() {
    mybatis = GetSqlMapClient.get();
    System.out.println("��------VideoDAO()��ü ������...");
  }
  
  private SqlMapClient mybatis = null; // MyBATIS ȣ��
  
  public VideoDTO getVideo(int videono){
    VideoDTO vdto = null;
    try{
      vdto = (VideoDTO) mybatis.queryForObject("sol_video.getVideo", videono);
    } catch (Exception e) {
      System.out.println(e);
    }
    return vdto;
  }
  
}
