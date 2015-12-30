package kr.co.solproject.lectureqna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.postscript.PostscriptDTO;

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
			//System.out.println(map.toString());
			list = mybatis.queryForList("sol_lectureqna.qnaList", map);
			//System.out.println(list.toString());
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
			dto = (CategoryDTO) mybatis.queryForObject("sol_lectureqna.getCategory", dto);
			// System.out.println("77777777777777777777"+dto.toString());
		} catch (Exception e) {
			System.out.println("read 실패다: " + e);
		}
		return dto;
	}// end
	
	/** 후기 등록 **/
	public int qnaInsert(LectureQnADTO dto) {
		int res = 0;
		try {
			// System.out.println("-----dao"+dto.toString());

			res = mybatis.update("sol_lectureqna.insert", dto);
		} catch (Exception e) {
			System.out.println("post create error: " + e);
		}
		return res;

	}
	
	/** 후기 삭제 **/
	public int qnaDelete(LectureQnADTO dto) {
		int res = 0;
		try {
			res = mybatis.delete("sol_lectureqna.delete", dto);
		} catch (Exception e) {
			System.out.println("post delete error: " + e);
		}
		return res;
	}

	/** 후기 수정: 후기 조회 **/
	public LectureQnADTO qnaRead(LectureQnADTO dto) {
		try {
			dto = (LectureQnADTO) mybatis.queryForObject("sol_lectureqna.postRead", dto);
		} catch (Exception e) {
			System.out.println("postscript read error: " + e);
		}
		return dto;
	}

	/** 후기 수정 **/
	public int qnaUpdate(LectureQnADTO dto){
		int res = 0;
		try {
			//System.out.println("포스트컨ㄷ틀ㄹ::"+dto.toString());
			res = mybatis.update("sol_lectureqna.postUpdate", dto);
		} catch (Exception e) {
			System.out.println("post update error: " + e);
		}
		return res;
	}



}
