package kr.co.solproject.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.solproject.category.CategoryDTO;
import kr.co.solproject.member.MemberDTO;
import kr.co.solproject.player.PlayerDTO;
import kr.co.solproject.question.QuestionDTO;
import kr.co.solproject.test.TestDTO;
import net.utility.Paging;
import net.utility.UploadSaveManager;
import net.utility.Utility;


@Controller
public class AdminCont {
	
	@Autowired
	private AdminDAO dao=null;
	
	public AdminCont() {
		System.out.println("--------------AdminCont객체 생성됨");
	}
	
	@RequestMapping(value="sol_admin/login.do", method=RequestMethod.GET)
	public String loginForm() {
		return "sol_admin/adminLogin";
	}
	
	@RequestMapping(value="sol_admin/logout.do", method=RequestMethod.GET)
	public String logoutForm() {
		return "sol_admin/adminLogout";
	}
	
	@RequestMapping(value="sol_admin/adminIndex.do", method=RequestMethod.GET)
	public String indexForm() {
		return "sol_admin/adminIndex";
	}
	
	@RequestMapping(value="sol_admin/adminIndex.do", method=RequestMethod.POST)
	public String loginProc(MemberDTO dto, HttpServletRequest request, HttpSession session) {
		
		String id = request.getParameter("adminid").trim();
		String passwd = request.getParameter("adminpw").trim();
		
		dto.setId(id);
		dto.setPasswd(passwd);
		
		String mlevel = dao.loginProc(dto);		// 회원등급 가져오기
		
		if(mlevel==null){						// 로그인 실패
			return "sol_admin/passwderror";
		
		}else{ 	// 로그인 성공 
			
			if(mlevel.equals("A")){
				session.setAttribute("s_admin_id", id);
				session.setAttribute("s_admin_mlevel", mlevel);
				session.setAttribute("s_admin_passwd", passwd);
				
				return "sol_admin/adminIndex";
				
			}else{
				request.setAttribute("flag","false");
				return "sol_admin/adminLogin";
			}
			
		}
	}//end

	@RequestMapping(value="sol_admin/leclist.do")
	public String lecList(HttpServletRequest request) {
		
		int categoryno = Integer.parseInt(request.getParameter("categoryno"));
		
		String url = "./leclist.do?categoryno="+categoryno;	
		
		int numPerPage=5;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		map.put("categoryno", categoryno);
		
		List list = null;
		int total = 0;
		
		list = dao.getlecList(map);
		total = dao.getlecTotal(map);
		
		String dbean = Utility.getDate();
		String paging = Paging.paging5(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		
		request.setAttribute("flag", 1);
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);
	
		return "sol_admin/player/playerList";
		
	}//end
	
	@RequestMapping(value="sol_admin/leclist2.do")
	public String lecList2(HttpServletRequest request) {
		
		
		int categoryno = Integer.parseInt(request.getParameter("categoryno"));
		
		String url = "./leclist2.do?categoryno="+categoryno;
		
		int numPerPage=5;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		map.put("categoryno", categoryno);
		
		List list = null;
		int total = 0;
		
		list = dao.getlecList(map);
		total = dao.getlecTotal(map);
		
		String dbean = Utility.getDate();
		String paging = Paging.paging5(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		
		request.setAttribute("flag", 2);
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);
	
		return "sol_admin/player/playerList";
		
	}//end
	
	@RequestMapping(value="sol_admin/lecread.do", method=RequestMethod.GET)
	public String lecRead(PlayerDTO dto, HttpServletRequest request) {
		
		dto = dao.lecRead(dto.getLectureno());

		String filename = dto.getFilename();
		filename = filename.toUpperCase();

		if (filename.endsWith(".MP3")) {
			request.setAttribute("file_end", "MP3");
			
		} else if (filename.endsWith(".MP4")) {
			request.setAttribute("file_end", "MP4");
		}
		
		int categoryno = dto.getCategoryno();
		CategoryDTO dto2 = null;
		dto2 = dao.categoryRead(categoryno);
		
		request.setAttribute("flag", 1);
		request.setAttribute("dto", dto);
		request.setAttribute("dto2", dto2);
		request.setAttribute("root", Utility.getRoot());

		return "sol_admin/player/playerRead";
	}//end
	
