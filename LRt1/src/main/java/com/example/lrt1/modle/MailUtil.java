package com.example.lrt1.modle;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
//	/**
//	 *
//	 * @param email
//	 * @param emailMsg
//	 * @throws Exception
//	 */
	public void sendMail(String userEmail, String emailMsg) throws Exception {
		
        // 1. session
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "SMTP");
        props.setProperty("mail.host", "smtp.qq.com"); //smtp.126.com?SMTP
        props.setProperty("mail.smtp.auth", "true"); // true
        

        Authenticator auth = new Authenticator() {
        	public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("GCT", "rsaq uknx jtgn jgje"); //todo
			}
        };
        

        Session session= Session.getInstance(props,auth);
        
        
        // 2.message
        Message message = new MimeMessage(session);

        // From:
        // InternetAddress

        message.setFrom(new InternetAddress("1587558540@qq.com","System_login","utf-8"));

        // To:
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(userEmail));
      
        // Subject:
        message.setSubject("邮箱验证");

        // Content:
        message.setContent(emailMsg, "text/html;charset=UTF-8");

        // 3.transport
        Transport.send(message);
    }
}
