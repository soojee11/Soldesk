package kr.co.solproject.postscript;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;

@Component
public class PostscriptDAO {

	private SqlMapClient mybatis = null;

	public PostscriptDAO() {
		mybatis = GetSqlMapClient.get();
		System.out.println("---------------PostscriptDAO 객체 생성");
	}

	/** 후기 리스트 조회 **/
	public List getList(Map map) {
		List list = null;
		try {
			//System.out.println(map.toString());
			list = mybatis.queryForList("sol_postscript.postList", map);
			//System.out.println(list.toString());
		} catch (Exception e) {
			System.out.println("postList error" + e);
		}
		return list;
	}// end

	/** 후기 리스트 갯수 조회 **/
	public int getTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_postscript.postTotal", map);
		} catch (Exception e) {
			System.out.println("postTotal error: " + e);
		}
		return res;
	}

	/** 카테고리DTO 가져옴 **/
	public CategoryDTO getCategory(CategoryDTO dto) {
		// CategoryDTO dto = null;
		try {
			dto = (CategoryDTO) mybatis.queryForObject("sol_postscript.getCategory", dto);
			// System.out.println("77777777777777777777"+dto.toString());
		} catch (Exception e) {
			System.out.println("read 실패다: " + e);
		}
		return dto;
	}// end

	/** 후기 등록 **/
	public int postInsert(PostscriptDTO dto) {
		int res = 0;
		try {
			// System.out.println("-----dao"+dto.toString());
			res = mybatis.update("sol_postscript.insert", dto);
		} catch (Exception e) {
			System.out.println("post create error: " + e);
		}
		return res;

	}

	/** 후기 삭제 **/
	public int postDelete(PostscriptDTO dto) {
		int res = 0;
		try {
			res = mybatis.delete("sol_postscript.delete", dto);
		} catch (Exception e) {
			System.out.println("post delete error: " + e);
		}
		return res;
	}

	/** 후기 수정: 후기 조회 **/
	public PostscriptDTO postRead(PostscriptDTO dto) {
		try {
			dto = (PostscriptDTO) mybatis.queryForObject("sol_postscript.postRead", dto);
		} catch (Exception e) {
			System.out.println("postscript read error: " + e);
		}
		return dto;
	}

	/** 후기 수정 **/
	public int postUpdate(PostscriptDTO dto){
		int res = 0;
		try {
			//System.out.println("포스트::"+dto.toString());
			res = mybatis.update("sol_postscript.postUpdate", dto);
		} catch (Exception e) {
			System.out.println("post update error: " + e);
		}
		return res;
	}
}
