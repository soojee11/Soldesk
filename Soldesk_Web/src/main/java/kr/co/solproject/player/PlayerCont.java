package kr.co.solproject.player;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.solproject.player.PlayerDAO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class PlayerCont {
  
  @Autowired
  private PlayerDAO dao=null;  
  
  public PlayerCont() {System.out.println("PlayerCont 객체 생성");}
  
  @RequestMapping(value="/player/player.do", method=RequestMethod.GET)
  public String createForm(){
     // 여기서 동영상 정보들 가져오기 
    return "player/player";
  }
  
  // admin index.jsp
  @RequestMapping(value="/admin/admin.do")
  public String admin(){
    return "admin/adminIndex";
  }
  
  // admin 동영상 등록 
  @RequestMapping(value="/admin/player/playerInsert.do", method=RequestMethod.GET)
  public String adminPlayInsert(){
    return "admin/player/playerInsert";
  }
  
  // admin 동영상 등록 form
  @RequestMapping(value="/admin/player/playerInsert.do", method=RequestMethod.POST)
  public String adminPlayInsertForm(PlayerDTO dto, HttpServletRequest req){

      // 전송된 파일이 저장될 실제 물리적인 경로 파악
      String basePath = Utility.getRealPath(req, "/storage");

      // 1)postMF 파일 관련
      MultipartFile posterMF = dto.getPosterMF();
      // 파일 저장 및 리네임된 파일명 변환
      String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
      dto.setPoster(poster);

      // 2) filenameMF 파일 관련
      MultipartFile filenameMF = dto.getFilenameMF();
      String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
      dto.setFilename(filename);
      dto.setFilesize(filenameMF.getSize());
       // categoryno
      int grade =  Integer.parseInt(req.getParameter("grade"));
      String gwamok = req.getParameter("gwamok").trim();
      
      Map map = new HashMap();
      map.put("grade", grade);
      map.put("gwamok", gwamok);
      
      int categoryno = dao.getCategoryno(map);
      System.out.println("---------------categoryno:"+categoryno);
      
      dto.setCategoryno(categoryno);
      
      boolean flag = dao.playerInsert(dto);
      if(flag){
        return "redirect:./list.do";
      }
      else{
        req.setAttribute("msg1", "글쓰기 실패!!<br/><br/>");
        req.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
        req.setAttribute("link2", "<input type='button' value='글 목록' onclick=\"location.href='./list.do'\">");
        
        return "bbs/error";
      }
  }
}
