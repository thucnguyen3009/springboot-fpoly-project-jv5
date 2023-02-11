package pc01573.asm.ctradmin.controller;

import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pc01573.asm.dao.AccountDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.model.AccountModel;
import pc01573.asm.service.SessionService;

@Controller
public class UserMngCtr {
	@Autowired
	AccountDAO accountDAO;

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse reps;

	@Autowired
	SessionService sessionService;

	@GetMapping("botxxii/admin")
	public String Load1(Model m) {
		sessionService.remove("message");
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/admin.jsp");
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/acount")
	public String Load2(Model m, @ModelAttribute("accountModel") AccountModel accountModel,
			@RequestParam("xuannhi") Optional<String> p) {
		Pageable pageable = PageRequest.of(0, 5);
		Page<Account> page = accountDAO.findAll(pageable);
		Integer paged = 0;
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/acount?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/acount?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = accountDAO.findAll(pageable);
		sessionService.set("urlEdit", true);
		sessionService.remove("userEdit");
		m.addAttribute("listAcc", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/account.jsp");
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/acount/page")
	public String Load3(Model m, @ModelAttribute("accountModel") AccountModel accountModel,
			@RequestParam("xuannhi") Optional<String> p, @RequestParam("user") Optional<String> user) {
		sessionService.remove("message");
		if (user.isPresent()) {
			Optional<Account> list = accountDAO.findByUsernames(user.get());
			if (!list.isEmpty()) {
				accountModel = new AccountModel();
				accountModel.setUsername(list.get().getUsername());
				accountModel.setFullname(list.get().getFullname());
				accountModel.setPassword(list.get().getPassword());
				accountModel.setCfm(list.get().getPassword());
				accountModel.setPhone(list.get().getPhoto());
				accountModel.setActivated(list.get().isActivated());
				accountModel.setAdmin(list.get().isAdmin());
				accountModel.setEmail(list.get().getEmail());
				m.addAttribute("accountModel", accountModel);
			} else {
				sessionService.remove("userEdit");
				sessionService.remove("acc");
			}
		}

		Pageable pageable = PageRequest.of(Integer.valueOf(p.orElse("0")), 5);
		Page<Account> page = accountDAO.findAll(pageable);
		m.addAttribute("listAcc", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/account.jsp");
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/acount/edit/{username}")
	public String DoEditUser(Model m, @PathVariable("username") String username,
			@RequestParam("xuannhi") Optional<String> p, @ModelAttribute("accountModel") AccountModel accountModel) {
		sessionService.remove("message");
		Pageable pageable = PageRequest.of(0, 5);
		Page<Account> page = accountDAO.findAll(pageable);
		Integer paged = 0;
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/acount/edit/" + username + "?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/acount/edit/" + username + "?xuannhi=0";
			}
		}
		Optional<Account> list = accountDAO.findById(username);
		if (list.isPresent()) {
			accountModel.setUsername(list.get().getUsername());
			accountModel.setFullname(list.get().getFullname());
			accountModel.setPassword(list.get().getPassword());
			accountModel.setCfm(list.get().getPassword());
			accountModel.setPhone(list.get().getPhoto());
			accountModel.setActivated(list.get().isActivated());
			accountModel.setAdmin(list.get().isAdmin());
			accountModel.setEmail(list.get().getEmail());
			sessionService.set("userEdit", username);
			sessionService.set("acc", accountDAO.findById(username).get());
			sessionService.set("urlEdit", false);
		} else {
			sessionService.remove("userEdit");
			sessionService.remove("acc");
			sessionService.set("urlEdit", true);
			return "redirect:/botxxii/admin/acount?xuannhi=" + String.valueOf(p.get());
		}
		pageable = PageRequest.of(paged, 5);
		page = accountDAO.findAll(pageable);
		m.addAttribute("listAcc", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/account.jsp");
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/acount/reset")
	public String DoResetUser(Model m, @ModelAttribute("accountModel") AccountModel accountModel,
			@RequestParam("xuannhi") Optional<String> p) {
		sessionService.remove("message");
		String paged = p.get();
		Boolean check = NumberUtils.isParsable(paged);
		if (check == false) {
			paged = "0";
			return "redirect:/botxxii/admin/acount?xuannhi=0";
		}
		accountModel = new AccountModel();
		accountModel.setUsername(null);
		sessionService.set("urlEdit", true);
		sessionService.remove("userEdit");
		return "redirect:/botxxii/admin/acount?xuannhi=" + paged;
	}

	@RequestMapping("botxxii/admin/acount/cancel")
	public String DoCancelUser(Model m, @ModelAttribute("accountModel") AccountModel accountModel,
			@RequestParam("xuannhi") Optional<Integer> p) {
		sessionService.remove("message");
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/account.jsp");
		Account account = sessionService.get("acc");
		String user = null;
		if (account != null) {
			user = account.getUsername();
		}
		return "redirect:/botxxii/admin/acount/edit/" + user + "?xuannhi=" + String.valueOf(p.orElse(0));
	}

	@RequestMapping("botxxii/admin/acount/update/{id}")
	public String DoUpdateUser(Model m, @PathVariable("id") String username,
			@RequestParam("xuannhi") Optional<String> p,
			@Valid @ModelAttribute("accountModel") AccountModel accountModel, BindingResult rs) {
		sessionService.remove("message");
		accountModel.setUsername(username);
		Pageable pageable = PageRequest.of(0, 5);
		Page<Account> page = accountDAO.findAll(pageable);
		Integer paged = Integer.valueOf(p.get());
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/acount/edit/" + username + "?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/acount/edit/" + username + "?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = accountDAO.findAll(pageable);
		m.addAttribute("listAcc", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/account.jsp");
		Optional<Account> list = accountDAO.findByUsernames(username);
		Account isLogin = sessionService.get("AccountUser");
		Account acc = sessionService.get("acc");
		if (list.isPresent() && acc != null) {
			if (req.getMethod().equalsIgnoreCase("post")) {

				Boolean errFullName = rs.hasFieldErrors("fullname");

				Boolean errEmail = rs.hasFieldErrors("email");
				sessionService.set("errEmail", true);

				Boolean errPhone = rs.hasFieldErrors("phone");
				sessionService.set("errPhone", true);

				Boolean errPwd = rs.hasFieldErrors("password");

				Boolean errCfm = rs.hasFieldErrors("cfm");

				if (rs.getFieldValue("email").equals(acc.getEmail())) {
					errEmail = false;
					sessionService.set("errEmail", errEmail);
				}

				if (rs.getFieldValue("phone").equals(acc.getPhoto())) {
					errPhone = false;
					sessionService.set("errPhone", errPhone);
				}
				if (errFullName == false && errCfm == false && errPwd == false && errEmail == false
						&& errPhone == false) {
					acc.setFullname(accountModel.getFullname());
					acc.setPassword(accountModel.getPassword());
					acc.setEmail(accountModel.getEmail());
					acc.setPhoto(accountModel.getPhone());
					if (!list.get().getUsername().equals(isLogin.getUsername())) {
						int errActivated = 0;
						if (String.valueOf(accountModel.isActivated()).equals("true")) {
							errActivated++;
						} else if (String.valueOf(accountModel.isActivated()).equals("false")) {
							errActivated++;
						}
						if (errActivated == 0) {
							acc.setActivated(accountModel.isActivated());
						}
						int errAdmin = 0;
						if (String.valueOf(accountModel.isAdmin()).equals("true")) {
							errAdmin++;
						} else if (String.valueOf(accountModel.isAdmin()).equals("false")) {
							errAdmin++;
						}
						if (errAdmin == 0) {
							acc.setAdmin(accountModel.isAdmin());
						}
					}
					accountDAO.save(acc);
					sessionService.set("message", "Cập nhật thông tin người dùng " + username + " thành công!!!");
					return "redirect:/botxxii/admin/acount?xuannhi=" + String.valueOf(paged);
				}
			} else {
				accountModel.setUsername(list.get().getUsername());
				accountModel.setFullname(list.get().getFullname());
				accountModel.setEmail(list.get().getEmail());
				accountModel.setPassword(list.get().getPassword());
				accountModel.setCfm(list.get().getPassword());
				accountModel.setPhone(list.get().getPhoto());
				accountModel.setActivated(list.get().isActivated());
				accountModel.setAdmin(list.get().isAdmin());
				return "redirect:/botxxii/admin/acount/edit/" + list.get().getUsername() + "?xuannhi="
						+ String.valueOf(p.get());
			}

		} else {
			sessionService.remove("userEdit");
			sessionService.remove("acc");
			sessionService.set("urlEdit", true);
			return "redirect:/botxxii/admin/acount?xuannhi=" + String.valueOf(p.get());
		}
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/acount/create")
	public String DoAddUser(Model m, @RequestParam("xuannhi") Optional<String> p,
			@Valid @ModelAttribute("accountModel") AccountModel accountModel, BindingResult rs) {
		sessionService.remove("message");
		Pageable pageable = PageRequest.of(0, 5);
		Page<Account> page = accountDAO.findAll(pageable);
		Integer paged = Integer.valueOf(p.get());
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/acount/create?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/acount/create?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = accountDAO.findAll(pageable);
		m.addAttribute("listAcc", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/account.jsp");
		if (req.getMethod().equalsIgnoreCase("post")) {
			Account account = new Account();
			if (!rs.hasErrors()) {
				account.setUsername(accountModel.getUsername());
				account.setPassword(accountModel.getPassword());
				account.setFullname(accountModel.getFullname());
				account.setEmail(accountModel.getEmail());
				account.setPhoto(accountModel.getPhone());
				int errActivated = 0;
				if (String.valueOf(accountModel.isActivated()).equals("true")) {
					errActivated++;
				} else if (String.valueOf(accountModel.isActivated()).equals("false")) {
					errActivated++;
				} else if (errActivated == 0) {
					account.setActivated(false);
				} else {
					account.setActivated(accountModel.isActivated());
				}
				int errAdmin = 0;
				if (String.valueOf(accountModel.isAdmin()).equals("true")) {
					errAdmin++;
				} else if (!String.valueOf(accountModel.isAdmin()).equals("false")) {
					errAdmin++;
				}
				if (errAdmin == 0) {
					account.setAdmin(false);
				} else {
					account.setAdmin(accountModel.isAdmin());
				}
				sessionService.set("message", "Thêm thành công tài khoản " + accountModel.getUsername() + ".");
				accountDAO.save(account);
				return "redirect:/botxxii/admin/acount?xuannhi=" + paged.toString();
			}
		}
		return "/views/detach/admin/index";
	}

}
