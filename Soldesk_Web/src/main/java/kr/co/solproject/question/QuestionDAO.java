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
		System.out.println("---------------QuestionDAO°´Ã¼ »ý¼ºµÊ");
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
	
}

