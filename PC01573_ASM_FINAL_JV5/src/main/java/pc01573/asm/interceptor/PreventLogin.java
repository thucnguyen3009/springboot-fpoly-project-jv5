package pc01573.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import pc01573.asm.entity.Account;
import pc01573.asm.service.SessionService;

@Service
public class PreventLogin implements HandlerInterceptor {

	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Account user = session.get("AccountUser");
		if (request.getRequestURI().equals("/botxxii/login") || request.getRequestURI().equals("/botxxii/signup")) {
			if (user != null) {
				String uri = session.get("UrlSecure");
				if (uri == null || uri.equals("/botxxii/login") || uri.equals("/botxxii/signup")
						|| uri.equals("/subpage/sendmailotp") || uri.equals("/subpage/changepassotp")
						|| uri.equals("/botxxii/resendcode") || uri.equals("/subpage/sendotp")) {
					response.sendRedirect("/botxxii/index");
				} else if (uri.equals("/botxxii/cart/pay")) {
					response.sendRedirect("/botxxii/cart");
				} else {
					response.sendRedirect(uri);
				}
			}
		} else {
			request.getSession().setAttribute("UrlSecure", request.getRequestURI());
		}
		return true;
	}
}
