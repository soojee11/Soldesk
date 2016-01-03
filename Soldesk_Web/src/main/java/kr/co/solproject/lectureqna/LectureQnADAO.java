package kr.co.solproject.lectureqna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;

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
			dto = (CategoryDTO) mybatis.queryForObject("sol_lectureqna.getQnACategory", dto);
		} catch (Exception e) {
			System.out.println("read ���д�: " + e);
			e.printStackTrace();
		}
		return dto;
	}// end
	
	/** QnA ��� **/
	public int qnaInsert(LectureQnADTO dto) {
		int res = 0;
		try {
			//System.out.println("---����--dao"+dto.toString());
			res = mybatis.update("sol_lectureqna.qnaInsert", dto);
		} catch (Exception e) {
			System.out.println("post create error: " + e);
		}
		return res;

	}
	



}
