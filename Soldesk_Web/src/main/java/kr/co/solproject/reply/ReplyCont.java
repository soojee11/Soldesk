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
	private ReplyDAO dao = null;

	public ReplyCont() {
		System.out.println("---------------ReplyCont��ü ����");
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
				dao.setReplyOk(dto.getTableno(), dto.getTablename());
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

			int check_res = dao.checkPasswd(map, "Q");
			if (check_res == 1) { // ��й�ȣ�� ��ġ�ϸ� ��������
				dto.setTablename("Q");

				int res1 = dao.setReplyNo(dto.getTableno(), dto.getTablename());
				int res2 = dao.replyDel(dto.getReplyno());
				if (res1 == 1 && res2 == 1) {
					out.print("success/�亯�� ������ �Ϸ�Ǿ����ϴ�. ");
				} else {
					out.print("fail2/�亯�� ������ �����Ͽ����ϴ�.\n\n �ٽýõ� ���ּ���. ");
				}
			} else { // ��й�ȣ�� ��ġ���� ���� ���
				out.print("fail1/������ �ۼ��� ���� �ƴմϴ�.\n\n �ٽýõ� ���ּ���. ");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end

	@RequestMapping(value = "/sol_qna/replyUpdate.do", method = RequestMethod.GET)
	public void replyUpdate(ReplyDTO dto, HttpServletResponse resp, HttpSession session) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String s_id = (String) session.getAttribute("s_id");
			int tableno = dto.getTableno();

			Map map = new HashMap();
			map.put("passwd", s_id);
			map.put("replyno", dto.getReplyno());

			int res = dao.checkPasswd(map, "Q");
			String str = "";
			if (res == 1) {
				dto = dao.getReply(tableno, "Q");
				str += "<form name='frm' id ='frm' method='post'>";
				str += "<input type='hidden' name='replyno' id='replyno' value='"+dto.getReplyno()+"'>";
				str += "	<textarea name='content' id='content' rows='5' cols='70' style='width: 89%; height:53px;'>" + dto.getContent() + "</textarea>";
				str += "	<img src='img/btn.gif' onclick='replyUpdateProc(" + dto.getReplyno() + ")'/>";
				str += "</form>";
				//str += "<input type='button' class='btn btn-default' value='���' onclick='location.href=\"./list.do\"'>";
				out.print("success|" + str);
			} else {
				out.print("fail|������ �ۼ��� ���� �ƴմϴ�.\n\n �ٽýõ� ���ּ���. ");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end

	@RequestMapping(value = "/sol_qna/replyUpdateProc.do", method = RequestMethod.GET)
	public void replyUpdateProc(ReplyDTO dto, HttpServletResponse resp) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			boolean flag = dao.replyUpdate(dto);
			if (flag) {
				out.print("success|�亯�� ���� �Ϸ�! ");
			} else {
				out.print("fail|�亯�� ���� ����! \n\n �ٽýõ� ���ּ���. ");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end

	@RequestMapping(value = "/sol_bbs/bbsReplyCreate.do", method = RequestMethod.POST)
	public void bbsReplyCreate(ReplyDTO dto, HttpServletResponse resp) {
		try {
			dto.setTablename("B");
			//System.out.println(dto.toString());
			int res = dao.bbsReplyCreate(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (res == 1) {
				out.print("�亯��Ͽ� �����Ͽ����ϴ�. ");
			} else {
				out.print("�亯��Ͽ� �����Ͽ����ϴ�. �ٽ� �õ��� �ּ��� ! ");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end
	
	@RequestMapping(value = "/sol_bbs/bbsReplyDelete.do", method = RequestMethod.POST)
	public void bbsReplyDelete(ReplyDTO dto, HttpServletResponse resp) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			
			Map map = new HashMap();
			map.put("passwd", dto.getPasswd());
			map.put("replyno", dto.getReplyno());
			
			int check_res = dao.checkPasswd(map, "B");
			if(check_res==0) {
				out.print("FAIL/�н����尡 ��ġ���� �ʽ��ϴ�.\n\n�н����带 �ٽ� �Է����ּ���");
			}
			else {
				check_res=dao.bbsReplyDelete(dto.getReplyno());
				if(check_res==1) {
					out.print("SUCCESS/����� �����߽��ϴ�");
				}
				else {
					out.print("FAIL/��� ������ �����߽��ϴ�. �ٽ� �õ��� �ּ���");
				}
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end
	
	@RequestMapping(value = "/sol_bbs/bbsReplyUpdate.do", method = RequestMethod.GET)
	public void bbsReplyUpdate(ReplyDTO dto, HttpServletResponse resp, HttpSession session) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String s_id = (String) session.getAttribute("s_id");
			int tableno = dto.getTableno();

			Map map = new HashMap();
			map.put("passwd", s_id);
			map.put("replyno", dto.getReplyno());

			int check_res = dao.checkPasswd(map, "B");
			if(check_res==0) {
				out.print("FAIL/�н����尡 ��ġ���� �ʽ��ϴ�.\n\n�н����带 �ٽ� �Է����ּ���");
			}
			else {
				dto = dao.getBbsReply(dto.getReplyno());
				if(dto.getContent() != null){
					out.print("SUCCESS/"+dto.getContent()+"/"+dto.getReplyno());
				}
				else {
					out.print("FAIL/��� �������⿡ �����߽��ϴ�. �ٽ� �õ��� �ּ���");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end
	
	@RequestMapping(value = "/sol_bbs/bbsReplyUpdateProc.do", method = RequestMethod.POST)
	public void bbsReplyUpdateProc(ReplyDTO dto, HttpServletResponse resp) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			
			dto.setContent(dto.getUpdateContent());
			boolean flag = dao.bbsReplyUpdate(dto);
			if (flag) {
				out.print("SUCCESS/����� �����߽��ϴ� ");
			} else {
				out.print("FAIL/��� ������ �����߽��ϴ�. �ٽýõ� ���ּ���");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end
}
