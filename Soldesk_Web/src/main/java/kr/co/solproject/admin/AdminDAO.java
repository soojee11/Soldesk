package kr.co.solproject.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.example.ExampleDTO;
import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.player.PlayerDTO;
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
	
	public int getCategoryno(Map map) {
		int categoryno = 0;
		try {
			categoryno=(Integer) mybatis.queryForObject("sol_admin.getCategoryno",map);
		}catch(Exception e) {
			System.out.println("getCategoryno error: "+e);		
		}
		return categoryno;
	}//end
	
	public List getLecList() {
		List list=null;
		try {
			list=mybatis.queryForList("sol_admin.getLecList1");
		}catch(Exception e) {
			System.out.println("getLecList error: "+e);		
		}
		return list;
	}//end
	
	public List getLecList(int categoryno) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_admin.getLecList",categoryno);
		}catch(Exception e) {
			System.out.println("getLecList error: "+e);	
		}
			return list;
	}//end	

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
	
	public int getLecTotal() {
		int count=0;
		try {
			count=(Integer) mybatis.queryForObject("sol_admin.getLecTotal1");
		}	catch(Exception e) {
			System.out.println("getLecTotal error: "+e);		
		}
		return count;
	}
	
	public int getLecTotal(int categoryno) {
		int count=0;
		try {
			count=(Integer) mybatis.queryForObject("sol_admin.getLecTotal", categoryno);
		}	catch(Exception e) {
			System.out.println("getLecTotal error: "+e);		
		}
		return count;
	}
	public PlayerDTO lecRead(int lectureno){
		
		PlayerDTO dto = null;
		
		try {
				dto = (PlayerDTO) mybatis.queryForObject("sol_admin.lecRead", lectureno);
		}catch(Exception e){
				System.out.println("lecRead error: "+e);		
		}
		return dto;
	}// end
	
	public CategoryDTO categoryRead(int categoryno){
		
		CategoryDTO dto = null;
		
		try {
				dto = (CategoryDTO) mybatis.queryForObject("sol_admin.categoryRead", categoryno);
		}catch(Exception e){
				System.out.println("CategoryDTO error: "+e);		
		}
		return dto;
	}// end
	
	public void categoryDelProc(int categoryno){
		try {
				mybatis.update("sol_admin.categoryDelProc", categoryno);
		}catch(Exception e){
				System.out.println("categoryDelProc error: "+e);		
		}
	}// end
	
	public void lecDelProc(int lectureno){
		try {
				mybatis.update("sol_admin.lecDelProc", lectureno);
		}catch(Exception e){
				System.out.println("categoryDelProc error: "+e);		
		}
	}// end

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
	
	public void lecUpdate(PlayerDTO dto) {
		try {
			mybatis.update("sol_admin.lecUpdate", dto);
			
		}	catch(Exception e) {
			System.out.println("lecUpdate error: "+e);		
		}
	}//end
	
}
