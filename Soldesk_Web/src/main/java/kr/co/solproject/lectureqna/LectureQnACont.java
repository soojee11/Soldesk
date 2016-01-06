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

/** Postscript controller에서는 리스트조회를 제외한 page reload해야하는 것만 제어함. **/

@Controller
public class LectureQnACont {

	@Autowired
	private LectureQnADAO qnaDao = null;

	public LectureQnACont() {
		System.out.println("---------------LectureQnACont객체 생성");
	}

	
	/** 학습하기 QnA 등록 **/
	@RequestMapping(value = "/sol_study/qnaCreate.do", method = RequestMethod.POST)
	public void createProc(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		dto.setId((String) session.getAttribute("s_id"));
		
		cdto = qnaDao.getCategory(cdto);
		try {
			//System.out.println("질문나와라dto>>>>>>"+dto.toString());
			dto.setCategoryno(cdto.getCategoryno());
			int cnt = qnaDao.qnaInsert(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("QnA 등록 완료!");
			} else {
				out.write("QnA 등록 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
	}// end
	
	
	/** 학습 QnA 상세히보기 **/
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
				out.write("학습QnA 상세보기 실패");
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		
	}//end
	
	/** 학습QnA 삭제 **/
	@RequestMapping(value = "/sol_study/qnaDelete.do", method = RequestMethod.GET)
	public void deleteProc(LectureQnADTO dto, HttpServletResponse resp, HttpServletRequest request, HttpSession session) {
		//CategoryDTO cdto = null;
		int lectureqnano = dto.getLectureqnano();
		dto.setId((String) session.getAttribute("s_id"));
		dto = qnaDao.qnaRead(lectureqnano);
		dto.setLectureqnano(lectureqnano);
		
		//System.out.println("렉쳐1!!!!!!!!!!!!!!!"+lectureqnano);
		try {
			//System.out.println("dto>>>>>>"+dto.toString());
			int cnt = qnaDao.qnaDelete(dto);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			if (cnt == 1) {
				out.write("학습QnA 삭제 완료!");
			} else {
				out.write("학습QnA 삭제 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	
	/** 학습 QnA  수정불러오기 **/
	@RequestMapping(value = "/sol_study/qnaUpdateRead.do", method = RequestMethod.GET)
	public void updateRead(LectureQnADTO dto, CategoryDTO cdto, HttpServletResponse resp, HttpSession session) {
		int lectureqnano = dto.getLectureqnano();
		dto.setId((String) session.getAttribute("s_id"));		
		
		try {						
			System.out.println("수정가져오ㅜㅏㅗ!!!!!!!!!!"+lectureqnano);		
			//dto.setCategoryno(cdto.getCategoryno());
			
			dto = qnaDao.qnaRead(lectureqnano);
			System.out.println("dto.getLectureqnano():"+dto.getLectureqnano());

			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			
			if (dto != null) {
				out.write(dto.getSubject()+"/"+dto.getContent()+"/"+dto.getLectureqnano());
				
			} else {
				out.write("학습QnA 수정 불러오기 실패");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end
	
	/** 학습QnA 수정 **/
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
				out.write("학습QnA 수정 완료!");
			} else {
				out.write("학습QnA 수정 실패! 다시 시도해 주세요.");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}// end


}
