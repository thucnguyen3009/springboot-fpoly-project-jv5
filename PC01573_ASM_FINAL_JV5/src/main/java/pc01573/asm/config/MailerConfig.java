package pc01573.asm.config;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import pc01573.asm.model.MailInfo;
import pc01573.asm.service.MailerService;

@Service
public class MailerConfig implements MailerService {

	@Autowired
	JavaMailSender sender;

	List<MimeMessage> queue = new ArrayList<>();

	@Override
	public void send(MailInfo mail) throws MessagingException {
		// Gửi message đến SMTP server
		sender.send(this.MyGmail(mail));
	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		MailInfo mail = new MailInfo(to, subject, body);
		this.send(mail);
	}

	@Override
	public void queue(MailInfo mail) throws MessagingException {
		// Thêm message vào hàng đợi
		queue.add(this.MyGmail(mail));
	}

	@Override
	public void queue(String to, String subject, String body) throws MessagingException {
		MailInfo mail = new MailInfo(to, subject, body);
		this.queue(mail);
	}

	// Số giây chạy phương thức run()
	public static final long secondRun = 3;

//	@Scheduled(fixedDelay = secondRun * 1000)
	public void run() {
		int success = 0, error = 0;
		while (!queue.isEmpty()) {
			MimeMessage message = queue.remove(0);
			try {
				sender.send(message);
				success++;
			} catch (Exception e) {
				error++;
				queue.add(message);
			}
		}
		System.out.printf(">> Sent: %d, Error: %d\n", success, error);
	}

	@Override
	public MimeMessage MyGmail(MailInfo mail) throws MessagingException {
		// Tạo message
		MimeMessage message = sender.createMimeMessage();
		// Sử dụng Helper để thiết lập các thông tin cần thiết cho message
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		for (String email : mail.getCc()) {
			helper.addCc(email);
		}
		for (String email : mail.getBcc()) {
			helper.addBcc(email);
		}
		for (File file : mail.getFiles()) {
			helper.addAttachment(file.getName(), file);
		}
		return message;
	}
}
