package kr.co.mybatis.notice;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mybatis.GetSqlMapClient;

public class NoticeDAO {

	private SqlMapClient mybatis; // Connection con

	public NoticeDAO() {
		mybatis = GetSqlMapClient.get(); // con=dbopen.getConnection()
		// 최종적으로 mybatis로 DB접근가능
	}

	public void create(NoticeDTO dto) {

		try {
			mybatis.insert("notice.create", dto);// "namespace이름.insert id"

		} catch (Exception e) {
			System.out.println("추가실패: " + e);
		}

	}

	public void create2(NoticeDTO dto) {
		try {
			mybatis.insert("notice.create2", dto); // namespace안쓰면 create만 쓰면된다

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("추가실패 : " + e);
		}
	}// end

	public List list() {// 목록
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
																				// xml로넘어감
		} catch (Exception e) {
			System.out.println(e);
		}
		return dto;
	}// end

	public void update(NoticeDTO dto) {
		try {
			mybatis.update("notice.update", dto);

		} catch (Exception e) {
			System.out.println("수정실패: " + e);
		}
	}// end

	public int delete(int noticeno) {
		int cnt = 0;
		try {
			//cnt = mybatis.delete("notice.delete", noticeno);
			cnt = mybatis.delete("notice.delete2", noticeno);

		} catch (Exception e) {
			System.out.println("수정실패: " + e);
		}
		return cnt;
	}// end
	
	public List search(String keyword) {// 목록
		List list = null;
		try {
			list = mybatis.queryForList("notice.search", keyword);
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}// end
	
}
