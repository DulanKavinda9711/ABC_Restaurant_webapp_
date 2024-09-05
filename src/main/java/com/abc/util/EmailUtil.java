package com.abc.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {

    // Your Outlook email and password (use environment variables for security)
    private static final String SENDER_EMAIL = "abcrestaurantsl@outlook.com";
    private static final String SENDER_PASSWORD = "Abc@9711@#$";

    // Shared method to configure SMTP properties
    private static Session getSession() {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp-mail.outlook.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable TLS

        return Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });
    }

    // Method to send reservation acceptance email
    public static void sendReservationAcceptedEmail(String recipientEmail, String recipientName, String date, String time) {
        try {
            Session session = getSession();

            // Create a MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Reservation Accepted");

            // Compose the email content
            String emailContent = "<h1>Reservation Accepted</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Your reservation for " + date + " at " + time + " has been accepted.</p>"
                    + "<p>We look forward to welcoming you.</p>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            // Set the email content as HTML
            message.setContent(emailContent, "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Reservation accepted email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Method to send reservation rejection email
    public static void sendReservationRejectedEmail(String recipientEmail, String recipientName, String date, String time) {
        try {
            Session session = getSession();

            // Create a MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Reservation Rejected");

            // Compose the email content
            String emailContent = "<h1>Reservation Rejected</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>We regret to inform you that your reservation for " + date + " at " + time + " has been rejected.</p>"
                    + "<p>Please contact us if you have any questions.</p>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            // Set the email content as HTML
            message.setContent(emailContent, "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Reservation rejected email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Method to send welcome email (as already implemented)
    public static void sendWelcomeEmail(String recipientEmail, String recipientName) {
        try {
            Session session = getSession();

            // Create a MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Welcome to ABC Restaurant!");

            // Compose the email content
            String emailContent = "<h1>Welcome to ABC Restaurant</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Thank you for registering with ABC Restaurant.</p>"
                    + "<p>We are excited to have you onboard!</p>"
                    + "<br><p>The ABC Team</p>";

            // Set the email content as HTML
            message.setContent(emailContent, "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Welcome email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public static void sendReplyEmail(String recipientEmail, String recipientName, String subject, String originalMessage, String replyMessage) {
        try {
            Session session = getSession();

            // Create a MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Re: " + subject);

            // Compose the email content
            String emailContent = "<h1>Reply to Your Query</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Thank you for reaching out to us. Here is our reply to your query:</p>"
                    + "<blockquote><strong>Your Original Message:</strong><br>" + originalMessage + "</blockquote>"
                    + "<blockquote><strong>Our Reply:</strong><br>" + replyMessage + "</blockquote>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            // Set the email content as HTML
            message.setContent(emailContent, "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Reply email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
