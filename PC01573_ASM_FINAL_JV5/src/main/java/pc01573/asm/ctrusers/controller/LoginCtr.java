package pc01573.asm.ctrusers.controller;

import java.io.IOException;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pc01573.asm.dao.AccountDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.model.ChangePassFrm;
import pc01573.asm.model.LoginFrm;
import pc01573.asm.model.MailInfo;
import pc01573.asm.model.OtpFrm;
import pc01573.asm.model.SendGmailOtpFrm;
import pc01573.asm.model.SingupFrm;
import pc01573.asm.service.CookieService;
import pc01573.asm.service.MailerService;
import pc01573.asm.service.SessionService;

@Controller
public class LoginCtr {

	@Autowired
	AccountDAO accountDAO;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	@Autowired
	MailerService mailerService;

	@Autowired
	SessionService sessions;

	@Autowired
	CookieService cookieService;

	@GetMapping("/botxxii/login")
	public String LoadLogin(Model m, @ModelAttribute("loginFrm") LoginFrm loginFrm) {
		
		return "/views/subpage/obligatory/login";
	}

	@PostMapping("/botxxii/login")
	public String postLogin(Model m, @Valid @ModelAttribute("loginFrm") LoginFrm loginFrm, BindingResult rs)
			throws IOException {
		Optional<Account> acc = accountDAO.findByUsernames(loginFrm.getUs());
		if (!acc.isEmpty()) {
			if (acc.get().getUsername().equals(loginFrm.getUs()) && !rs.hasErrors()) {
				if (acc.isPresent() && acc.get().getPassword().equals(loginFrm.getPass())) {
					sessions.set("AccountUser", acc.get());
					if (loginFrm.getRmb()) {
						cookieService.setCookie("UserID", acc.get().getUsername(), 365);
					}
					String uri = (String) sessions.get("UrlSecure");
					if (uri != null) {
						if (uri.equals("/botxxii/login") || uri.equals("/botxxii/signup")
								|| uri.equals("/subpage/sendmailotp") || uri.equals("/subpage/changepassotp")
								|| uri.equals("/botxxii/resendcode") || uri.equals("/subpage/sendotp")) {
							return("redirect:/botxxii/index");
						} else {
							resp.sendRedirect(uri);
						}
					} else {
						resp.sendRedirect("/botxxii/index");
					}
				}
			}
		}
		m.addAttribute("message", "*Đăng nhập thất bại: Tên đăng nhập hoặc mật khẩu chưa chính xác.");
		return "/views/subpage/obligatory/login";
	}

	@GetMapping("/botxxii/signup")
	public String LoadSingUp(Model m, @ModelAttribute("singupFrm") SingupFrm singupFrm) {
		return "/views/subpage/obligatory/singup";
	}

	@PostMapping("/botxxii/signup")
	public String postSingup(Model m, @Valid @ModelAttribute("singupFrm") SingupFrm singupFrm, BindingResult rs)
			throws IOException {
		Account account = new Account();
		if (!rs.hasErrors()) {
			account.setUsername(singupFrm.getUsername());
			account.setPassword(singupFrm.getPassword());
			account.setFullname(singupFrm.getFullname());
			account.setEmail(singupFrm.getEmail());
			account.setPhoto(singupFrm.getPhones());
			account.setActivated(true);
			account.setAdmin(false);
			accountDAO.save(account);
			resp.sendRedirect("/botxxii/login");
		}
		return "/views/subpage/obligatory/singup";
	}

	@GetMapping("/botxxii/signout")
	public String signOut() {
		sessions.remove("AccountUser");
		cookieService.remove("UserID");
//		return "redirect:/botxxii/index";
		System.out.println(sessions.get("URLSingOut").toString());
		return "redirect:/botxxii/index";
	}

	@GetMapping("/subpage/sendmailotp")
	public String getForgotPass(Model m, @ModelAttribute("sendGmailOtpFrm") SendGmailOtpFrm sendGmailOtpFrm) {
		return "/views/subpage/user/sendemail";
	}

