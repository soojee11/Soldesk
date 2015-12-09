package kr.co.solproject.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.test.TestDTO;

@Component
public class AdminDAO {
	
	private SqlMapClient mybatis=null;

	public AdminDAO() {
		mybatis=GetSqlMapClient.get();
	}
	
	public String loginProc(MemberDTO dto){
		String mlevel = "";
		try {
			mlevel=(String) mybatis.queryForObject("sol_member.loginproc",dto);
		}	catch(Exception e) {
			System.out.println("login error: "+e);
		}
		return mlevel;
	}
	
	public Boolean testIns(TestDTO dto){
		
		boolean flag=false;
		
		try {
			int cnt=mybatis.update("sol_test.insert",dto);
			if(cnt>0)
				flag=true;
		}	catch(Exception e) {
			System.out.println("testInsert error: "+e);
		}
		return flag;
		
	}

	public List getTestList(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_test.testList", map);
		}catch(Exception e) {
			System.out.println("getTestList error: "+e);		
		}
		return list;
	}//end

	public int getTestTotal(Map map) {
		int count=0;
		try {
			count=(Integer) mybatis.queryForObject("sol_test.testTotal", map);
		}	catch(Exception e) {
			System.out.println("getTestTotal error: "+e);		
		}
		return count;
	}
	
	public List getquestion(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_question.getquestion", map);
			System.out.println("------------------");
			System.out.println(list.toString());
		}catch(Exception e) {
			System.out.println("getquestion error: "+e);		
		}
		return list;
	}//end
	
	public int getQuestionTotal(Map map) {
		int count=0;
		try {
			count=(Integer) mybatis.queryForObject("sol_question.questionTotal", map);
		}	catch(Exception e) {
			System.out.println("getQuestionTotal error: "+e);		
		}
		return count;
	}
	
}
