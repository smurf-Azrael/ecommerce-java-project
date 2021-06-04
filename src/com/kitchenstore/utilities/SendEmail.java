package com.kitchenstore.utilities;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public final class SendEmail {

	public static final void sendEmail(List<String> toList, String subject, String htmlContent) {

		// Sender's email ID needs to be mentioned
		String from = "kitchenstore07@gmail.com";
		final String username = "kitchenstore07@gmail.com";
		final String gPassword = "KitchenStore@3130";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, gPassword);
			}
		});

		String emails = "";
		for (String email : toList) {
			emails += email + ",";
		}
		StringBuilder to = new StringBuilder(emails);

		to.deleteCharAt(to.length() - 1);

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from, "Kitchen Store"));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to.toString()));

			// Set Subject: header field
			message.setSubject(subject);

			// Send the actual HTML message
			message.setContent(htmlContent, "text/html");

			// Send message
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
