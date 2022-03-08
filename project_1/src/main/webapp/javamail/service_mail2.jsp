<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.Properties" %>
<%@ page import="javax.mail.*, javax.mail.internet.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	response.setContentType("text/html;charset=UTF-8");

	Properties properties = new Properties();//서블릿과 다른점
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
			return new PasswordAuthentication("chesye21", "kctosnzpniokubwe");
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

%>