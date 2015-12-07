package kr.co.solproject.admin;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mybatis.GetSqlMapClient;
import kr.co.solproject.member.MemberDTO;

@Component
public class AdminDAO {
	
	private SqlMapClient mybatis=null;

	public AdminDAO() {
		mybatis=GetSqlMapClient.get();
	}
	
	
}
