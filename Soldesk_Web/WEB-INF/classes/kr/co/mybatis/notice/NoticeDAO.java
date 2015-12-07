package kr.co.mybatis.notice;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mybatis.GetSqlMapClient;

public class NoticeDAO {

	private SqlMapClient mybatis; // Connection con

	public NoticeDAO() {
		mybatis = GetSqlMapClient.get(); // con=dbopen.getConnection()
		// ���������� mybatis�� DB���ٰ���
	}

	public void create(NoticeDTO dto) {

		try {
			mybatis.insert("notice.create", dto);// "namespace�̸�.insert id"

		} catch (Exception e) {
			System.out.println("�߰�����: " + e);
		}

	}

	public void create2(NoticeDTO dto) {
		try {
			mybatis.insert("notice.create2", dto); // namespace�Ⱦ��� create�� ����ȴ�

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�߰����� : " + e);
		}
	}// end

	public List list() {// ���
		List list = null;
		try {
			//list = mybatis.queryForList("notice.list");
			list = mybatis.queryForList("notice.list2");
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}// end

	public NoticeDTO read(int noticeno) {
		NoticeDTO dto = null;
		try {
			dto = (NoticeDTO) mybatis.queryForObject("notice.read", noticeno); // noticeno
																				// xml�γѾ
		} catch (Exception e) {
			System.out.println(e);
		}
		return dto;
	}// end

	public void update(NoticeDTO dto) {
		try {
			mybatis.update("notice.update", dto);

		} catch (Exception e) {
			System.out.println("��������: " + e);
		}
	}// end

	public int delete(int noticeno) {
		int cnt = 0;
		try {
			//cnt = mybatis.delete("notice.delete", noticeno);
			cnt = mybatis.delete("notice.delete2", noticeno);

		} catch (Exception e) {
			System.out.println("��������: " + e);
		}
		return cnt;
	}// end
	
	public List search(String keyword) {// ���
		List list = null;
		try {
			list = mybatis.queryForList("notice.search", keyword);
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}// end
	
}
