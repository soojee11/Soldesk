package kr.co.solproject.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.player.PlayerDTO;
import kr.co.solproject.test.TestDTO;

@Component
public class AdminDAO {
	
	private SqlMapClient mybatis=null;

	public AdminDAO() {
		mybatis=GetSqlMapClient.get();
	}
	

	//----------------------------------------------------------- login/out ----------------------------------------------------------------------------------------------
	
	
	public String loginProc(MemberDTO dto){
		String mlevel = "";
		try {
			mlevel=(String) mybatis.queryForObject("sol_member.loginproc",dto);
		}	catch(Exception e) {
			System.out.println("login error: "+e);
		}
		return mlevel;
	}
	//----------------------------------------------------------- member ----------------------------------------------------------------------------------------------
	
	
	
	//----------------------------------------------------------- test ----------------------------------------------------------------------------------------------
	
	
	//----------------------------------------------------------- lecture ----------------------------------------------------------------------------------------------
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
	
}
