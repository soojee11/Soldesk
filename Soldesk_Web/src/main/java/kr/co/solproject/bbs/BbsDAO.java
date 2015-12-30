package kr.co.solproject.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class BbsDAO {

	private SqlMapClient mybatis; // Connection con

	public BbsDAO() {
		mybatis = GetSqlMapClient.get(); // con = dbopen.getConnection()
		System.out.println("---------------BbsDAO 객체 생성");
	}

	// 게시글 등록
	public boolean insert(BbsDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_bbs.insert", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
		return flag;
	}

	// 게시물 목록 불러오기
	public List list(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_bbs.list", map);
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
		return list;
	}

	// 게시물 전체 개수 불러오기
	public int getTotal(Map map) {
		int cnt = 0;
		try {
			cnt = (Integer) mybatis.queryForObject("sol_bbs.total",map);
		} catch (Exception e) {
			System.out.println("getTotal() 실패: " + e);
		}
		return cnt;
	}

	// bbs 상세보기
	public BbsDTO read(BbsDTO dto) {
		try {
			dto = (BbsDTO) mybatis.queryForObject("sol_bbs.read", dto.getBbsno());
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
		return dto;
	}

	// bbs 조회수 올리기
	public void increment(BbsDTO dto) {
		try {
			mybatis.update("sol_bbs.increment", dto.getBbsno());
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
	}

	// bbs 수정
	public boolean update(BbsDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_bbs.update", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
		return flag;
	}

	// bbs 삭제
	public boolean delete(BbsDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_bbs.delete", dto.getBbsno());
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
		return flag;
	}

	// bbs댓글목록
	public List bbsReplyList(int bbsno) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_reply.bbsReplyList", bbsno);
		} catch (Exception e) {
			System.out.println("실패: " + e);
		}
		return list;
	}
	
	//bbse댓글수
	public int bbsReplyCnt(int bbsno) {
		int cnt = 0;
		try {
			cnt = (Integer) mybatis.queryForObject("sol_reply.bbsReplyCnt", bbsno);
		} catch (Exception e) {
			System.out.println("bbsReplyCnt() 실패: " + e);
		}
		return cnt;
	}
	
}
