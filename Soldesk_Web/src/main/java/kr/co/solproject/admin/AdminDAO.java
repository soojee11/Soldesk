package kr.co.solproject.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.example.ExampleDTO;
import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.question.QuestionDTO;
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

// -----------------------------------------------------------------------------------------문제풀기부분 시작	
	public boolean testInsert(TestDTO dto){
		boolean flag=false;
		try {
			int cnt=mybatis.update("sol_test.insert",dto);
			if(cnt>0)
				flag=true;
			
		}	catch(Exception e) {
			System.out.println("testInsert error: "+e);
		}
		return flag;
	}//end

	public List testList(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_test.list",map);

		}	catch(Exception e) {
			System.out.println("testList error: "+e);		
		}
		return list;
	}//end
	
	public int testTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_test.total",map);
			
		}	catch(Exception e) {
			System.out.println("testTotal error: "+e);		
		}
		return res;
	}//end
	
	public List questionList(Map map) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_question.list", map);
			
		}catch(Exception e) {
			System.out.println("questionList error: "+e);		
		}
		return list;
	}//end
	
	public int questionTotal(Map map) {
		int count=0;
		try {
			count=(Integer) mybatis.queryForObject("sol_question.total", map);
			
		}	catch(Exception e) {
			System.out.println("questionTotal error: "+e);		
		}
		return count;
	}//end
	
	public boolean questionInsert(QuestionDTO dto){
		boolean flag=false;
		try {
			int cnt=mybatis.update("sol_question.insert",dto);
			if(cnt>0)
				flag=true;
			
		}	catch(Exception e) {
			System.out.println("questionInsert error: "+e);
		}
		return flag;
	}//end
	
	public boolean exampleInsert(ExampleDTO dto){
		boolean flag=false;
		try {
			System.out.println(dto.toString());
			int cnt=mybatis.update("sol_example.insert",dto);
			if(cnt>0)
				flag=true;
			
		}	catch(Exception e) {
			System.out.println("exampleInsert error: "+e);
		}
		return flag;
	}//end
	
	public void questionSelect(Map map) {
		try {
			mybatis.update("sol_question.questionSelect", map);
			
		}	catch(Exception e) {
			System.out.println("questionSelect error: "+e);		
		}
	}//end
	
	public void questionDelete(Map map) {
		try {
			mybatis.update("sol_question.questionDelete", map);
			
		}	catch(Exception e) {
			System.out.println("questionDelete error: "+e);		
		}
	}//end
// -----------------------------------------------------------------------------------------문제풀기부분 끝
}