	@RequestMapping(value="sol_admin/lecread2.do", method=RequestMethod.GET)
	public String lecRead2(PlayerDTO dto, HttpServletRequest request) {
		
		dto = dao.lecRead(dto.getLectureno());

		String filename = dto.getFilename();
		filename = filename.toUpperCase();

		if (filename.endsWith(".MP3")) {
			request.setAttribute("file_end", "MP3");
			
		} else if (filename.endsWith(".MP4")) {
			request.setAttribute("file_end", "MP4");
		}
		
		int categoryno = dto.getCategoryno();
		CategoryDTO dto2 = null;
		dto2 = dao.categoryRead(categoryno);
		
		request.setAttribute("flag", 2);
		request.setAttribute("dto", dto);
		request.setAttribute("dto2", dto2);
		request.setAttribute("root", Utility.getRoot());

		return "sol_admin/player/playerRead";
	}//end
	
	@RequestMapping(value="sol_admin/lecDel.do", method=RequestMethod.GET)
	public String lecDel(HttpServletRequest request) {
		
		PlayerDTO dto = null;
		CategoryDTO dto2 = null;
		
		//System.out.println("------lecno"+request.getParameter("lectureno"));
		//System.out.println("------cateno"+request.getParameter("categoryno"));
		
		int lectureno = Integer.parseInt(request.getParameter("lectureno"));
		int categoryno = Integer.parseInt(request.getParameter("categoryno"));
		
		dto = dao.lecRead(lectureno);
		dto2 = dao.categoryRead(categoryno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("dto2", dto2);
				
		return "sol_admin/player/playerDel";
	}//end
	
	@RequestMapping(value="sol_admin/lecDelProc.do", method=RequestMethod.GET)
	public String lecDelProc(int lectureno, int categoryno, HttpServletRequest request) {
		
		//dao.categoryDelProc(categoryno);
		
		request.setAttribute("root", Utility.getRoot());

		// 실제 물리적인 경로
		String basePath = Utility.getRealPath(request, "/sol_admin/player/storage");

		// 파일 삭제
		PlayerDTO oldDTO = dao.lecRead(lectureno); // 기존에 등록된 파일 정보 가져오기
		Utility.deleteFile(basePath, oldDTO.getPoster());
		Utility.deleteFile(basePath, oldDTO.getFilename());

		dao.lecDelProc(lectureno);

		return "redirect:leclist2.do?categoryno="+categoryno;
		
	}//end
	
	
	@RequestMapping(value = "/sol_admin/testList.do")
	public String testList(HttpServletRequest request) {

		String url = "testList.do"; // page링크시 이동할 페이지
		int nowPage = 1; // 현재페이지, 페이지 시작번호 0->1page
		int numPerPage = 5; // 페이지당 레코드 수

		int recNo = 1; // 게시판 목록에 출력될 글 번호

		String col1 = null;// null이면 <dynamic prepend="where">가 적용안됨
		if (request.getParameter("col1") != "") {
			col1 = request.getParameter("col1");
			// System.out.println("학년: "+col1);
		}

		String col2 = null;
		if (request.getParameter("col2") != "") {
			col2 = request.getParameter("col2");
			// System.out.println("과목: "+col2);
		}

		// 현재 페이지의 정보를 가져옴
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// int sno=((nowPage-1)*numPerPage)+1; //(0*5)+1=1,6,11
		int sno = ((nowPage - 1) * numPerPage);
		// int eno=nowPage*numPerPage;//1*5=5,10,15

		Map map = new HashMap();
		map.put("col1", col1);
		map.put("col2", col2);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);

		List list = dao.testList(map);
		String dbean = Utility.getDate();
		int total = dao.testTotal(map);

		String paging = Paging.paging(total, nowPage, numPerPage, col1, col2, url);

		recNo = total - (nowPage - 1) * numPerPage;

		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col1", col1);
		request.setAttribute("col2", col2);
		request.setAttribute("total", total);

		return "sol_admin/test/testList";
	}// end

	@RequestMapping(value = "sol_admin/testForm.do", method = RequestMethod.GET)
	public String testForm() {
		return "sol_admin/test/testForm";
	}

