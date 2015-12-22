package kr.co.solproject.reply;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReplyCont {
	@Autowired
	  private ReplyDAO dao=null;
	
	 public ReplyCont() {
		    System.out.println("----------sol-----ReplyCont��ü ����");
	 }
	 
	 @RequestMapping(value = "/sol_qna/create.do", method = RequestMethod.POST)
		public void createPrco(ReplyDTO dto, HttpServletResponse resp) {
			try {
				dto.setTablename("Q");
				int res = dao.QnaReplyCreate(dto);
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				if (res == 1) { 
					String str = "";
					dao.setReplyOk(dto.getTableno(),dto.getTablename());
					str += "�亯��Ͽ� �����Ͽ����ϴ�. ";
					out.print(str);
				} else {
					out.print("�亯��Ͽ� �����Ͽ����ϴ�. �ٽ� �õ��� �ּ��� ! ");
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}// end

	 @RequestMapping(value = "/sol_qna/replyDel.do", method = RequestMethod.POST)
	 public void replyDelProc(ReplyDTO dto, HttpServletResponse resp, HttpSession session) {
		 try {
			 	resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				String s_id = (String) session.getAttribute("s_id");
				
				Map map = new HashMap();
			 	map.put("passwd", s_id);
			 	map.put("replyno", dto.getReplyno());
			 
			 	int check_res = dao.checkPasswd(map,"Q");
			 	if(check_res == 1){	// ��й�ȣ�� ��ġ�ϸ� ��������
			 		dto.setTablename("Q");
				
			 		int res1 = dao.setReplyNo(dto.getTableno(),dto.getTablename());
			 		int res2 = dao.replyDel(dto.getReplyno());
			 		if(res1 == 1 && res2 ==1){
			 			out.print("success/�亯�� ������ �Ϸ�Ǿ����ϴ�. ");
			 		}else{
			 			out.print("fail2/�亯�� ������ �����Ͽ����ϴ�.\n\n �ٽýõ� ���ּ���. ");
			 		}
			 	}else{	// ��й�ȣ�� ��ġ���� ���� ���
			 		out.print("fail1/������ �ۼ��� ���� �ƴմϴ�.\n\n �ٽýõ� ���ּ���. ");
			 	}
			} catch (Exception e) {
				System.out.println(e);
			}
	 }//end
	 
	@RequestMapping(value = "/sol_qna/replyUpdate.do", method = RequestMethod.GET)
	public void replyUpdate(ReplyDTO dto, HttpServletResponse resp, HttpSession session) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String s_id = (String) session.getAttribute("s_id");
			
			Map map = new HashMap();
			map.put("passwd", s_id);
			map.put("replyno", dto.getReplyno());
			
			int res = dao.checkPasswd(map,"Q");
			if(res == 1){
				out.print("success/�亯���� �����Ͻðڽ��ϱ�? ");
			}else{
				out.print("fail/������ �ۼ��� ���� �ƴմϴ�.\n\n �ٽýõ� ���ּ���. ");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}//end

}
