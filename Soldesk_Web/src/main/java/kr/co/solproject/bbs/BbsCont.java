package kr.co.solproject.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.utility.Paging;
import net.utility.Utility;

@Controller
public class BbsCont {

  @Autowired
  private BbsDAO dao=null;
  
  public BbsCont() {
    System.out.println("---------------BbsCont��ü ����");
  }
  
  @RequestMapping(value="/sol_bbs/bbslist.do")
  public String bbslist(HttpServletRequest req, HttpSession session){
    int nowPage=1;      // ����������, ������ ���۹�ȣ 0->1page
    int numPerPage=5;   // �������� ���ڵ� ��
    String url="bbslist.do";  // �̵��� ������ 
    
    // ���� �������� ������ ������    
    if(req.getParameter("nowPage")!=null) {
      nowPage=Integer.parseInt(req.getParameter("nowPage"));
    }
    
    int sno=((nowPage-1)*numPerPage);
    
    List list = null;
    
    Map map = new HashMap();
    map.put("sno", sno);
    map.put("numPerPage", numPerPage);
    
    list=dao.list(map); // BbsDAO���� list �������� 
    int total=dao.getTotal();
    String paging=Paging.paging4(total,nowPage,numPerPage,url);
    
    int recNo = total - (nowPage - 1) * numPerPage + 1 ;
    int totalPage = (int) Math.ceil((double)total/(double)numPerPage);
    
    req.setAttribute("list", list);
    req.setAttribute("recNo", recNo);
    req.setAttribute("paging", paging);
    req.setAttribute("nowPage", nowPage);
    req.setAttribute("totalPage", totalPage);
    req.setAttribute("total", total);
    
    return "/sol_bbs/bbsList";
  }
  
  @RequestMapping(value="/sol_bbs/create.do", method=RequestMethod.GET)
  public String bbsForm(){
    return "/sol_bbs/bbsForm";
  }
  
  @RequestMapping(value="/sol_bbs/create.do", method=RequestMethod.POST)
  public String bbsFormProc(BbsDTO dto, HttpServletRequest req, HttpSession session){
    // bbs insert 
    String subject = req.getParameter("subject");
    String content = req.getParameter("content");
    String passwd = (String) session.getAttribute("s_id");
    
    if(content.equals("<p>&nbsp;</p>")){
      content = "���� ����";
    }
    
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setPasswd(passwd);    // passwd�� ����� id�� ��ü 
    
    boolean flag = dao.insert(dto);
    if(flag == true){
      String msg="";
      req.setAttribute("msg", msg);
    }
    
    return "/sol_bbs/bbsForm";
  }
  
  @RequestMapping(value="/sol_bbs/bbsread.do")
  public String bbsRead(BbsDTO dto, HttpServletRequest req){
    dao.increment(dto);
    dto = dao.read(dto); // dto �� ����� bbsno �ѱ�
    req.setAttribute("nowPage", req.getParameter("nowPage"));
    req.setAttribute("dto", dto);
    return "/sol_bbs/bbsRead";
  }
  
  @RequestMapping(value="/sol_bbs/bbsupdate.do", method=RequestMethod.GET)
  public String bbsUpdate(BbsDTO dto, HttpServletRequest req){
    dto = dao.read(dto);
    req.setAttribute("dto", dto);
    req.setAttribute("nowPage", req.getParameter("nowPage"));
    return "/sol_bbs/bbsUpdate";
  }
  
  @RequestMapping(value="/sol_bbs/bbsupdate.do", method=RequestMethod.POST)
  public String bbsUpdateProc(BbsDTO dto,HttpServletRequest req){
    boolean flag = false;
    flag = dao.update(dto);
    if(flag == true){
      req.setAttribute("dto", dto);
      req.setAttribute("nowPage", req.getParameter("nowPage"));
      req.setAttribute("msg", "");
    }
    return "/sol_bbs/bbsUpdate";
  }
  
  @RequestMapping(value="/sol_bbs/bbsdelete.do")
  public String bbsDeleteProc(BbsDTO dto,HttpServletRequest req){
    boolean flag = false;
    flag = dao.delete(dto);
    if(flag == true){
      req.setAttribute("msg", "");
      req.setAttribute("nowPage", req.getParameter("nowPage"));
    }
    return "/sol_bbs/bbsDelete";
  }
  
  //---------------------------------------------------------------------------------
  
  @RequestMapping(value="/sol_bbs/edittest.do", method=RequestMethod.POST)
  public String editTest(HttpServletRequest req){
    System.out.println("content ��������:"+req.getParameter("content"));
    
    return "/sol_bbs/test1";
  }
}
