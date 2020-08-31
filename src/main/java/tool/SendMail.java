package tool;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    public static boolean sendMail(String to, String subject, String text) {
       

        System.out.println("SSLEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        // below mentioned mail.smtp.port is optional 
        props.put("mail.smtp.port", "587");		
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("duy1st3@gmail.com", "duy1994789");
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");  
            message.setFrom(new InternetAddress("UNIFY"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to)); 
            message.setSubject(subject,"UTF-8");
            message.setText(text,"UTF-8");
            Transport.send(message);
           
        } catch (MessagingException e) {
            System.out.println(e);
            System.out.println("false");
            return false;
            
        }
         System.out.println("true");
        return true;
       
    }
}
