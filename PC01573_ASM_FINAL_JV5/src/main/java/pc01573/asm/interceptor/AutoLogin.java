package pc01573.asm.interceptor;

import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import pc01573.asm.dao.AccountDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.service.CartService;
import pc01573.asm.service.CookieService;
import pc01573.asm.service.SessionService;

@Service
public class AutoLogin implements HandlerInterceptor {
	@Autowired
	CartService cart;
	
	
	@Autowired
	SessionService session;

	@Autowired
	CookieService cookieService;

	@Autowired
	AccountDAO accountDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = cookieService.getValueCookie("UserID");
		request.setAttribute("sl", cart.getCount());	
		if (session.get("AccountUser") == null) {
			System.out.println("AutoLogin --> Kiểm tra session login: Đang trống...");
			if (!id.equals("")) {
				System.out.println("AutoLogin --> Kiểm tra cookie: Có cookies...");
				Optional<Account> account = accountDAO.findById(id);
				if (account.isPresent()) {
					System.out.println("AutoLogin --> Đăng nhập lại...");
					session.set("AccountUser", account.get());
					if(request.getRequestURI().equals("/botxxii/login")) {
						response.sendRedirect("/botxxii/index");
					}
				} else {
					System.out.println("AutoLogin --> Tài khoản không tồn tại...");
				}
			} else {
				System.out.println("AutoLogin --> Kiểm tra cookie: Không có cookies...");
			}
		} else {
			System.out.println("AutoLogin --> Kiểm tra session login: Đang tồn tại...");
		}
		return true;
	}
}
