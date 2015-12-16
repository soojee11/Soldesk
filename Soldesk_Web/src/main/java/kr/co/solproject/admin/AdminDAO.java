package kr.co.solproject.admin;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.category.CategoryDTO;
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
	
	public List getLecList() {
		List list=null;
		try {
			list=mybatis.queryForList("sol_admin.getLecList1");
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
	
	public List getLecList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.getLecList",map);
		} catch (Exception e) {
			System.out.println("getLecList error"+e);
		}
		return list;
	}// end
	
	public String getCategoryInfo(int grade, String gwamok){
		String categoryInfo = null;
		try {
			Map map = new HashMap();
			map.put("grade", grade);
			map.put("gwamok", gwamok);
			
			categoryInfo = (String) mybatis.queryForObject("sol_lecture.info",map);
			//System.out.println(">>>>>>>>>>>>>>"+categoryInfo);
			
		} catch (Exception e) {
			System.out.println("categoryInfo error: "+e);		
		}
		return categoryInfo;
	}
	
	public int getLecTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_lecture.total",map);
		}	catch(Exception e) {
			System.out.println("getLecTotal error: "+e);		
		}
		return res;
	}
	
	public List getMemList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.getMemList",map);
		} catch (Exception e) {
			System.out.println("getMemList error"+e);
		}
		return list;
	}// end

	public int getMemTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_admin.getMemTotal",map);
		}	catch(Exception e) {
			System.out.println("getMemTotal error: "+e);		
		}
		return res;
	}
	
	public boolean memLevelProc(Map map){
		boolean flag=false;
		try {
			int cnt=mybatis.update("sol_admin.memLevelProc",map);
			if(cnt>0)
				flag=true;
		}	catch(Exception e) {
			System.out.println("memLevelProc error: "+e);
		}
		return flag;
	}//end
	
	public void memDelProc(Map map) {
		try {
			//System.out.println(map.toString());
			mybatis.update("sol_admin.memDelProc", map);
		}catch(Exception e) {
			System.out.println("memDelProc error: "+e);		
		}
	}//end
	
	public List readCateInfo(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.readCateInfo",map);
		} catch (Exception e) {
			System.out.println("readCateInfo error"+e);
		}
		return list;
	}// end
	
	public int getCateTotal(Map map) {
		int res=0;
		try {
			res=(Integer) mybatis.queryForObject("sol_admin.getCateTotal",map);
		}	catch(Exception e) {
			System.out.println("getCateTotal error: "+e);		
		}
		return res;
	}//end
	
	public List getLectureno(int categoryno) {
		List list = null;
		try {
			list=mybatis.queryForList("sol_admin.getLectureno",categoryno);
		}	catch(Exception e) {
			System.out.println("getLectureno error: "+e);		
		}
		return list;
	}//end
	
	public void updateCateProc(CategoryDTO dto){
		boolean flag=false;
		try {
			mybatis.update("sol_admin.updateCateProc",dto);
		}	catch(Exception e) {
			System.out.println("updateCateProc error: "+e);
		}
	}//end
	
	
}