	@PostMapping("/subpage/sendmailotp")
	public String postForgotPass(Model m, @Valid @ModelAttribute("sendGmailOtpFrm") SendGmailOtpFrm sendGmailOtpFrm,
			BindingResult rs) {
		Integer otp = this.randomOTP();
		if (!rs.hasErrors()) {
			MailInfo mail = new MailInfo();
			mail.setTo(sendGmailOtpFrm.getEmail());
			mail.setSubject("Xác Thực Tài Khoản <BOTXXII>");
			mail.setBody(
					"OTP Xác Nhận Đổi Lại Mật Khẩu: " + otp + " (Lưu ý: Vui lòng không gửi mã OTP này cho bất kỳ ai.)");
			try {
				mailerService.send(mail);
				sessions.set("GMAIL_YWRtaW4", sendGmailOtpFrm.getEmail());
				String otps = String.valueOf(otp);
				sessions.set("OTP_YWRtaW4", otps);
				sessions.set("isOTP_YWRtaW4", false);
				return "redirect:/subpage/sendotp";
			} catch (MessagingException e) {
				m.addAttribute("message", "*Gửi gmail không thành công.");
			}

		}
		return "/views/subpage/user/sendemail";
	}

	@GetMapping("/subpage/sendotp")
	public String getSendOTP(Model m, @ModelAttribute("otpFrm") OtpFrm otpFrm) {
		if(sessions.get("OTP_YWRtaW4")==null) {
			sessions.set("isOTP_YWRtaW4", false);
			return "redirect:/subpage/sendmailotp";
		}
		return "/views/subpage/user/sendotp";
	}

	@PostMapping("/subpage/sendotp")
	public String postSendOTP(Model m, @Valid @ModelAttribute("otpFrm") OtpFrm otpFrm, BindingResult rs) {
		if (!rs.hasErrors()) {
			sessions.remove("OTP_YWRtaW4");
			sessions.set("isOTP_YWRtaW4", true);
			return "redirect:/subpage/changepassotp";
		}
		return "/views/subpage/user/sendotp";
	}

	@RequestMapping("/botxxii/resendcode")
	public String resendOTP(Model m) {
		MailInfo mail = new MailInfo();

		Integer otp = this.randomOTP();
		String gmailTo = sessions.get("GMAIL_YWRtaW4");
		if (gmailTo == null) {
			return "redirect:/subpage/sendmailotp";
		}
		mail.setTo(gmailTo);
		mail.setSubject("Xác Thực Tài Khoản <BOTXXII>");
		mail.setBody(
				"OTP Xác Nhận Đổi Lại Mật Khẩu: " + otp + " (Lưu ý: Vui lòng không gửi mã OTP này cho bất kỳ ai.)");
		try {
			mailerService.send(mail);
			sessions.set("GMAIL_YWRtaW4", mail.getTo());
			String otps = String.valueOf(otp);
			sessions.set("OTP_YWRtaW4", otps);
		} catch (MessagingException e) {
			m.addAttribute("message", "*Gửi gmail không thành công.");
		}
		return "redirect:/subpage/sendotp";
	}

	@GetMapping("/subpage/changepassotp")
	public String getChangePassOTP(Model m, @ModelAttribute("changePassFrm") ChangePassFrm changePassFrm) {
		String gmail = sessions.get("GMAIL_YWRtaW4");
		Boolean isOTP = sessions.get("isOTP_YWRtaW4");
		System.out.println(isOTP);
		if (gmail == null) {
			return "redirect:/subpage/sendmailotp";
		}
		if (isOTP == false) {
			return "redirect:/subpage/sendotp";
		}

		return "/views/subpage/user/changepassotp";
	}

	@PostMapping("/subpage/changepassotp")
	public String postChangePassOTP(Model m, @Valid @ModelAttribute("changePassFrm") ChangePassFrm changePassFrm,
			BindingResult rs) {
		String gmail = sessions.get("GMAIL_YWRtaW4");
		if (this.checkFormChangePassOtp()) {
			return "redirect:/subpage/sendmailotp";
		} else {
			if (!rs.hasErrors()) {
				Account account = accountDAO.findByEmail(gmail).get();
				if (account != null) {
					account.setPassword(changePassFrm.getPwd());
					accountDAO.save(account);
					sessions.remove("GMAIL_YWRtaW4");
					sessions.set("isOTP_YWRtaW4", false);
					return "redirect:/botxxii/login";
				}
			}
		}
		return "/views/subpage/user/changepassotp";
	}

	public Integer randomOTP() {
		Integer randomInt = 0;
		for (int i = 1; i < 2; i++) {
			double randomDouble = Math.random();
			randomDouble = randomDouble * 1000000 + 1;
			randomInt = (int) randomDouble;
			if (String.valueOf(randomInt).length() < 6) {
				i = 1;
			} else {
				break;
			}
		}
		return randomInt;
	}

	public Boolean checkFormChangePassOtp() {
		String gmail = sessions.get("GMAIL_YWRtaW4");
		Boolean isOTP = sessions.get("isOTP_YWRtaW4");
		System.out.println(isOTP);
		if (gmail == null || isOTP == false) {
			return true;
		}
		return false;
	}
}
