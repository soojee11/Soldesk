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
			System.out.println("��------MailController()��ü ������...");
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
		
		String subject  = "[solproject] ��й�ȣã�� �����Դϴ�.";
		
		String msgText = "";
		msgText = msgText.replace("\n", "<br/>");
		msgText = "�ȳ��ϼ��� [solproject]�Դϴ�! \n"+id+"���� �ӽú�й�ȣ�� ["+passwd+"]�Դϴ�. \n �ӽ� ��й�ȣ�� �α��� �� ���ο� ��й�ȣ�� �������ּ���. ";
		
		    
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(email);//�����»��
			messageHelper.setText(msgText);//����
			messageHelper.setFrom(from);//�޴»��
			messageHelper.setSubject(subject);//����
			messageHelper.setSentDate(new Date());//��¥
			
			mailSender.send(message);//��������
		} catch (Exception e) {
			System.out.println(e);
		}
		return "/sol_member/mailGo";
	}

}
