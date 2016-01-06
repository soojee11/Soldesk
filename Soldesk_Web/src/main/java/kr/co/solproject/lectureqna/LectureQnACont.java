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

	
	/** �н��ϱ� QnA ��� **/
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
	
	
	/** �н� QnA �������� **/
	@RequestMapping(value="/sol_study/qnaRead.do",method=RequestMethod.GET)
	public void qnaRead(LectureQnADTO dto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		int lectureqnano = dto.getLectureqnano();
		String idcheck = "false";
		String s_id = (String) session.getAttribute("s_id");
		try {
			//System.out.println(request.getParameter("lectureqnano"));
			
			dto = qnaDao.qnaRead(lectureqnano);
			
			qnaDao.readCount(lectureqnano);	
			
			//System.out.println(s_id+"////////"+dto.getId());
			//System.out.println("dto.getLectureqnano():"+dto.getLectureqnano());
						
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
		
			if (dto.getId().equals(s_id)) {
				idcheck = "true";
			} else{
				
			}
			
			if (dto != null) {
				out.write(dto.getSubject()+"/"+dto.getId()+"/"+dto.getRegdate()+"/"+
						  dto.getContent()+"/"+dto.getReadcnt()+"/"+idcheck+
						  "/"+dto.getLectureqnano());
				
			} else {
				out.write("�н�QnA �󼼺��� ����");
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		
	}//end
	
	/** �н�QnA ���� **/
	@RequestMapping(value = "/sol_study/qnaDelete.do", method = RequestMethod.GET)
	public void deleteProc(LectureQnADTO dto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		int lectureqnano = dto.getLectureqnano();
		dto.setId((String) session.getAttribute("s_id"));
		dto = qnaDao.qnaRead(lectureqnano);
		dto.setLectureqnano(lectureqnano);
		
		//System.out.println("����1!!!!!!!!!!!!!!!"+lectureqnano);
		try {
			//System.out.println("dto>>>>>>"+dto.toString());
			int cnt = qnaDao.qnaDelete(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("�н�QnA ���� �Ϸ�!");
			} else {
				out.write("�н�QnA ���� ����! �ٽ� �õ��� �ּ���.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	
	/** �н� QnA  �����ҷ����� **/
	@RequestMapping(value = "/sol_study/qnaUpdateRead.do", method = RequestMethod.GET)
	public void updateRead(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpSession session) {
		int lectureqnano = dto.getLectureqnano();
		dto.setId((String) session.getAttribute("s_id"));		
		
		try {						
			System.out.println("�����������̤���!!!!!!!!!!"+lectureqnano);		
			//dto.setCategoryno(cdto.getCategoryno());
			
			dto = qnaDao.qnaRead(lectureqnano);
			System.out.println("dto.getLectureqnano():"+dto.getLectureqnano());

			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			
			if (dto != null) {
				out.write(dto.getSubject()+"/"+dto.getContent()+"/"+dto.getLectureqnano());
				
			} else {
				out.write("�н�QnA ���� �ҷ����� ����");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	
	/** �н�QnA ���� **/
	@RequestMapping(value = "/sol_study/qnaUpdate.do", method = RequestMethod.POST)
	public void updateProc(LectureQnADTO dto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		//int lectureqnano = dto.getLectureqnano();
		dto.setId((String) session.getAttribute("s_id"));
		//dto.setLectureqnano(lectureqnano);
		
		try {
			//System.out.println("dto>>>>>>"+dto.toString());
			int cnt = qnaDao.qnaUpdate(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("�н�QnA ���� �Ϸ�!");
			} else {
				out.write("�н�QnA ���� ����! �ٽ� �õ��� �ּ���.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end


}
