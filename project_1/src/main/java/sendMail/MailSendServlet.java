package sendMail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mailSend")
public class MailSendServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public MailSendServlet() {super();}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			properties.put("mail.transport.protocol", "smtp");
			properties.put("mail.debug", "true");
			properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			Authenticator auth = new Authenticator() {
				//구글 계정 정보 입력해서 인증받음(구글 계정 아이디, 앱 비밀번호로 생성된 비밀번호)
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("", "");
				}
				
			};
			
			Session s = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(s);
			Address sender_address = new InternetAddress(sender);
			Address receiver_address = new InternetAddress(receiver);
			
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);
			
			out.println("<h3>메일이 정상적으로 발송되었습니다.</h3>");
			
			
		}catch(Exception e) {
			out.println("STMP 서버가 잘못 설정되었거나 서비스에 문제가 있습니다");
			e.printStackTrace();
			
		}
		
		/*
		 * javax.mail.MessagingException: Could not convert socket to TLS;
		 * Properties객체에 4개의 속성을 추가시켜줘서 해결함
		 * 
		 * javax.mail.AuthenticationFailedException: 535-5.7.8 Username and Password not accepted.
		 * Google 계정에서 2단계 인증으로 설정 변경 후 다시 Google 계정으로 로그인 > 계정관리 > 보안(왼쪽 메뉴) 화면으로 이동 후 
		 * 	    Google 로그인 부문에서 '앱 비밀번호' 클릭해서 메일, Windows 컴퓨터 비밀번호 생성해서 비밀번호에 입력해줌
		 */
		
	}
}
