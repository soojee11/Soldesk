package kr.co.solproject.question;

import java.util.List;

import org.springframework.stereotype.Component;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.solproject.GetSqlMapClient;

@Component
public class QuestionDAO {
	private SqlMapClient mybatis=null;
	
	public QuestionDAO() {
		mybatis=GetSqlMapClient.get();
		System.out.println("---------------QuestionDAO��ü ������");
	}
	
	public List getQuestionList(int testno) {
		List list=null;
		try {
			list=mybatis.queryForList("sol_question.questionList",testno);

		}	catch(Exception e) {
			System.out.println("getQuestion error: "+e);		
		}
		return list;
	}//end
	
	public int getQuestionTotal(int testno) {
		int res=0;
		try {
			res=(Integer)mybatis.queryForObject("sol_question.getQuestionTotal",testno);

		}	catch(Exception e) {
			System.out.println("getQuestion error: "+e);		
		}
		return res;
	}//end
	
	public int getG_QuestionTotal(int testno) {
		int res=0;
		try {
			res=(Integer)mybatis.queryForObject("sol_question.getG_QuestionTotal",testno);

		}	catch(Exception e) {
			System.out.println("getG_QuestionTotal error: "+e);		
		}
		return res;
	}//end
}

