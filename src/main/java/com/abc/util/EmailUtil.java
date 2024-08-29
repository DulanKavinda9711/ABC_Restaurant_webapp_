package com.abc.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    private static final String SMTP_HOST = "smtp.gmail.com"; // Replace with your SMTP host
    private static final String SMTP_PORT = "465"; // Replace with your SMTP port
    private static final String SMTP_USERNAME = "abcrestaurantsl@gmail.com"; // Replace with your email
    private static final String SMTP_PASSWORD = "psdf xdtj yewe pipw"; // Replace with your email password

    public static void sendEmail(String recipientEmail, String subject, String messageBody) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setText(messageBody);

            Transport.send(message);
            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
