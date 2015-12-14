package kr.co.solproject.player;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.solproject.player.PlayerDAO;
import kr.co.solproject.study.StudyDAO;
import kr.co.solproject.study.StudyDTO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class PlayerCont {
  
  @Autowired
  private PlayerDAO dao=null;  
  @Autowired
  private StudyDAO sdao=null;
  
  public PlayerCont() {System.out.println("PlayerCont ��ü ����");}
  
  @RequestMapping(value="/sol_player/player.do", method=RequestMethod.GET)
  public String createForm(HttpServletRequest req){
    // ���⼭ ������ ������ ��������     
    PlayerDTO dto = null;
    StudyDTO sdto = null;
    List list = null;
    
    String id = "soldesk";    // �켱������ id
    int lectureno = 7;        // default �켱������ �س� 
    
    if(req.getParameter("lectureno") != null){
      lectureno = Integer.parseInt(req.getParameter("lectureno"));
    }
    dto = dao.read(lectureno);  // play�Ǵ� �������� ���� �������� 
    
    int categoryno = dto.getCategoryno(); // play�Ǵ� ������� categoryno�� ��ġ�ϴ� ������ ��� �������� 
    list = dao.list(categoryno);
    
    int lecNo = list.size();
    
    req.setAttribute("lecNo", lecNo);
    req.setAttribute("list", list);
    req.setAttribute("dto", dto);
    
    // �н� ���̺� ������ �� ��� ����ֱ�( id�� lecturno�� ���� ���ڵ尡 �����ϸ� insert ���� ���� )
    sdao.check(id, lectureno);        // id �� lectureno �� ���� ���ڵ尡 �����ϴ� �� �˻� -> insert O / X
    
    sdto = sdao.read(id, lectureno);  // id �� lectureno �� ���� ���ڵ� memo �������� 
  //  System.out.println("---------------------"+sdto.getMemo());
      
    req.setAttribute("sdto", sdto);
    return "sol_player/player";
  }
  
  @RequestMapping(value="/sol_player/memoSave.do", method=RequestMethod.POST)
  public void save(StudyDTO dto, HttpServletResponse resp){
    //System.out.println("----------memo:"+dto.getMemo());
   // System.out.println("----------lectureno:"+dto.getLectureno());
    try {
      String id = "soldesk";
      
      // id�� lectureno�� ��ġ�ϴ� ���ڵ忡 update sol_study
      Map map = new HashMap();
      map.put("id", id);
      map.put("memo", dto.getMemo());
      map.put("lectureno", dto.getLectureno());
      
      sdao.updateMemo(map);
      
      resp.setContentType("text/html; charset=UTF-8");
      PrintWriter out=resp.getWriter();
      out.write("memo");
    } catch(Exception e){
      System.out.println(e);
    }
  }
  
  // admin index.jsp
  @RequestMapping(value="/sol_admin/admin.do")
  public String admin(){
    return "sol_admin/adminIndex";
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
