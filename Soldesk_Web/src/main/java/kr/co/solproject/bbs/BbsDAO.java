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
		System.out.println("---------------BbsDAO ��ü ����");
	}

	// �Խñ� ���
	public boolean insert(BbsDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_bbs.insert", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
		return flag;
	}

	// �Խù� ��� �ҷ�����
	public List list(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_bbs.list", map);
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
		return list;
	}

	// �Խù� ��ü ���� �ҷ�����
	public int getTotal(Map map) {
		int cnt = 0;
		try {
			cnt = (Integer) mybatis.queryForObject("sol_bbs.total",map);
		} catch (Exception e) {
			System.out.println("getTotal() ����: " + e);
		}
		return cnt;
	}

	// bbs �󼼺���
	public BbsDTO read(BbsDTO dto) {
		try {
			dto = (BbsDTO) mybatis.queryForObject("sol_bbs.read", dto.getBbsno());
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
		return dto;
	}

	// bbs ��ȸ�� �ø���
	public void increment(BbsDTO dto) {
		try {
			mybatis.update("sol_bbs.increment", dto.getBbsno());
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
	}

	// bbs ����
	public boolean update(BbsDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_bbs.update", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
		return flag;
	}

	// bbs ����
	public boolean delete(BbsDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_bbs.delete", dto.getBbsno());
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
		return flag;
	}

	// bbs��۸��
	public List bbsReplyList(int bbsno) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_reply.bbsReplyList", bbsno);
		} catch (Exception e) {
			System.out.println("����: " + e);
		}
		return list;
	}
	
	//bbse��ۼ�
	public int bbsReplyCnt(int bbsno) {
		int cnt = 0;
		try {
			cnt = (Integer) mybatis.queryForObject("sol_reply.bbsReplyCnt", bbsno);
		} catch (Exception e) {
			System.out.println("bbsReplyCnt() ����: " + e);
		}
		return cnt;
	}
	
}