	@RequestMapping(value = "sol_admin/testInsert.do", method = RequestMethod.POST)
	public String testInsert(TestDTO dto, HttpServletRequest request) {

		boolean flag = dao.testInsert(dto);

		if (flag) {
			request.setAttribute("flag", "true");
			return "redirect:testList.do";
		} else {
			request.setAttribute("msg", "문제지 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='문제지 목록' onclick=\"location.href='testList.do';\">");

			return "sol_admin/error";
		}

	}// end

	@RequestMapping(value = "sol_admin/questionList.do")
	public String questionList(QuestionDTO dto, HttpServletRequest request) {
		int nowPage = 1;
		int numPerPage = 10;

		int recNo = 1;
		
		String col = null;
		if (request.getParameter("col") != "") {
			col = request.getParameter("col");

		}
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * numPerPage);

		Map map=new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("testno", dto.getTestno());
		map.put("numPerPage", numPerPage);

		List list = dao.questionList(map);
		String dbean = Utility.getDate();
		int total = dao.questionTotal(map);

		recNo = total - (nowPage - 1) * numPerPage + 1;

		request.setAttribute("col", col);request.setAttribute("recNo", recNo);
		request.setAttribute("list", list);
		request.setAttribute("questno", dto.getTestno());
		request.setAttribute("dbean", dbean);

