package kr.co.solproject.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao = null;

	public MemberController() {
		System.out.println("▶------MemberController()객체 생성됨...");
	}
	// http://localhost:9090/solproject/index.jsp

	// --------------------------------------------------------------------

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginsucess(HttpServletRequest req, HttpSession session) {

		return "/sol_index";

	}// end

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = dto.getId();
		String pw = dto.getPasswd();
		String mlevel = dto.getMlevel();

		Map map = new HashMap();
		map.put("id", id);
		map.put("pw", pw);
		map.put("mlevel", mlevel);
		int logincount = dao.loginCount(map);

		if (logincount == 0) {
			// 아이디 비번일치하지않으면 guest로 설정
			mav.addObject("r_id", "guest");
			mav.addObject("r_pw", "guest");
			session.setAttribute("s_id", "guest");
			session.setAttribute("s_pw", "guest");

			mav.setViewName("/sol_member/loginError");
			return mav;
		} else {

			String c_id = req.getParameter("c_id");

			if (c_id == null) {
				// 체크하지않은경우
				c_id = "";
			}
			System.out.println(c_id);

			Cookie cookie = null;
			if (c_id.equals("SAVE")) {
				cookie = new Cookie("c_id", id);// (쿠키변수명, 값)
				cookie.setMaxAge(60 * 60 * 24 * 31);// 1 month 동안 쿠키저장
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
			}
			resp.addCookie(cookie);// 사용자 pc에 쿠키값 저장

			// session영역
			session.setAttribute("s_id", id);
			session.setAttribute("s_pw", pw);

			mav.setViewName("/sol_index");

			return mav;
		}
	}// end

	@RequestMapping(value = "/logout.do", method = RequestMethod.POST)
	public String loginout(HttpServletRequest req, HttpSession session) {

		return "/sol_member/logout";

	}// end

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String login(HttpServletRequest req, HttpSession session) {

		return "/sol_index";

	}// end

	@RequestMapping("/joinagree.do")
	public String join(HttpServletRequest req, HttpSession session) {

		return "/sol_member/agreement";

	}// end

	@RequestMapping(value = "/joinok.do", method = RequestMethod.POST)
	public String joinok(HttpServletRequest req, HttpSession session) {
		return "/sol_member/join";

	}// end

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinproc(MemberDTO dto, HttpServletRequest req, HttpSession session) {
		String id = dto.getId();
		String name = dto.getName();
		String passwd = dto.getPasswd();
		String email = dto.getEmail();
		String tel = dto.getTel();
		String zipcode = dto.getZipcode();
		String address1 = dto.getAddress1();
		String address2 = dto.getAddress2();
		String promise = dto.getPromise();
		boolean flag = dao.join(dto);

		if (flag) {
			return "redirect:./index.do";
		} else {
			req.setAttribute("msg", "회원가입에 실패했습니다.<br/><Br/>");
			return "/sol_member/error";
		}

	}// end

	@RequestMapping("/intro.do")
	public String intro(HttpServletRequest req, HttpSession session) {

		return "/sol_study/intro";

	}// end

	@RequestMapping("/examList.do")
	public String examList(HttpServletRequest req, HttpSession session) {

		return "/sol_exam/examList";

	}// end

	@RequestMapping("/bbsList.do")
	public String bbsList(HttpServletRequest req, HttpSession session) {

		return "/sol_bbs/bbsList";

	}// end

	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req, HttpSession session) {

		return "/sol_mypage/intro";

	}// end

	@RequestMapping("/total.do")
	public String total(HttpServletRequest req, HttpSession session) {

		return "/sol_total/total";

	}// end

	@RequestMapping("/checkid.do")
	public String checkid(HttpServletRequest req, HttpSession session) {

		return "/sol_member/checkid";

	}// end

	@RequestMapping(value = "/checkid.do", method = RequestMethod.POST)
	public String idcheck(String id, HttpServletRequest req, HttpSession session) {

		int res = 0;
		res = dao.idcheck(id);

		if (res == 0) {
			id.trim();
			req.setAttribute("id", id);
			return "/sol_member/checkprocid";
		} else {
			req.setAttribute("msg", "중복된 아이디가 존재합니다.<br/><Br/>");
			req.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			req.setAttribute("link2", "<input type='button' value='닫기' onclick=\"javascript:window.close();\">");
			return "/sol_member/error";
		}
	}// end

	@RequestMapping("/checkemail.do")
	public String checkemail(HttpServletRequest req, HttpSession session) {

		return "/sol_member/checkemail";

	}// end

	@RequestMapping(value = "/checkemail.do", method = RequestMethod.POST)
	public String emailcheck(String email, HttpServletRequest req, HttpSession session) {

		int res = 0;
		res = dao.emailcheck(email);

		if (res == 0) {
			req.setAttribute("email", email);
			return "/sol_member/checkprocemail";
		} else {
			req.setAttribute("msg", "중복된 이메일이 존재합니다.<br/><Br/>");
			req.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			req.setAttribute("link2", "<input type='button' value='닫기' onclick=\"javascript:window.close();\">");
			return "/sol_member/error";
		}
	}// end

	@RequestMapping("/checkzip.do")
	public String checkzip(HttpServletRequest req, HttpSession session) {

		return "/sol_member/checkzip";

	}// end

	@RequestMapping(value = "/checkzip.do", method = RequestMethod.POST)
	public String zipcheck(String dong, HttpServletRequest req, HttpSession session) {

		List<ZipcodeDTO> list = dao.zipcheck(dong);
		System.out.println("동이릉: " + dong);
		System.out.println("리스트: " + list);

		if (list.size() == 0) { // list ==null은 안됨!

			return "/sol_member/zipError";
		} else {
			req.setAttribute("dong", dong);
			req.setAttribute("list", list);
			return "/sol_member/checkzip";
		}
	}// end

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(String id, HttpServletRequest req, HttpSession session) {
		System.out.println(id);
		req.setAttribute("id", id);
		return "/sol_member/update";
	}// end

	@RequestMapping(value = "/updateproc.do", method = RequestMethod.POST)
	public String updateproc(MemberDTO dto, String passwd, String id, HttpServletRequest req, HttpSession session) {

		System.out.println(passwd);
		System.out.println(id);

		Map map = new HashMap();
		map.put("passwd", passwd);
		map.put("id", id);
		int res = dao.pwcheck(map);

		if (res != 0) {
			dto = dao.read(id);

			String name = dto.getName();
			String email = dto.getEmail();
			String tel = dto.getTel();
			String zipcode = dto.getZipcode();
			String address1 = dto.getAddress1();
			String address2 = dto.getAddress2();
			String promise = dto.getPromise();

			req.setAttribute("id", id);
			req.setAttribute("passwd", passwd);
			req.setAttribute("email", email);
			req.setAttribute("name", name);
			req.setAttribute("tel", tel);
			req.setAttribute("zipcode", zipcode);
			req.setAttribute("address1", address1);
			req.setAttribute("address2", address2);
			req.setAttribute("promise", promise);
			System.out.println(email);
			System.out.println(name);
			System.out.println(tel);

			return "/sol_member/updateProc";
		} else {
			return "/sol_member/updateError";
		}

	}// end

	@RequestMapping(value = "/updatego.do", method = RequestMethod.POST)
	public String updatego(MemberDTO dto, HttpServletRequest req, HttpSession session) {

		boolean flag = dao.updatego(dto);

		if (flag) {

			String id = dto.getId();
			session.setAttribute("s_id", id);
			return "/sol_member/updateSuccess";
		} else {
			req.setAttribute("msg", "정보수정에 실패했습니다.<br/><Br/>");
			return "/sol_member/error";
		}
	}// end

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(MemberDTO dto, HttpServletRequest req, HttpSession session) {
		System.out.println(dto.getId());
		String id = dto.getId();
		req.setAttribute("id", id);

		return "/sol_member/delete";
	}// end

	@RequestMapping(value = "/deleteproc.do", method = RequestMethod.POST)
	public String deleteproc(MemberDTO dto, HttpServletRequest req, HttpSession session) {

		String id = dto.getId();
		String passwd = dto.getPasswd();

		System.out.println(passwd);
		System.out.println(id);

		Map map = new HashMap();
		map.put("passwd", passwd);
		map.put("id", id);
		int res = dao.deletego(map);

		if (res != 0) {
			return "/sol_member/deleteSuccess";
		} else {
			return "/sol_member/updateError";
		}
	}// end

	@RequestMapping("/findform.do")
	public String findform(HttpServletRequest req, HttpSession session) {

		return "/sol_member/findform";

	}// end

	@RequestMapping(value = "/findidform.do", method = RequestMethod.POST)
	public String findidform(String name,String email,String from, HttpServletRequest req, HttpSession session) {

		System.out.println(name);
		System.out.println(email);
		System.out.println(from);

		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		String id = dao.findid(map);

		if (id != null) {
			req.setAttribute("id", id);
			req.setAttribute("name", name);
			
			return "/sol_member/findidform"; 
		} else {
			return "/sol_member/findidError";
		}
	}// end

	@RequestMapping(value = "/findpwform.do", method = RequestMethod.POST)
	public String findpwform(String id,String email,String from, HttpServletRequest req, HttpSession session) {

		Map map = new HashMap();
		map.put("id", id);
		map.put("email", email);
		String passwd = dao.findpw(map);

		System.out.println("id= "+id);
		System.out.println("email= "+email);
		System.out.println("from= "+from);
		System.out.println("passwd= "+passwd);

		
		if (passwd != null) {
			String password = "";
			  for(int i = 0; i < 8; i++){
			   //char upperStr = (char)(Math.random() * 26 + 65);
			   char lowerStr = (char)(Math.random() * 26 + 97);
			   if(i%2 == 0){
			    password += (int)(Math.random() * 10);
			   }else{
			    password += lowerStr;
			   }
			  }
			password = password + "!@";
			passwd = password;
			
			Map map2 = new HashMap();
			map2.put("id", id);
			map2.put("email", email);
			map2.put("passwd", passwd);
			int res = dao.findpwupdate(map2);
						
			System.out.println(res+""+passwd);
			
			//메일보내는거-request에 올리지않아도된다.
			return "redirect:./mail.do?id="+id+"&passwd="+passwd+"&email="+email+"&from="+from;
			
			/*			return "/sol_member/mail";*/
		} else {
			return "/sol_member/findpwError";
		}
	}// end
	
	
	
	
}
