package kr.co.solproject.lectureqna;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.postscript.PostscriptDTO;
import kr.co.solproject.qnabbs.QnaDTO;
import kr.co.solproject.reply.ReplyDTO;

/** Postscript controller������ ����Ʈ��ȸ�� ������ page reload�ؾ��ϴ� �͸� ������. **/

@Controller
public class LectureQnACont {

	@Autowired
	private LectureQnADAO qnaDao = null;

	public LectureQnACont() {
		System.out.println("---------------LectureQnACont��ü ����");
	}

	
	/** QnA ��� **/
	@RequestMapping(value = "/sol_study/qnaCreate.do", method = RequestMethod.POST)
	public void createProc(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		
		cdto = qnaDao.getCategory(cdto);
		try {
			//System.out.println("�������Ͷ�dto>>>>>>"+dto.toString());
			dto.setCategoryno(cdto.getCategoryno());
			int cnt = qnaDao.qnaInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("QnA ��� �Ϸ�!");
			} else {
				out.write("QnA ��� ����! �ٽ� �õ��� �ּ���.");
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
	}// end
	
	
	/** QnA �ڼ������� **/
	@RequestMapping(value="/sol_study/qnaRead.do",method=RequestMethod.GET)
	public void qnaRead(LectureQnADTO dto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		int lectureqnano = dto.getLectureqnano();
		String idcheck = "false";
		String s_id = (String) session.getAttribute("s_id");
		try {
			//System.out.println(request.getParameter("lectureqnano"));
			
			dto = qnaDao.qnaRead(lectureqnano);
			
			qnaDao.readCount(lectureqnano);	
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
		
			if (dto.getId().equals(s_id)) {
				idcheck = "true";
			} else{
				
			}
			
			if (dto != null) {
				out.write(dto.getSubject()+"/"+dto.getId()+"/"+dto.getRegdate()+"/"+dto.getContent()+"/"+dto.getReadcnt()+"/"+idcheck);
			} else {
				out.write("�н�QnA �󼼺��� ����");
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		
	}//end

}
