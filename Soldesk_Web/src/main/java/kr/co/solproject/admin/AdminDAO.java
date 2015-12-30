package kr.co.solproject.admin;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.bbs.BbsDTO;
import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.player.PlayerDTO;
import kr.co.solproject.question.QuestionDTO;
import kr.co.solproject.test.TestDTO;

@Component
public class AdminDAO {

	private SqlMapClient mybatis = null;

	public AdminDAO() {
		mybatis = GetSqlMapClient.get();
	}

	public String loginProc(MemberDTO dto) {
		String mlevel = "";
		try {
			mlevel = (String) mybatis.queryForObject("sol_member.loginproc", dto);
		} catch (Exception e) {
			System.out.println("login error: " + e);
		}
		return mlevel;
	}

//-------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------TEST START
	public boolean testInsert(TestDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_test.insert", dto);
			if (cnt > 0)
				flag = true;

		} catch (Exception e) {
			System.out.println("testInsert error: " + e);
		}
		return flag;
	}// end

	public List testList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_test.list", map);

		} catch (Exception e) {
			System.out.println("testList error: " + e);
		}
		return list;
	}// end

	public int testTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_test.total", map);

		} catch (Exception e) {
			System.out.println("testTotal error: " + e);
		}
		return res;
	}// end

	public List questionList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_question.list", map);

		} catch (Exception e) {
			System.out.println("questionList error: " + e);
		}
		return list;
	}// end

	public int questionTotal(Map map) {
		int count = 0;
		try {
			count = (Integer) mybatis.queryForObject("sol_question.total", map);

		} catch (Exception e) {
			System.out.println("questionTotal error: " + e);
		}
		return count;
	}// end

	public boolean questionInsert(QuestionDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_question.insert", dto);
			if (cnt > 0)
				flag = true;

		} catch (Exception e) {
			System.out.println("questionInsert error: " + e);
		}
		return flag;
	}// end

	public void questionSelect(Map map) {
		try {
			mybatis.update("sol_question.questionSelect", map);

		} catch (Exception e) {
			System.out.println("questionSelect error: " + e);
		}
	}// end

	public void questionUnSelect(Map map) {
		try {
			mybatis.update("sol_question.questionUnSelect", map);

		} catch (Exception e) {
			System.out.println("questionUnSelect error: " + e);
		}
	}// end
	
	public int testDeleteProc(Map map) {
		int res = 0;
		try {
			res = mybatis.delete("sol_test.testDeleteProc", map);
		} catch (Exception e) {
			System.out.println("testDeleteProc error: " + e);

		}
		return res;
	}// end
	
	public int questionDeleteProc(Map map) {
		int res = 0;
		try {
			res = mybatis.delete("sol_question.questionDeleteProc", map);
		} catch (Exception e) {
			System.out.println("questionDeleteProc error: " + e);

		}
		return res;
	}// end

	public int testQuestDelete(Map map) {
		int res = 0;
		try {
			res = mybatis.delete("sol_question.testQuestDelete", map);
		} catch (Exception e) {
			System.out.println("testQuestDelete error: " + e);

		}
		return res;
	}// end
	
	public int questionReadDelete(QuestionDTO dto) {
		int res = 0;
		try {
			res = mybatis.delete("sol_question.questionReadDelete", dto);
		} catch (Exception e) {
			System.out.println("questionReadDelete error: " + e);
		}
		return res;
	}// end
	
	public TestDTO testObject(int testno) {
		TestDTO dto = null;
		try {
			dto = (TestDTO) mybatis.queryForObject("sol_test.testObject", testno);
		} catch (Exception e) {
			System.out.println("testObject error: " + e);
		}
		return dto;
	}// end

	public int testUpdate(TestDTO dto) {
		int res = 0;
		try {
			res = mybatis.update("sol_test.testUpdate", dto);
		} catch (Exception e) {
			System.out.println("testUpdate error: " + e);
		}
		return res;
	}// end
	
	public QuestionDTO questObject(QuestionDTO dto) {
		try {
			dto = (QuestionDTO) mybatis.queryForObject("sol_question.questObject", dto);
		} catch (Exception e) {
			System.out.println("testObject error: " + e);
		}
		return dto;
	}// end
	
	public boolean questionUpdate(QuestionDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_question.questionUpdate", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("questionUpdate error: " + e);
		}
		return flag;
	}// end
	
	public void testShowUpdate(TestDTO dto) {
		try {
			mybatis.update("sol_test.testShowUpdate", dto);
		} catch (Exception e) {
			System.out.println("testShowUpdate error: " + e);
		}
	}// end
//-------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------TEST END

