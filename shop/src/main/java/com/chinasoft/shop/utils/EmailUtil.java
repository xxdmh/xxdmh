package com.chinasoft.shop.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class EmailUtil {
	public static void sendMail (String to,String code) {
		Properties props = new Properties() ;
		props.put("mail.smtp.host", "smtp.163.com");
		props.put("mail.smtp.auth", "true");
		Authenticator authenticator = new Authenticator(){
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("18180576653", "xxdmh543627");
			}
		};
		Session session = Session.getInstance(props, authenticator);
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress("18180576653@163.com"));
			msg.setRecipients(RecipientType.TO,to);
			msg.setSubject("Come from xxdmh");
			msg.setContent("<a href=\"http://172.4.14.139:8080/shop/user/updateToken.action?token="+code+"\">xxdmh:http://172.4.14.139:8080/shop/user/updateToken.action?token="+code, "text/html;charset=utf-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
