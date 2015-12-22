package kr.co.solproject.qnabbs;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;
import kr.co.solproject.qnabbs.QnaDTO;

@Component
public class QnaDAO {
	  private SqlMapClient mybatis=null;
	  public QnaDAO(){
	    mybatis = GetSqlMapClient.get();
	  }
	  
	  public List getQnaList(Map map) {
			List list=null;
			try {
				list=mybatis.queryForList("sol_qna.getQnaList",map);
			}	catch(Exception e) {
				System.out.println("getQnaList error: "+e);		
			}
			return list;
	  }//end
	  
	  public int getQnaTotal(Map map) {
			int res=0;
			try {
				res=(Integer) mybatis.queryForObject("sol_qna.getQnaTotal",map);
			}	catch(Exception e) {
				System.out.println("getQnaTotal error: "+e);		
			}
			return res;
	  }//end
	  
	  public boolean qnaInsert(QnaDTO dto){
		    boolean flag = false;
		    try{
		    	int cnt=mybatis.update("sol_qna.qnaInsert",dto);
		    	if(cnt>0)
		    		flag=true;
		    }catch (Exception e){
		      System.out.println("qnaInsert error: "+e);
		    }
		    return flag;
	  }//end
	  
	  public String readId(int qnano){
		  String id = "";
		   try{
		    	id=(String) mybatis.queryForObject("sol_qna.readId",qnano);
		    }catch (Exception e){
		      System.out.println("readId error: "+e);
		    }
		    return id;
	  }//end
	  
	  public QnaDTO qnaRead(int qnano){
		  QnaDTO dto = null;
		  try{
		    	dto= (QnaDTO) mybatis.queryForObject("sol_qna.qnaRead",qnano);
		    }catch (Exception e){
		      System.out.println("qnaRead error: "+e);
		    }
		  return dto;
	  }//end
	  
	  public void readCount(int qnano){
			try {
				mybatis.update("sol_qna.readCount", qnano);
			}catch(Exception e) {
				System.out.println("readCount error: "+e);		
			}
		}
	  
	  public String getMlevel(String s_id){
		  String mlevel = "";
		   try{
			   mlevel=(String) mybatis.queryForObject("sol_qna.getMlevel",s_id);
		    }catch (Exception e){
		      System.out.println("getMlevel error: "+e);
		    }
		    return mlevel;
	  }//end
	  
	  public int replyDelete(Map map){
		  int res = 0;
			try {
				mybatis.update("sol_qna.replyDelete", map);
			}catch(Exception e) {
				System.out.println("replyDelete error: "+e);		
			}
			return res;
		}//end

	  public int qnaDelete(int qnano){
		  int res = 0;
			try {
				mybatis.update("sol_qna.qnaDelete", qnano);
			}catch(Exception e) {
				System.out.println("qnaDelete error: "+e);		
			}
			return res;
		}//end
	  
	  public boolean qnaUpdate(QnaDTO dto){
		  boolean flag = false;
			try {
			   int cnt =	mybatis.update("sol_qna.qnaUpdate", dto);
				if(cnt>0)
		    		flag=true;
			}catch(Exception e) {
				System.out.println("qnaUpdate error: "+e);		
			}
			return flag;
		}//end
	  


}