//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------PLAYER START
	public PlayerDTO lecRead(int lectureno) {

		PlayerDTO dto = null;

		try {
			dto = (PlayerDTO) mybatis.queryForObject("sol_admin.lecRead", lectureno);
		} catch (Exception e) {
			System.out.println("lecRead error: " + e);
		}
		return dto;
	}// end

	public CategoryDTO categoryRead(int categoryno) {

		CategoryDTO dto = null;

		try {
			dto = (CategoryDTO) mybatis.queryForObject("sol_admin.categoryRead", categoryno);
		} catch (Exception e) {
			System.out.println("CategoryDTO error: " + e);
		}
		return dto;
	}// end

	public void categoryDelProc(int categoryno) {
		try {
			mybatis.update("sol_admin.categoryDelProc", categoryno);
		} catch (Exception e) {
			System.out.println("categoryDelProc error: " + e);
		}
	}// end

	public void lecDelProc(int lectureno) {
		try {
			mybatis.update("sol_admin.lecDelProc", lectureno);
		} catch (Exception e) {
			System.out.println("categoryDelProc error: " + e);
		}
	}// end


	public void lecUpdate(PlayerDTO dto) {
		try {
			mybatis.update("sol_admin.lecUpdate", dto);

		} catch (Exception e) {
			System.out.println("lecUpdate error: " + e);
		}
	}// end

	public String getCategoryInfo(int grade, String gwamok) {
		String categoryInfo = null;
		try {
			Map map = new HashMap();
			map.put("grade", grade);
			map.put("gwamok", gwamok);

			categoryInfo = (String) mybatis.queryForObject("sol_lecture.info", map);
			// System.out.println(">>>>>>>>>>>>>>"+categoryInfo);

		} catch (Exception e) {
			System.out.println("categoryInfo error: " + e);
		}
		return categoryInfo;
	}

	public List getlecList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.getlecList", map);
		} catch (Exception e) {
			System.out.println("getlecList error" + e);
		}
		return list;
	}// end

	public int getlecTotal(Map map) {
		int total = 0;
		try {
			total = (Integer) mybatis.queryForObject("sol_admin.getlecTotal", map);
		} catch (Exception e) {
			System.out.println("getlecTotal error" + e);
		}
		return total;
	}// end

	public List readCateInfo(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.readCateInfo", map);
		} catch (Exception e) {
			System.out.println("readCateInfo error" + e);
		}
		return list;
	}// end

	public int getCateTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_admin.getCateTotal", map);
		} catch (Exception e) {
			System.out.println("getCateTotal error: " + e);
		}
		return res;
	}

	public List getLectureno(int categoryno) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.getLectureno", categoryno);
		} catch (Exception e) {
			System.out.println("getLectureno error: " + e);
		}
		return list;
	}// end

	public void updateCateProc(CategoryDTO dto) {
		boolean flag = false;
		try {
			mybatis.update("sol_admin.updateCateProc", dto);
		} catch (Exception e) {
			System.out.println("updateCateProc error: " + e);
		}
	}// end

	public boolean cateIns(CategoryDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_admin.cateIns", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("cateIns error: " + e);
		}
		return flag;
	}// end

	public String checkCateinfo(int grade, String gwamok) {
		String categoryInfo = null;
		try {
			Map map = new HashMap();
			map.put("grade", grade);
			map.put("gwamok", gwamok);

			categoryInfo = (String) mybatis.queryForObject("sol_admin.checkCateinfo", map);

		} catch (Exception e) {
			System.out.println("categoryInfo error: " + e);
		}
		return categoryInfo;
	}// end
//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------PLAYER END

//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------MEMBER START
	public List getMemList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.getMemList", map);
		} catch (Exception e) {
			System.out.println("getMemList error" + e);
		}
		return list;
	}// end

	public int getMemTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_admin.getMemTotal", map);
		} catch (Exception e) {
			System.out.println("getMemTotal error: " + e);
		}
		return res;
	}

	public boolean memLevelProc(Map map) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_admin.memLevelProc", map);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("memLevelProc error: " + e);
		}
		return flag;
	}// end

	public void memDelProc(Map map) {
		try {
			// System.out.println(map.toString());
			mybatis.update("sol_admin.memDelProc", map);
		} catch (Exception e) {
			System.out.println("memDelProc error: " + e);
		}
	}// end
//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------MEMBER START

//-----------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------BBS START
	public void bbsDelProc(Map map) {
		try {
			mybatis.update("sol_admin.bbsDelProc", map);
		} catch (Exception e) {
			System.out.println("bbsDelProc error: " + e);
		}
	}// end
	
	public void replyDelProc(Map map) {
		try {
			mybatis.update("sol_admin.replyDelProc", map);
		} catch (Exception e) {
			System.out.println("replyDelProc error: " + e);
		}
	}// end
	
	public List noticeList(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_admin.noticeList", map);
		} catch (Exception e) {
			System.out.println("noticeList error" + e);
		}
		return list;
	}// end
	
	public int getNoticeTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_admin.getNoticeTotal", map);
		} catch (Exception e) {
			System.out.println("getNoticeTotal error: " + e);
		}
		return res;
	}
	
	public void noticeShowUpdate(BbsDTO dto) {
		try {
			mybatis.update("sol_bbs.noticeShowUpdate", dto);
		} catch (Exception e) {
			System.out.println("noticeShowUpdate error: " + e);
		}
	}// end

//-----------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------BBS EDN
	
//-----------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------QNA START
	
	public void qnaDelProc(Map map) {
		try {
			mybatis.update("sol_admin.qnaDelProc", map);
		} catch (Exception e) {
			System.out.println("qnaDelProc error: " + e);
		}
	}// end
	
//-----------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------QNA EDN

	
}
