package pc01573.asm.ctrusers.controller;

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
import pc01573.asm.model.ChangePassProfile;
import pc01573.asm.model.EditProfileUser;
import pc01573.asm.service.SessionService;

@Controller
public class ProfileCtr {

	@Autowired
	AccountDAO accountDAO;

	@Autowired
	SessionService sessions;

	@GetMapping("botxxii/myaccount")
	public String getMyaccount(Model m, @ModelAttribute("editProfileUser") EditProfileUser editProfileUser) {
		m.addAttribute("active1", "active");
		m.addAttribute("viewAside", "/WEB-INF/views/utilities/users/MngForUser.jsp");
		m.addAttribute("viewsFroMngUser", "/WEB-INF/views/subpage/user/ediprofile.jsp");
		Account account = sessions.get("AccountUser");
		editProfileUser.setFullname(account.getFullname());
		editProfileUser.setMail(account.getEmail());
		editProfileUser.setPhones(account.getPhoto());
		return "/views/index";
	}

	@PostMapping("botxxii/myaccount")
	public String postMyaccount(Model m, @Valid @ModelAttribute("editProfileUser") EditProfileUser editProfileUser,
			BindingResult rs) {
		m.addAttribute("active1", "active");
		m.addAttribute("viewAside", "/WEB-INF/views/utilities/users/MngForUser.jsp");
		m.addAttribute("viewsFroMngUser", "/WEB-INF/views/subpage/user/ediprofile.jsp");

		Boolean errFullName = rs.hasFieldErrors("fullname");
		Boolean errEmail = rs.hasFieldErrors("mail");
		Boolean errPhone = rs.hasFieldErrors("phones");
		Account acc = sessions.get("AccountUser");
		if (rs.getFieldValue("mail").equals(acc.getEmail())) {
			errEmail = false;
		}
		if (rs.getFieldValue("phones").equals(acc.getPhoto())) {
			errPhone = false;
		}
		if (errEmail != true && errFullName != true && errPhone != true) {
			acc.setEmail(editProfileUser.getMail());
			acc.setFullname(editProfileUser.getFullname());
			acc.setPhoto(editProfileUser.getPhones());
			accountDAO.save(acc);
			sessions.set("AccountUser", acc);
		}
		return "/views/index";
	}

	@GetMapping("botxxii/profilechangepass")
	public String Load2(Model m, @ModelAttribute("changePassProfile") ChangePassProfile changePassProfile) {
		m.addAttribute("active3", "active");
		m.addAttribute("viewAside", "/WEB-INF/views/utilities/users/MngForUser.jsp");
		m.addAttribute("viewsFroMngUser", "/WEB-INF/views/subpage/user/changepass.jsp");
		return "/views/index";
	}

	@PostMapping("botxxii/profilechangepass")
	public String postLoad2(Model m, @Valid @ModelAttribute("changePassProfile") ChangePassProfile changePassProfile,
			BindingResult rs) {
		m.addAttribute("active3", "active");
		m.addAttribute("viewAside", "/WEB-INF/views/utilities/users/MngForUser.jsp");
		m.addAttribute("viewsFroMngUser", "/WEB-INF/views/subpage/user/changepass.jsp");
		if (!rs.hasErrors()) {
			Account account = sessions.get("AccountUser");
			account.setPassword(changePassProfile.getNewPass());
			accountDAO.save(account);
			m.addAttribute("message","Thông báo: Đổi mật khẩu thành công.");
			changePassProfile.setCfmPass("");
			changePassProfile.setOldPass("");
			changePassProfile.setNewPass("");
		}
		return "/views/index";
	}

	@RequestMapping("/botxxii/myaccount/cancel")
	public String cancelProfile(@ModelAttribute("editProfileUser") EditProfileUser editProfileUser) {
		Account account = sessions.get("AccountUser");
		editProfileUser.setFullname(account.getFullname());
		editProfileUser.setMail(account.getEmail());
		editProfileUser.setPhones(account.getPhoto());
		return "redirect:/botxxii/myaccount";
	}

	@GetMapping("botxxii/addresses")
	public String Load3(Model m) {
		m.addAttribute("active2", "active");
		m.addAttribute("viewAside", "/WEB-INF/views/utilities/users/MngForUser.jsp");
		m.addAttribute("viewsFroMngUser", "/WEB-INF/views/subpage/user/addresses.jsp");
		return "/views/index";
	}
}
