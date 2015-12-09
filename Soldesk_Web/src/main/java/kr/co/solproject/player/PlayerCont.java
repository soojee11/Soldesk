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
  
  public PlayerCont() {System.out.println("PlayerCont ��ü ����");}
  
  @RequestMapping(value="/player/player.do", method=RequestMethod.GET)
  public String createForm(){
     // ���⼭ ������ ������ �������� 
    return "player/player";
  }
  
  // admin index.jsp
  @RequestMapping(value="/admin/admin.do")
  public String admin(){
    return "admin/adminIndex";
  }
  
  // admin ������ ��� 
  @RequestMapping(value="/admin/player/playerInsert.do", method=RequestMethod.GET)
  public String adminPlayInsert(){
    return "admin/player/playerInsert";
  }
  
  // admin ������ ��� form
  @RequestMapping(value="/admin/player/playerInsert.do", method=RequestMethod.POST)
  public String adminPlayInsertForm(PlayerDTO dto, HttpServletRequest req){

      // ���۵� ������ ����� ���� �������� ��� �ľ�
      String basePath = Utility.getRealPath(req, "/storage");

      // 1)postMF ���� ����
      MultipartFile posterMF = dto.getPosterMF();
      // ���� ���� �� �����ӵ� ���ϸ� ��ȯ
      String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
      dto.setPoster(poster);

      // 2) filenameMF ���� ����
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
        req.setAttribute("msg1", "�۾��� ����!!<br/><br/>");
        req.setAttribute("link1", "<input type='button' value='�ٽýõ�' onclick=\"history.back();\">");
        req.setAttribute("link2", "<input type='button' value='�� ���' onclick=\"location.href='./list.do'\">");
        
        return "bbs/error";
      }
  }
}