		return "sol_admin/test/questionList";
	} //end
	
	@RequestMapping(value = "sol_admin/questionForm.do", method = RequestMethod.GET)
	public String questionForm() {
		return "sol_admin/test/questionForm";
	}
	
	@RequestMapping(value = "sol_admin/questionInsert.do", method = RequestMethod.POST)
	public String questionInsert(QuestionDTO dto, HttpServletRequest request) {
		// -------------------------------------------------------------
		// 전송된 파일이 저장될 실제 물리적인 경로 파악
		String basePath = Utility.getRealPath(request, "/sol_admin/test/storage");

		// 1) postMF파일 관련
		MultipartFile posterMF = dto.getPosterMF(); // 파일꺼내옴

		// 파일 저장 및 리네임된 파일명 반환
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		dto.setPoster(poster);
		// -------------------------------------------------------------
		
		if(dto.getQtype().equals("OX"))
			dto.setAnswer(request.getParameter("OXAnswer"));
		
		if(dto.getQtype().equals("G")) {
			StringBuffer example = new StringBuffer();
			example.append(request.getParameter("example1").trim());
			example.append("/");
			example.append(request.getParameter("example2").trim());
			example.append("/");
			example.append(request.getParameter("example3").trim());
			example.append("/");
			example.append(request.getParameter("example4").trim());
			example.append("/");
			example.append(request.getParameter("example5").trim());
			//System.out.println("example보기:" +example);
	
		
			String exampleCheck=request.getParameter("exampleCheck");
			dto.setAnswer(request.getParameter(exampleCheck));
			String str = example.toString();
			dto.setExample(str);
			
		}
		boolean flag = dao.questionInsert(dto);
		

		if (flag) {
			request.setAttribute("flag", "true");
			return "redirect:questionList.do?testno="+dto.getTestno();
		} else {
			request.setAttribute("msg", "문제 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			request.setAttribute("link2", "<input type='button' value='문제 목록' onclick=\"location.href='questionList.do';\">");

			return "sol_admin/error";
		}

	}
	
	@RequestMapping(value = "sol_admin/questionSelect.do", method = RequestMethod.POST)
	public String questionSelect(QuestionDTO dto, HttpServletRequest request) {

		String[] checks=request.getParameterValues("check");
		
		String str=""; 
		for(int idx=0; idx<checks.length; idx++) {
			str+=checks[idx]+",";
		}
		str=str.substring(0,str.length()-1);
		//System.out.println(str);
		
		List list = new ArrayList();
		int selno;
		String[] str2 = str.split(",");		// ","을 기준으로 분리
		for (int idx = 0; idx < str2.length; idx++) {
			//System.out.println(str2[idx]);
			selno=Integer.parseInt(str2[idx]);
			list.add(selno);
		}
		//System.out.println("list:" +list);
		
		//System.out.println("dto.getTestno(): "+dto.getTestno());
		Map map=new HashMap();
		map.put("list", list);
		map.put("testno", dto.getTestno());
		
		dao.questionSelect(map);
		
		return "redirect:questionList.do?testno="+dto.getTestno();
	}

	@RequestMapping(value = "sol_admin/questionUnSelect.do", method = RequestMethod.POST)
	public String questionUnSelect(QuestionDTO dto, HttpServletRequest request) {

		String[] checks=request.getParameterValues("check2");
		
		String str=""; 
		for(int idx=0; idx<checks.length; idx++) {
			str+=checks[idx]+",";
		}
		str=str.substring(0,str.length()-1);
		//System.out.println(str);
		
		List list = new ArrayList();
		int selno;
		String[] str2 = str.split(",");		// ","을 기준으로 분리
		for (int idx = 0; idx < str2.length; idx++) {
			//System.out.println(str2[idx]);
			selno=Integer.parseInt(str2[idx]);
			list.add(selno);
		}
		//System.out.println("list:" +list);
		
		//System.out.println("dto.getTestno(): "+dto.getTestno());
		Map map=new HashMap();
		map.put("list", list);
		map.put("testno", dto.getTestno());
		
		dao.questionUnSelect(map);
		
		return "redirect:questionList.do?testno="+dto.getTestno();
	}
	
	@RequestMapping(value = "sol_admin/lecUpdate.do", method = RequestMethod.GET)
	public String lecUpdate(int lectureno, int categoryno, HttpServletRequest request) {
		//System.out.println("lectureno---"+lectureno);
		//System.out.println("categoryno---"+categoryno);
		
		PlayerDTO dto = null;
		CategoryDTO dto2 = null;
		
		dto = dao.lecRead(lectureno);
		dto2 = dao.categoryRead(categoryno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("dto2", dto2);
		
		return "sol_admin/player/playerUpdate";
	}
	
	@RequestMapping(value = "sol_admin/lecUpdate.do", method = RequestMethod.POST)
	public String lecUpdateProc(PlayerDTO dto, HttpServletRequest request) {
		
		System.out.println("lectureno: "+dto.getLectureno());
		int lectureno = dto.getLectureno();
		
		request.setAttribute("root", Utility.getRoot());
		
		String basePath = Utility.getRealPath(request, "/sol_admin/player/storage");
		PlayerDTO oldDTO = dao.lecRead(lectureno);
		
		//1) posterMF 파일 관련
		MultipartFile posterMF = dto.getPosterMF();
		
		if(posterMF.getSize()>0){
			Utility.deleteFile(basePath, oldDTO.getPoster());
			String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
			dto.setPoster(poster);
		}else{	
			dto.setPoster(oldDTO.getPoster());
		}
		
		// 2) filenameMF 파일 관련 
		MultipartFile filenameMF = dto.getFilenameMF();
		
		if(filenameMF.getSize()>0){
			Utility.deleteFile(basePath, oldDTO.getFilename());
			String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
			dto.setFilename(filename);	
			dto.setFilesize(filenameMF.getSize());
			
		}else{	
			dto.setFilename(oldDTO.getFilename());	
			dto.setFilesize(oldDTO.getFilesize());
		}
		
		dao.lecUpdate(dto);
		//System.out.println("old update cateno: "+oldDTO.getCategoryno());
		return "redirect:leclist2.do?categoryno="+oldDTO.getCategoryno();
	}
	
	@RequestMapping(value="sol_admin/memlist.do", method=RequestMethod.GET)
	public String memList(HttpServletRequest request) {
		
		String url = "./memlist.do";
		
		int numPerPage=5;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		String col = null;
		if(request.getParameter("col") != null){
			col = request.getParameter("col");
			System.out.println("검색컬럼: "+col);
		}
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list = dao.getMemList(map);
		String dbean = Utility.getDate();
		int total = dao.getMemTotal(map);
		
		String paging = Paging.paging4(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("total", total);
		
		return "sol_admin/member/memberList";
	}//end
	
	@RequestMapping(value="sol_admin/memmlevel.do", method=RequestMethod.GET)
	public String memLevelList(HttpServletRequest request) {
		
		String url = "./memmlevel.do";
		
		int numPerPage=5;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		String col = null;
		if(request.getParameter("col") != null){
			col = request.getParameter("col");
			System.out.println("검색컬럼: "+col);
		}
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list = dao.getMemList(map);
		String dbean = Utility.getDate();
		int total = dao.getMemTotal(map);
		
		String paging = Paging.paging4(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("total", total);
		
		return "sol_admin/member/memLevel";
	}//end
	
	@RequestMapping(value="sol_admin/memmlevel.do", method=RequestMethod.POST)
	public String memLevelProc(String mlevel, String id, HttpServletRequest request) {	
		
		System.out.println(mlevel);
		System.out.println(id);
		
		Map map = new HashMap();
		map.put("mlevel", mlevel);
		map.put("id", id);
		
		Boolean flag = dao.memLevelProc(map);
			
		String url = "./memmlevel.do";
			
		int numPerPage=5;	
		int recNo=1;
			
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
			
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);

		String col = request.getParameter("col");
		String paging ="";
		
		Map map2 = new HashMap();
		map2.put("col", col);
		map2.put("sno", sno);
		map2.put("numPerPage", numPerPage);
			
		List list = dao.getMemList(map2);
		String dbean = Utility.getDate();
		int total = dao.getMemTotal(map2);
			
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		
		if(col==null){
			col="mdate";
			paging = Paging.paging4(total, intNowPage, numPerPage, url);
		}else{
			col = request.getParameter("col");
			System.out.println("검색컬럼: "+col);
		}
			
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("total", total);
	
		return "sol_admin/member/memLevel";
	}//end
	
	@RequestMapping(value="sol_admin/memdelete.do", method=RequestMethod.GET)
	public String memDelete(HttpServletRequest request) {	
		
		String url = "./memdelete.do";
		
		int numPerPage=5;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		String col = null;
		if(request.getParameter("col") != null){
			col = request.getParameter("col");
			System.out.println("검색컬럼: "+col);
		}
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list = dao.getMemList(map);
		String dbean = Utility.getDate();
		int total = dao.getMemTotal(map);
		
		String paging = Paging.paging4(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("total", total);
		
		return "sol_admin/member/memDelete";
	}//end
	
	@RequestMapping(value="sol_admin/memdelete.do", method=RequestMethod.POST)
	public String memDelProc(MemberDTO dto, HttpServletRequest request) {	

			String[] checks=request.getParameterValues("check2");
			
			String str=""; 
			for(int idx=0; idx<checks.length; idx++) {
				str+=checks[idx]+",";
			}
			str=str.substring(0,str.length()-1);
			System.out.println(str);
			
			List list2 = new ArrayList();
			String id = "";
			String[] str2 = str.split(",");		// ","을 기준으로 분리
			for (int idx = 0; idx < str2.length; idx++) {
				System.out.println(str2[idx]);
				id=str2[idx];
				list2.add(id);
			}
			System.out.println("list:" +list2);
			
			Map map=new HashMap();
			map.put("list", list2);
			
			dao.memDelProc(map);
			
			String url = "./memdelete.do";
			
			int numPerPage=5;	
			int recNo=1;
			
			String nowPage = request.getParameter("nowPage");
			if (nowPage == null) {
				nowPage = "1";
			}
			
			int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
			int intNowPage = Integer.parseInt(nowPage);
			
			String col = null;
			if(request.getParameter("col") != null){
				col = request.getParameter("col");
				System.out.println("검색컬럼: "+col);
			}
			
			Map map2 = new HashMap();
			map2.put("col", col);
			map2.put("sno", sno);
			map2.put("numPerPage", numPerPage);
			
			List list = dao.getMemList(map2);
			String dbean = Utility.getDate();
			int total = dao.getMemTotal(map2);
			
			String paging = Paging.paging4(total, intNowPage, numPerPage, url);
			
			recNo = total - (intNowPage - 1) * numPerPage + 1 ;
			
			request.setAttribute("list", list);
			request.setAttribute("dbean", dbean);
			request.setAttribute("paging", paging);
			request.setAttribute("recNo", recNo);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("col", col);
			request.setAttribute("total", total);
			
			return "sol_admin/member/memDelete";
			
	}//end
	
	@RequestMapping(value = "/sol_admin/testDelete.do")
	public String testDelete(HttpServletRequest request) {

		String url = "testDelete.do"; // page링크시 이동할 페이지
		int nowPage = 1; // 현재페이지, 페이지 시작번호 0->1page
		int numPerPage = 5; // 페이지당 레코드 수

		int recNo = 1; // 게시판 목록에 출력될 글 번호

		String col1 = null;// null이면 <dynamic prepend="where">가 적용안됨
		if (request.getParameter("col1") != "") {
			col1 = request.getParameter("col1");
			// System.out.println("학년: "+col1);
		}

		String col2 = null;
		if (request.getParameter("col2") != "") {
			col2 = request.getParameter("col2");
			// System.out.println("과목: "+col2);
		}

		// 현재 페이지의 정보를 가져옴
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// int sno=((nowPage-1)*numPerPage)+1; //(0*5)+1=1,6,11
		int sno = ((nowPage - 1) * numPerPage);
		// int eno=nowPage*numPerPage;//1*5=5,10,15

		Map map = new HashMap();
		map.put("col1", col1);
		map.put("col2", col2);
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);

		List list = dao.testList(map);
		String dbean = Utility.getDate();
		int total = dao.testTotal(map);

		String paging = Paging.paging(total, nowPage, numPerPage, col1, col2, url);

		recNo = total - (nowPage - 1) * numPerPage;

		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col1", col1);
		request.setAttribute("col2", col2);
		request.setAttribute("total", total);

		return "sol_admin/test/testDelete";
	}// end
	
	@RequestMapping(value = "sol_admin/questionDeleteList.do")
	public String questionDeleteList(QuestionDTO dto, HttpServletRequest request) {
		int nowPage = 1;
		int numPerPage = 10;

		int recNo = 1;
		
		String col = null;
		if (request.getParameter("col") != "") {
			col = request.getParameter("col");

		}
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * numPerPage);

		Map map=new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("testno", dto.getTestno());
		map.put("numPerPage", numPerPage);

		List list = dao.questionList(map);
		String dbean = Utility.getDate();
		int total = dao.questionTotal(map);

		recNo = total - (nowPage - 1) * numPerPage + 1;

		request.setAttribute("col", col);request.setAttribute("recNo", recNo);
		request.setAttribute("list", list);
		request.setAttribute("questno", dto.getTestno());
		request.setAttribute("dbean", dbean);

		return "sol_admin/test/questionDeleteList";
	} //end
	
	@RequestMapping(value = "sol_admin/testDeleteProc.do")
	public String testDeleteProc(QuestionDTO dto, HttpServletRequest request) {

		String[] checks=request.getParameterValues("check3");
		
		String str=""; 
		for(int idx=0; idx<checks.length; idx++) {
			str+=checks[idx]+",";
		}
		str=str.substring(0,str.length()-1);
		//System.out.println(str);
		
		List testDeleteList = new ArrayList();
		int delno;
		String[] str2 = str.split(",");		// ","을 기준으로 분리
		for (int idx = 0; idx < str2.length; idx++) {
			//System.out.println(str2[idx]);
			delno=Integer.parseInt(str2[idx]);
			testDeleteList.add(delno);
		}
		//System.out.println("testDeleteList:" +testDeleteList);
		
		Map map=new HashMap();
		map.put("testDeleteList", testDeleteList);
		
		int res=dao.testDeleteProc(map);
		
		return "redirect:testDelete.do";
	}

	@RequestMapping(value="sol_admin/readCateInfo.do", method=RequestMethod.GET)
	public String readCateInfo(HttpServletRequest request) {
		
		String url = "./readCateInfo.do";
		
		int numPerPage=6;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list = dao.readCateInfo(map);
		
		String dbean = Utility.getDate();
		int total = dao.getCateTotal(map);
		
		String paging = Paging.paging4(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);
		
		return "sol_admin/player/readCateInfo";
	}//end
	
	@RequestMapping(value="sol_admin/cateUpdate.do", method=RequestMethod.GET)
	public String updateCateInfo(int categoryno, HttpServletRequest request) {
		CategoryDTO dto = null;
		dto = dao.categoryRead(categoryno);
		
		request.setAttribute("categoryno", categoryno);
		request.setAttribute("dto", dto);
		
		return "sol_admin/player/updateCateInfo";
	}//end
	
	@RequestMapping(value="sol_admin/cateUpdate.do", method=RequestMethod.POST)
	public String updateCateProc(CategoryDTO dto, HttpServletRequest request) {
		dao.updateCateProc(dto);
		return "redirect:./updelete.do";
	}//end
	
	
	@RequestMapping(value="sol_admin/cateDel.do", method=RequestMethod.GET)
	public String delCateInfo(int categoryno, HttpServletRequest request) {
		CategoryDTO dto = null;
		
		dto = dao.categoryRead(categoryno);
		
		request.setAttribute("categoryno", categoryno);
		request.setAttribute("dto", dto);
		
		return "sol_admin/player/delCateInfo";
	}//end
	
	@RequestMapping(value="sol_admin/cateDelProc.do", method=RequestMethod.GET)
	public String delCateProc(int categoryno, HttpServletRequest request) {
		System.out.println(categoryno);
		List list = new ArrayList();
		int lectureno = 0;
		list = dao.getLectureno(categoryno);
		Iterator it = list.iterator();
		while(it.hasNext()){
			
			lectureno = (Integer) it.next();
		    System.out.println("--lectureno : "+lectureno);
		    
		    String basePath = Utility.getRealPath(request, "/sol_admin/player/storage");
		    
		    PlayerDTO oldDTO = dao.lecRead(lectureno); // 기존에 등록된 파일 정보 가져오기
			Utility.deleteFile(basePath, oldDTO.getPoster());
			Utility.deleteFile(basePath, oldDTO.getFilename());
			
			dao.lecDelProc(lectureno);
			dao.categoryDelProc(categoryno);
		    
		}
		request.setAttribute("root", Utility.getRoot());
		return "redirect:./updelete.do";
	}//end
	
	@RequestMapping(value="sol_admin/cateInsert.do", method=RequestMethod.GET)
	public String cateInsert(HttpServletRequest request) {
		return "sol_admin/player/categoryIns";
	}//end
	
	@RequestMapping(value="sol_admin/cateInsert.do", method=RequestMethod.POST)
	public String cateInsProc(CategoryDTO dto, HttpServletRequest request) {
		//System.out.println("grade;" + dto.getGrade());
		//System.out.println("getGwamok;" + dto.getGwamok());
		String checkCateinfo = "";
		checkCateinfo=dao.checkCateinfo(dto.getGrade(), dto.getGwamok());
		
		System.out.println("checkCateinfo: "+checkCateinfo);
		
		if(checkCateinfo != null){
			request.setAttribute("msg",0);
			return "sol_admin/player/readCateInfo";
		}else{
			boolean flag = dao.cateIns(dto);
			if (flag) {
				request.setAttribute("msg", 1);
				return "sol_admin/player/readCateInfo";
			} else {
				request.setAttribute("msg", "강좌 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
				request.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
				request.setAttribute("link2", "<input type='button' value='강좌 목록' onclick=\"location.href='readCateInfo.do';\">");

				return "sol_admin/error";
			}
		}
	}//end
	
	@RequestMapping(value="sol_admin/updelete.do", method=RequestMethod.GET)
	public String cateupdelete(HttpServletRequest request) {
		
		String url = "./readCateInfo.do";
		
		int numPerPage=6;	
		int recNo=1;
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int sno = ((Integer.parseInt(nowPage) - 1) * numPerPage);
		int intNowPage = Integer.parseInt(nowPage);
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("numPerPage", numPerPage);
		
		List list = dao.readCateInfo(map);
		
		String dbean = Utility.getDate();
		int total = dao.getCateTotal(map);
		
		String paging = Paging.paging4(total, intNowPage, numPerPage, url);
		
		recNo = total - (intNowPage - 1) * numPerPage + 1 ;
		request.setAttribute("list", list);
		request.setAttribute("dbean", dbean);
		request.setAttribute("paging", paging);
		request.setAttribute("recNo", recNo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("total", total);
			
		return "sol_admin/player/cateUpDelete";
	}//end
	
	
}
