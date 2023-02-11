package pc01573.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import pc01573.asm.service.SessionService;

@Service
public class SignOut implements HandlerInterceptor {

	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(!request.getRequestURI().equals("/botxxii/signout")) {
			session.set("URLSingOut", request.getRequestURI());
		}
		return true;
	}
}
