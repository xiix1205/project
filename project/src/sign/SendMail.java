package sign;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;

import javax.mail.PasswordAuthentication; 
import javax.mail.Session; 
import javax.mail.internet.MimeMessage; 

//import com.sun.jdi.connect.Transport;
import javax.mail.Transport; 


public class SendMail {

	private static SendMail smailInst = new SendMail();
	
	private SendMail() {}
	
	public static SendMail getInstance() {
		return smailInst;
	}
	
	static final String FROM = "MOVIEMOA";
	static final String FROMNAME = "무비모아";
	
	static final String SMTP_USERNAME = "kimhappy93@gmail.com";
	static final String SMTP_PASSWORD = "rladbal1!";
	
	static final String HOST = "smtp.gmail.com";
	static final int PORT = 587;
	
	static final String SUBJECT = "임시비밀번호 메일입니다.";
	
	public void sendMail(String receiver, String receiver_id, String pwd) {
		
		String to = receiver;
		
		String body = String.join(
				System.getProperty("line.separator"),
				"<p>안녕하세요" + receiver_id + "님</p>",
				"<p>회원님의 임시 비밀번호는 ["+pwd+"]입니다. </p>",
				"<p>로그인을 완료하신뒤 비밀번호를 변경해주세요.</p>"
				);
		
		
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		Transport transport = null;
		Session session = Session.getDefaultInstance(props);
		
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(FROM, FROMNAME));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(SUBJECT);
			msg.setContent(body, "text/html;charset=euc-kr");
			
			transport = session.getTransport();
		}catch(UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
		
		try {
			System.out.println("전송중");
			
			transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
			transport.sendMessage(msg, msg.getAllRecipients());
			
			System.out.println("전송완료");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(transport != null)
					transport.close();
			}catch(MessagingException e){
				e.printStackTrace();
			}
		}
	}

}