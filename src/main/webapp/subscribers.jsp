<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,javax.mail.*,javax.activation.*"%>
<%@page import="javax.mail.internet.*"%>
<html>
<head>
</head>
<body>
	<%
		String email = request.getParameter("email");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "root");
			Statement st = conn.createStatement();
			int i = st.executeUpdate("insert into subscribers(email)values('" + email + "')");
			response.sendRedirect("http://localhost:8095/first/home.html");

		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	%>
	<%
		//Creating a result for getting status that messsage is delivered or not!
		//Get recipient's email-ID, message & subject-line from index.html page
		final String to = request.getParameter("email");
		final String subject = "FreshBites";
		final String messg = "Welcome to FreshBites!\nThank you for subscribing to our newsletter! From new products to new offers, we promise to keep you up to date with the latest JMASK news.";
		//Sender's email ID and password needs to be mentioned
		final String from = "freshbitesthegrocerystore@gmail.com";
		final String pass = "Qwerty@12345";
		//Defining the gmail host
		String host = "smtp.gmail.com";
		//Creating Properties object
		Properties props = new Properties();
		//Defining properties
		props.put("mail.smtp.host", host);
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.user", from);
		props.put("mail.password", pass);
		props.put("mail.port", "443");
		//Authorized the Session object.
		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, pass);
			}
		});
		try {
			//Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			//Set From: header field of the header.
			message.setFrom(new InternetAddress(from));
			//Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			//Set Subject: header field
			message.setSubject(subject);
			//Now set the actual message
			//This mail has 2 part, the BODY and the embedded image
			MimeMultipart multipart = new MimeMultipart("related");
			//first part (the html)
			BodyPart messageBodyPart = new MimeBodyPart();
			String htmlText = "<h1 style='text-align:center;'>Welcome to FreshBites!</h1><h4 style='text-align:center;'>Thank you for subscribing to our newsletter! From new products to new offers, we promise to keep you up to date with the latest FreshBites news.</h4><img src=\"cid:image\" width=100px style='display:block;margin-left:auto;margin-right:auto'>";
			messageBodyPart.setContent(htmlText, "text/html");
			//add it
			multipart.addBodyPart(messageBodyPart);
			//second part (the image)
			messageBodyPart = new MimeBodyPart();
			DataSource fds = new FileDataSource("file:///C:/Users/DELL/eclipse-workspace/first/src/main/webapp/logo.png");
			messageBodyPart.setDataHandler(new DataHandler(fds));
			messageBodyPart.setHeader("Content-ID", "<image>");
			//add image to the multipart
			multipart.addBodyPart(messageBodyPart);
			//put everything together
			message.setContent(multipart);
			//Send message
			Transport.send(message);
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	%>
</body>
</html>