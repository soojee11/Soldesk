package kr.co.solproject.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.admin.AdminDAO;
import kr.co.solproject.reply.ReplyDTO;
import net.utility.Paging;

@Controller
public class BbsCont {

  @Autowired
  private BbsDAO dao=null;
  
  @Autowired
  private AdminDAO admindao=null;
  
  public BbsCont() {
    System.out.println("---------------BbsCont��ü ����");
  }
  
  @RequestMapping(value="/sol_bbs/bbslist.do")
  public String bbslist(HttpServletRequest req, HttpSession session){
	
	  //notice list
	  Map noticemap = new HashMap();
	  noticemap.put("passwd", "������");
	  noticemap.put("noticeshow", "Y");
	  
	  List noticeList = null;
	  noticeList=admindao.noticeList(noticemap); 
	  int noticeTotal=admindao.getNoticeTotal(noticemap);

	// bbs list
	  
	  //�˻�
	  String col1=null;
		if(req.getParameter("col1")!="") {
			col1=req.getParameter("col1");
			System.out.println("�÷�: "+col1);
		}
		
		String col2=null;
		if(req.getParameter("col2")!="") {
			col2=req.getParameter("col2");
			System.out.println("�÷�: "+col2);
		}
	  
    int nowPage=1;      // ����������, ������ ���۹�ȣ 0->1page
    int numPerPage=10-noticeTotal;   // �������� ���ڵ� ��
    String url="bbslist.do";  // �̵��� ������ 
    
    // ���� �������� ������ ������    
    if(req.getParameter("nowPage")!=null) {
      nowPage=Integer.parseInt(req.getParameter("nowPage"));
    }
    
    int sno=((nowPage-1)*numPerPage);
    System.out.println("sno: "+sno);
    List list = null;
    Map map = new HashMap();
    map.put("sno", sno);
    map.put("numPerPage", numPerPage);
    map.put("passwd", "������");
    map.put("col1", col1);
	map.put("col2", col2);
    
    list=dao.list(map); // BbsDAO���� list �������� 
    int total=dao.getTotal(map);
    
    String paging=Paging.paging4(total, nowPage, numPerPage, url);
    if(col1 != null){
    	paging=Paging.paging(total,nowPage,numPerPage,col1,col2,url);
    }
    System.out.println("bbs total: "+total);
    int recNo = total - (nowPage - 1) * numPerPage + 1 ;
    int totalPage = (int) Math.ceil((double)total/(double)numPerPage);
    
    req.setAttribute("list", list);
    req.setAttribute("nlist", noticeList);
    req.setAttribute("recNo", recNo);
    req.setAttribute("paging", paging);
    req.setAttribute("col1", col1);
    req.setAttribute("col2", col2);
    req.setAttribute("nowPage", nowPage);
    req.setAttribute("totalPage", totalPage);
    req.setAttribute("total", total);
    req.setAttribute("ntotal", noticeTotal);
    
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
  public String bbsRead(BbsDTO dto, ReplyDTO rdto, HttpServletRequest req){
    dao.increment(dto);
    dto = dao.read(dto); // dto �� ����� bbsno �ѱ�
    req.setAttribute("nowPage", req.getParameter("nowPage"));
    String content = "";
    if(dto.getPasswd().equals("������")){
    	content =dto.getContent();
    	content= content.replaceAll("=\"../", "=\"");
    	dto.setContent(content);
    }
    req.setAttribute("dto", dto);
    //��۸���Ʈ
    List list=null;
    list=dao.bbsReplyList(dto.getBbsno());
    req.setAttribute("list", list);
    
    //��ۼ�
    int replycnt=dao.bbsReplyCnt(dto.getBbsno());
    req.setAttribute("replycnt", replycnt);

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
  
}
