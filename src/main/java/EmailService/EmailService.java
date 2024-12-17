package EmailService;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.util.ByteArrayDataSource;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

public class EmailService implements IEmailService {

    public Session getSesstion(Properties props) {
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailProperty.APP_EMAIL, MailProperty.APP_PASSWORD);
            }
        });
        return session;
    }

    @Override
    public boolean send(String to, String subject, String mess) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", MailProperty.HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", MailProperty.TSL_PORT);
        Session session = getSesstion(props);
        MimeMessage message = new MimeMessage(session);
        try {
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            message.setSubject(subject, "utf-8");
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setContent(mess, "text/html; charset=UTF-8");
            InternetAddress fromAddress = new InternetAddress("21130451@st.hcmuaf.edu.vn", "Lương Thực Việt");
            message.setFrom(fromAddress);
            message.setSentDate(new Date());

            Transport.send(message);
            return true;
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean send(String to, String subject, String body, byte[] pdfAttachment, String pdfFilename) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", MailProperty.HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", MailProperty.TSL_PORT);
        Session session = getSesstion(props);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            message.setSubject(subject, "utf-8");

            // Create a multipart message
            MimeMultipart multipart = new MimeMultipart();

            // Add the email body
            MimeBodyPart bodyPart = new MimeBodyPart();
            bodyPart.setContent(body, "text/html; charset=UTF-8");
            multipart.addBodyPart(bodyPart);

            // Add the PDF attachment
            if (pdfAttachment != null && pdfFilename != null) {
                MimeBodyPart attachmentPart = new MimeBodyPart();
                DataSource dataSource = new ByteArrayDataSource(pdfAttachment, "application/pdf");
                attachmentPart.setDataHandler(new DataHandler(dataSource));
                attachmentPart.setFileName(pdfFilename);
                multipart.addBodyPart(attachmentPart);
            }

            // Set the multipart content
            message.setContent(multipart);

            // Set the sender
            InternetAddress fromAddress = new InternetAddress("21130451@st.hcmuaf.edu.vn", "Lương Thực Việt");
            message.setFrom(fromAddress);
            message.setSentDate(new Date());

            Transport.send(message);
            return true;
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return false;
        }
    }
}