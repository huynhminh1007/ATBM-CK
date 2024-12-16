package EmailService;

import java.io.File;

public interface IEmailService {
	boolean send(String to,String subject,String mess);
	boolean send(String to, String subject, String body, byte[] pdfAttachment, String pdfFilename);
}
