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
		System.out.println("---------------PostscriptDAO ��ü ����");
	}

	/** �ı� ����Ʈ ��ȸ **/
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

	/** �ı� ����Ʈ ���� ��ȸ **/
	public int getTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_postscript.postTotal", map);
		} catch (Exception e) {
			System.out.println("postTotal error: " + e);
		}
		return res;
	}

	/** ī�װ�DTO ������ **/
	public CategoryDTO getCategory(CategoryDTO dto) {
		// CategoryDTO dto = null;
		try {
			dto = (CategoryDTO) mybatis.queryForObject("sol_postscript.getCategory", dto);
			// System.out.println("77777777777777777777"+dto.toString());
		} catch (Exception e) {
			System.out.println("read ���д�: " + e);
		}
		return dto;
	}// end

	/** �ı� ��� **/
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

	/** �ı� ���� **/
	public int postDelete(PostscriptDTO dto) {
		int res = 0;
		try {
			res = mybatis.delete("sol_postscript.delete", dto);
		} catch (Exception e) {
			System.out.println("post delete error: " + e);
		}
		return res;
	}

	/** �ı� ����: �ı� ��ȸ **/
	public PostscriptDTO postRead(PostscriptDTO dto) {
		try {
			dto = (PostscriptDTO) mybatis.queryForObject("sol_postscript.postRead", dto);
		} catch (Exception e) {
			System.out.println("postscript read error: " + e);
		}
		return dto;
	}

	/** �ı� ���� **/
	public int postUpdate(PostscriptDTO dto){
		int res = 0;
		try {
			//System.out.println("����Ʈ::"+dto.toString());
			res = mybatis.update("sol_postscript.postUpdate", dto);
		} catch (Exception e) {
			System.out.println("post update error: " + e);
		}
		return res;
	}
}
