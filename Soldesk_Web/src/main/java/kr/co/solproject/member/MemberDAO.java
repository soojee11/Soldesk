package kr.co.solproject.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class MemberDAO {

	public MemberDAO() {
		mybatis = GetSqlMapClient.get();
		System.out.println("▶------MemberDAO()객체 생성됨...");
	}

	private SqlMapClient mybatis = null; // MyBATIS 호출

//--------------------------------------------------------------------
	
	public int loginCount(Map map) {//아이디,비번 매치
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_member.logincount",map);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end

	
	public int idcheck(String id) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_member.idcheck",id);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
	
	public int emailcheck(String email) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_member.emailcheck",email);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
	
	public List<ZipcodeDTO> zipcheck(String dong) {
		List<ZipcodeDTO> list = null;
		try {
			
			list = mybatis.queryForList("sol_member.zipcheck", dong);
		
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}// end
	
	public boolean join(MemberDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_member.join", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}// end
	

	public int pwcheck(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_member.pwcheck",map);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
	
	public MemberDTO read(String id) {
		MemberDTO dto = null;
		try {
			dto =  (MemberDTO) mybatis.queryForObject("sol_member.read",id);
		System.out.println(dto);
		} catch (Exception e) {
			System.out.println(e);
		}
		return dto;
	}// end
	
	public boolean updatego(MemberDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_member.updatego", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}// end
	
	public int deletego(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.update("sol_member.deletego",map);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
	
	
	public String findid(Map map) {
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_member.findid",map);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
	
	public String findpw(Map map) {
		String res = null;
		try {
			res = (String) mybatis.queryForObject("sol_member.findpw",map);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
	
	public int findpwupdate(Map map) {
		int res = 0;
		try {
			res = mybatis.update("sol_member.findpwupdate",map);
		System.out.println(res);
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}// end
}