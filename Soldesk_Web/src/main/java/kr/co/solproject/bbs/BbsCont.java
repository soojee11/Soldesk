package kr.co.solproject.bbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BbsCont {

  @Autowired
  private BbsDAO dao=null;
  
  public BbsCont() {
    System.out.println("---------------BbsCont객체 생성");
  }
  
  @RequestMapping(value="/sol_bbs/bbslist.do")
  public String bbslist(HttpServletRequest req, HttpSession session){
    List list = null;
    
    list = dao.list();  // BbsDAO에서 list 가져오기 
    int recNo = list.size();
    
    req.setAttribute("list", list);
    req.setAttribute("recNo", recNo);
    
    return "/sol_bbs/bbsList";
  }
  
  @RequestMapping(value="/sol_bbs/create.do", method=RequestMethod.GET)
  public String bbsForm(){
    return "/sol_bbs/bbsForm";
  }
  
  @RequestMapping(value="/sol_bbs/create.do", method=RequestMethod.POST)
  public String bbsFormProc(BbsDTO dto, HttpServletRequest req, HttpSession session){
    // bbs insert 
    String subject = dto.getSubject().trim();
    String content = dto.getContent().trim();
    String passwd = (String) session.getAttribute("s_id");
    
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setPasswd(passwd);    // passwd를 사용자 id로 대체 
    
    boolean flag = dao.insert(dto);
    if(flag == true){
      String msg="";
      req.setAttribute("msg", msg);
    }
    
    return "/sol_bbs/bbsForm";
  }
  
}
