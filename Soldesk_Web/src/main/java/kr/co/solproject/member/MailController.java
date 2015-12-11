package kr.co.solproject.member;

import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MailController {
	
	public MailController() {
			System.out.println("▶------MailController()객체 생성됨...");
	}

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/sol_member/mail.do", method = RequestMethod.GET)
	public String sendMail(HttpServletRequest req, HttpServletResponse resp) {

		String id=  req.getParameter("id");
		String email= req.getParameter("email");
		String from= req.getParameter("from");
		String passwd= req.getParameter("passwd");
					
		System.out.println("*mail id= "+id);
		System.out.println("*mail email= "+email);
		System.out.println("*mail from= "+from);
		System.out.println("*mail passwd= "+passwd);
		
		String subject  = "[solproject] 비밀번호찾기 메일입니다.";
		
		String msgText = "";
		msgText = msgText.replace("\n", "<br/>");
		msgText = "안녕하세요 [solproject]입니다! \n"+id+"님의 임시비밀번호는 ["+passwd+"]입니다. \n 임시 비밀번호로 로그인 후 새로운 비밀번호로 변경해주세요. ";
		
		    
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(email);//보내는사람
			messageHelper.setText(msgText);//내용
			messageHelper.setFrom(from);//받는사람
			messageHelper.setSubject(subject);//제목
			messageHelper.setSentDate(new Date());//날짜
			
			mailSender.send(message);//메일전송
		} catch (Exception e) {
			System.out.println(e);
		}
		return "/sol_member/mailGo";
	}

}
