package pc01573.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import pc01573.asm.entity.Account;
import pc01573.asm.service.SessionService;

@Service
public class EditProfile implements HandlerInterceptor {

	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Account account = session.get("AccountUser");
		if (account == null) {
			response.sendRedirect("/botxxii/index");
			return false;
		}
		return true;
	}
}
