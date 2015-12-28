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
		System.out.println("---------------ReplyCont객체 생성");
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
				str += "답변등록에 성공하였습니다. ";
				out.print(str);
			} else {
				out.print("답변등록에 실패하였습니다. 다시 시도해 주세요 ! ");
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
			if (check_res == 1) { // 비밀번호가 일치하면 삭제진행
				dto.setTablename("Q");

				int res1 = dao.setReplyNo(dto.getTableno(), dto.getTablename());
				int res2 = dao.replyDel(dto.getReplyno());
				if (res1 == 1 && res2 == 1) {
					out.print("success/답변글 삭제가 완료되었습니다. ");
				} else {
					out.print("fail2/답변글 삭제에 실패하였습니다.\n\n 다시시도 해주세요. ");
				}
			} else { // 비밀번호가 일치하지 않을 경우
				out.print("fail1/본인이 작성한 글이 아닙니다.\n\n 다시시도 해주세요. ");
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
				//str += "<input type='button' class='btn btn-default' value='목록' onclick='location.href=\"./list.do\"'>";
				out.print("success|" + str);
			} else {
				out.print("fail|본인이 작성한 글이 아닙니다.\n\n 다시시도 해주세요. ");
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
				out.print("success|답변글 수정 완료! ");
			} else {
				out.print("fail|답변글 수정 실패! \n\n 다시시도 해주세요. ");
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
				out.print("답변등록에 성공하였습니다. ");
			} else {
				out.print("답변등록에 실패하였습니다. 다시 시도해 주세요 ! ");
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
				out.print("FAIL/패스워드가 일치하지 않습니다.\n\n패스워드를 다시 입력해주세요");
			}
			else {
				check_res=dao.bbsReplyDelete(dto.getReplyno());
				if(check_res==1) {
					out.print("SUCCESS/댓글을 삭제했습니다");
				}
				else {
					out.print("FAIL/댓글 삭제에 실패했습니다. 다시 시도해 주세요");
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
				out.print("FAIL/패스워드가 일치하지 않습니다.\n\n패스워드를 다시 입력해주세요");
			}
			else {
				dto = dao.getBbsReply(dto.getReplyno());
				if(dto.getContent() != null){
					out.print("SUCCESS/"+dto.getContent()+"/"+dto.getReplyno());
				}
				else {
					out.print("FAIL/댓글 가져오기에 실패했습니다. 다시 시도해 주세요");
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
				out.print("SUCCESS/댓글을 수정했습니다 ");
			} else {
				out.print("FAIL/댓글 수정에 실패했습니다. 다시시도 해주세요");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}// end
}
