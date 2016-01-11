package kr.co.solproject.lectureqna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.qnabbs.QnaDTO;

@Component
public class LectureQnADAO {

	private SqlMapClient mybatis = null;

	public LectureQnADAO() {
		mybatis = GetSqlMapClient.get();
		System.out.println("---------------LectureQnADAO 객체 생성");
	}

	/** 학습 Q&A 게시글 조회 **/
	public List getList(Map map) {
		List list = null;
		try {
			// System.out.println(map.toString());
			list = mybatis.queryForList("sol_lectureqna.qnaList", map);
			// System.out.println(list.toString());
		} catch (Exception e) {
			System.out.println("qnaList error" + e);
		}
		return list;
	}// end

	/** 학습 Q&A 게시글 갯수 조회 **/
	public int getTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_lectureqna.qnaTotal", map);
		} catch (Exception e) {
			System.out.println("qnaTotal error: " + e);
		}
		return res;
	}

	/** 카테고리DTO 가져옴 **/
	public CategoryDTO getCategory(CategoryDTO dto) {
		// CategoryDTO dto = null;
		try {
			dto = (CategoryDTO) mybatis.queryForObject("sol_lectureqna.getQnACategory", dto);
		} catch (Exception e) {
			System.out.println("read 실패다: " + e);
			e.printStackTrace();
		}
		return dto;
	}// end

	/** 학습하기 QnA 등록 **/
	public int qnaInsert(LectureQnADTO dto) {
		int res = 0;
		try {
			// System.out.println("---질문--dao"+dto.toString());
			res = mybatis.update("sol_lectureqna.qnaInsert", dto);
		} catch (Exception e) {
			System.out.println("post create error: " + e);
		}
		return res;

	}

	/** 학습하기 QnA 상세보기 **/
	public LectureQnADTO qnaRead(int lectureqnano) {
		LectureQnADTO dto = null;
		try {
			dto = (LectureQnADTO) mybatis.queryForObject("sol_lectureqna.qnaRead", lectureqnano);
		} catch (Exception e) {
			System.out.println("qnaRead error: " + e);
		}
		return dto;
	}// end

	/** 학습하기 QnA 조회수 **/
	public int readCount(int lectureqnano) {
		int res = 0;

		try {
			mybatis.update("sol_lectureqna.readCount", lectureqnano);
		} catch (Exception e) {
			System.out.println("readCount error: " + e);
		}
		return res;
	}
	
	/** 학습하기 QnA 삭제 **/
	public int qnaDelete(LectureQnADTO dto) {
		int res = 0;
		try {
			res = mybatis.delete("sol_lectureqna.qnaDelete", dto);
		} catch (Exception e) {
			System.out.println("qnaDelete error: " + e);
			e.getStackTrace();
		}
		return res;
	}
	
	/** 학습하기 수정 **/
	public int qnaUpdate(LectureQnADTO dto){
		int res = 0;
		try {
			res = mybatis.update("sol_lectureqna.qnaUpdate", dto);
		} catch (Exception e) {
			System.out.println("qnaUpdate  error: " + e);
		}
		return res;
	}
}
