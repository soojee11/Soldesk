package kr.co.solproject.reply;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class ReplyDAO {
	  private SqlMapClient mybatis=null;
	  public ReplyDAO(){
	    mybatis = GetSqlMapClient.get();
	  }//end
	  
	  public int QnaReplyCreate(ReplyDTO dto) {
			int res=0;
			try {
				res=(Integer) mybatis.update("sol_reply.QnaReplyCreate",dto);
			}	catch(Exception e) {
				System.out.println("QnaReplyCreate error: "+e);		
			}
			return res;
	  }//end
	  
	  public void setReplyOk(int number, String tablename){
		  try {
			  if(tablename.equals("Q"))
				mybatis.update("sol_reply.setQnaReplyOk",number);
			  else{
				mybatis.update("sol_reply.setBbsReplyOk",number);
			  }
			}	catch(Exception e) {
				System.out.println("setReplyOk error: "+e);		
			}
	  }//end
	  
	  public ReplyDTO getReply(int tableno, String tablename){
		  ReplyDTO dto = null;
		  try {
			  if(tablename.equals("Q"))
				dto = (ReplyDTO) mybatis.queryForObject("sol_reply.getQnaReply",tableno);
			  if(tablename.equals("B")){
				dto = (ReplyDTO) mybatis.queryForObject("sol_reply.getBbsReply",tableno);
			  }
			}	catch(Exception e) {
				System.out.println("getReply error: "+e);		
			}
		  return dto;
	  }//end
	  
	  public int replyDel(int replyno){
		  int res = 0;
		  try {
			  res = mybatis.update("sol_reply.replyDel", replyno);
			}catch(Exception e) {
				System.out.println("replyDel error: "+e);		
			}
		  return res;
	  }//end
	  
	  public int setReplyNo(int tableno, String tablename){
		  int res = 0;
		  try {
			  if(tablename.equals("Q"))
				  res = mybatis.update("sol_reply.setQnaReplyNo",tableno);
			  else{
				  res = mybatis.update("sol_reply.setBbsReplyNo",tableno);
			  }
			}	catch(Exception e) {
				System.out.println("setReplyNo error: "+e);		
			}
		  return res;
	  }//end
	  
	  public int checkPasswd(Map map, String tablename){
		  int res = 0;
		  try {
			  if(tablename.equals("Q"))
				  res = (Integer) mybatis.queryForObject("sol_reply.checkQPasswd",map);
			  if(tablename.equals("B"))
				  res = (Integer) mybatis.queryForObject("sol_reply.checkBPasswd",map);
			  
			}	catch(Exception e) {
				System.out.println("checkPasswd error: "+e);		
			}
		  return res;
	  }//end
	  
	  public boolean replyUpdate(ReplyDTO dto){
		  boolean flag = false;
			try {
			   int cnt =	mybatis.update("sol_reply.replyUpdate", dto);
				if(cnt>0)
		    		flag=true;
			}catch(Exception e) {
				System.out.println("replyUpdate error: "+e);		
			}
			return flag;
		}//end
	  
	  public int bbsReplyCreate(ReplyDTO dto) {
			int res=0;
			try {
				res=(Integer) mybatis.update("sol_reply.bbsReplyCreate",dto);
			}	catch(Exception e) {
				System.out.println("bbsReplyCreate error: "+e);		
			}
			return res;
	  }//end
	  
	  public int bbsReplyDelete(int replyno){
		  int res = 0;
		  try {
			  res = mybatis.delete("sol_reply.bbsReplyDelete", replyno);
			}catch(Exception e) {
				System.out.println("bbsReplyDelete error: "+e);		
			}
		  return res;
	  }//end
	  
	  public ReplyDTO getBbsReply(int replyno){
		  ReplyDTO dto = null;
		  try {
				dto = (ReplyDTO) mybatis.queryForObject("sol_reply.getBbsReply",replyno);
			}	catch(Exception e) {
				System.out.println("getBbsReply error: "+e);		
			}
		  return dto;
	  }//end
	  
	  public boolean bbsReplyUpdate(ReplyDTO dto){
		  boolean flag = false;
			try {
			   int cnt = mybatis.update("sol_reply.bbsReplyUpdate", dto);
				if(cnt>0)
		    		flag=true;
			}catch(Exception e) {
				System.out.println("bbsReplyUpdate error: "+e);		
			}
			return flag;
		}//end
	  
	  public int studyQnaReplyCreate(ReplyDTO dto) {
			int res=0;
			try {
				res=(Integer) mybatis.update("sol_reply.studyQnaReplyCreate",dto);
			}	catch(Exception e) {
				System.out.println("studyQnaReplyCreate error: "+e);		
			}
			return res;
	  }//end
	  
}
