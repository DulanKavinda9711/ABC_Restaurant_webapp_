package com.abc.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {

   
    private static final String SENDER_EMAIL = "abcrestaurantsl@outlook.com";
    private static final String SENDER_PASSWORD = "Abc@9711@#$";

    
    private static Session getSession() {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp-mail.outlook.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); 

        return Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });
    }

    
    public static void sendReservationAcceptedEmail(String recipientEmail, String recipientName, String date, String time) {
        try {
            Session session = getSession();

            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Reservation Accepted");

            
            String emailContent = "<h1>Reservation Accepted</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Your reservation for " + date + " at " + time + " has been accepted.</p>"
                    + "<p>We look forward to welcoming you.</p>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            
            message.setContent(emailContent, "text/html");

            
            Transport.send(message);

            System.out.println("Reservation accepted email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    
    public static void sendReservationRejectedEmail(String recipientEmail, String recipientName, String date, String time) {
        try {
            Session session = getSession();

            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Reservation Rejected");

            
            String emailContent = "<h1>Reservation Rejected</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>We regret to inform you that your reservation for " + date + " at " + time + " has been rejected.</p>"
                    + "<p>Please contact us if you have any questions.</p>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            
            message.setContent(emailContent, "text/html");

           
            Transport.send(message);

            System.out.println("Reservation rejected email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    
    public static void sendWelcomeEmail(String recipientEmail, String recipientName) {
        try {
            Session session = getSession();

          
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Welcome to ABC Restaurant!");

            
            String emailContent = "<h1>Welcome to ABC Restaurant</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Thank you for registering with ABC Restaurant.</p>"
                    + "<p>We are excited to have you onboard!</p>"
                    + "<br><p>The ABC Team</p>";

            
            message.setContent(emailContent, "text/html");

            
            Transport.send(message);

            System.out.println("Welcome email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    
    public static void sendReplyEmail(String recipientEmail, String recipientName, String subject, String originalMessage, String replyMessage) {
        try {
            Session session = getSession();

           
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Re: " + subject);

            
            String emailContent = "<h1>Reply to Your Query</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Thank you for reaching out to us. Here is our reply to your query:</p>"
                    + "<blockquote><strong>Your Original Message:</strong><br>" + originalMessage + "</blockquote>"
                    + "<blockquote><strong>Our Reply:</strong><br>" + replyMessage + "</blockquote>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            
            message.setContent(emailContent, "text/html");

            
            Transport.send(message);

            System.out.println("Reply email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    
    public static void sendOrderConfirmationEmail(String recipientEmail, String recipientName, String orderSummary, double totalPrice, String address) {
        try {
            Session session = getSession();

            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Thank you for your order from ABC Restaurant!");

            
            String emailContent = "<h1>Thank You for Your Order!</h1>"
                    + "<p>Dear " + recipientName + ",</p>"
                    + "<p>Thank you for placing an order with ABC Restaurant. We are thrilled to serve you!</p>"
                    + "<h3>Order Summary:</h3>"
                    + "<p><strong>Items:</strong></p>"
                    + "<p>" + orderSummary + "</p>"
                    + "<p><strong>Total Price:</strong> Rs " + totalPrice + "</p>"
                    + "<p><strong>Delivery Address:</strong></p>"
                    + "<p>" + address + "</p>"
                    + "<br><p>If you have any questions about your order, feel free to reach out to us.</p>"
                    + "<p>We appreciate your business and hope to see you again soon!</p>"
                    + "<br><p>Best regards,</p>"
                    + "<p>ABC Restaurant</p>";

            
            message.setContent(emailContent, "text/html");

            
            Transport.send(message);

            System.out.println("Order confirmation email sent to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
