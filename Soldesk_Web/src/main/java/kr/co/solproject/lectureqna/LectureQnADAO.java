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
		System.out.println("---------------LectureQnADAO ��ü ����");
	}

	/** �н� Q&A �Խñ� ��ȸ **/
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

	/** �н� Q&A �Խñ� ���� ��ȸ **/
	public int getTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_lectureqna.qnaTotal", map);
		} catch (Exception e) {
			System.out.println("qnaTotal error: " + e);
		}
		return res;
	}
	
	/** ī�װ�DTO ������ **/
	public CategoryDTO getCategory(CategoryDTO dto) {
		// CategoryDTO dto = null;
		try {
			dto = (CategoryDTO) mybatis.queryForObject("sol_lectureqna.getCategory", dto);
			// System.out.println("77777777777777777777"+dto.toString());
		} catch (Exception e) {
			System.out.println("read ���д�: " + e);
		}
		return dto;
	}// end
	
	/** q&a ��� **/
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
	



}
