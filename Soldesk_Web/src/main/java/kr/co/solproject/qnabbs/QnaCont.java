package kr.co.solproject.qnabbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.reply.ReplyDTO;
import kr.co.solproject.reply.ReplyDAO;
import net.utility.Paging;
import net.utility.Utility;

@Controller
public class QnaCont {
	 @Autowired
	  private QnaDAO dao=null;
	 
	 @Autowired
	  private ReplyDAO rdao=null;
	 
	 public QnaCont() {
		    System.out.println("---------------QnaCont객체 생성");
	 }
	 
	@RequestMapping(value="/sol_qna/list.do")
	public String qnaList(HttpServletRequest request,HttpSession session) {
		
		String url="list.do";
		int nowPage=1;	
		int numPerPage=5;	
		
		int recNo=1;
		
		String col1=null;
		if(request.getParameter("col1")!="") {
			col1=request.getParameter("col1");
			System.out.println("컬럼: "+col1);
		}
		
		String col2=null;
		if(request.getParameter("col2")!="") {
			col2=request.getParameter("col2");
			System.out.println("컬럼: "+col2);
		}

		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno=((nowPage-1)*numPerPage);
		
		Map map=new HashMap();
		map.put("col1", col1);
		map.put("col2", col2);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list=dao.getQnaList(map);
		String dbean=Utility.getDate();
		int total=dao.getQnaTotal(map);
		
		String paging=Paging.paging(total,nowPage,numPerPage,col1,col2,url);
		
		recNo=total-(nowPage-1)*numPerPage;
		
		int totalPage = (total / numPerPage)+1;
		
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("col1", col1);
		request.setAttribute("col2", col2);
		request.setAttribute("total", total);
		session.setAttribute("s_id", session.getAttribute("s_id"));
	
		return "sol_qna/qnaList";
	}//end
	
	@RequestMapping(value="/sol_qna/insert.do",method=RequestMethod.GET)
	public String qnaInsFrom(HttpServletRequest request) {
		return "sol_qna/qnaForm";
	}//end
	
	@RequestMapping(value="/sol_qna/insert.do",method=RequestMethod.POST)
	public String qnaInsProc(QnaDTO dto, HttpServletRequest request, HttpSession session) {
	    String passwd = (String) session.getAttribute("s_id");
	    dto.setPasswd(passwd);
	    dto.setId(passwd);
	    
	    boolean flag = dao.qnaInsert(dto);
	    if(flag == true){
	      request.setAttribute("msg", 1);
	    }else{
	    	request.setAttribute("msg", "게시글 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='목록' onclick=\"location.href='list.do';\">");
			return "sol_qna/error";
	    }
		
		return "sol_qna/qnaList";
	}//end
	
	@RequestMapping(value="/sol_qna/read.do",method=RequestMethod.GET)
	public String qnaRead(QnaDTO dto, HttpServletRequest request, HttpSession session) {
		int qnano = dto.getQnano();
		String s_id = (String) session.getAttribute("s_id");
		int recNo = Integer.parseInt(request.getParameter("recNo"));
		String mlevel = dao.getMlevel(s_id);
		
		dto = dao.qnaRead(qnano);
		
		if(dto.getPasswd().equals(s_id) || mlevel.equals("A") || dto.getQnashow().equals("Y")){
			dao.readCount(qnano);	
			ReplyDTO rdto = null;
			rdto = rdao.getReply(qnano, "Q");
			request.setAttribute("dto", dto);
			request.setAttribute("rdto", rdto);
			request.setAttribute("recNo", recNo);
			request.setAttribute("mlevel", mlevel);
			request.setAttribute("replyok", dto.getReplyok());
			
			return "sol_qna/qnaRead";
		}else{
			request.setAttribute("msg", 2);
			return "sol_qna/qnaList";
		}
	}//end

	@RequestMapping(value="/sol_qna/delete.do",method=RequestMethod.GET)
	public String qnaDelete(QnaDTO dto, HttpServletRequest request, HttpSession session) {
		
		Map map=new HashMap();
		map.put("tableno", dto.getQnano());
		map.put("tablename", "Q");
		
		dao.replyDelete(map);
		dao.qnaDelete(dto.getQnano());
		
		request.setAttribute("msg", 3);
		return "sol_qna/qnaList";
		
		
	}//end
	
	@RequestMapping(value="/sol_qna/update.do",method=RequestMethod.GET)
	public String qnaUpdate(QnaDTO dto,  HttpServletRequest request) {
		int recNo = Integer.parseInt(request.getParameter("recNo"));
		int qnano = dto.getQnano();
		dto = dao.qnaRead(qnano);
		if(dto.getReplyok().equals("Y")){
			return "redirect:read.do?qnano="+qnano+"&recNo="+recNo;
		}else{
			request.setAttribute("dto", dto);
			return "sol_qna/qnaUpdate";
		}
	}//end
	
	@RequestMapping(value="/sol_qna/update.do",method=RequestMethod.POST) 
	public String UpdateProc(QnaDTO dto, HttpServletRequest request) {
		int recNo = Integer.parseInt(request.getParameter("recNo"));
		Boolean flag = dao.qnaUpdate(dto);
		if(flag){
		 request.setAttribute("msg", 3);
		 return "redirect:read.do?qnano="+dto.getQnano()+"&recNo="+recNo;
		}else{
			request.setAttribute("msg", "게시글 수정에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='목록' onclick=\"location.href='list.do';\">");
			return "sol_qna/error";
		}
	}//end 

}



 
  