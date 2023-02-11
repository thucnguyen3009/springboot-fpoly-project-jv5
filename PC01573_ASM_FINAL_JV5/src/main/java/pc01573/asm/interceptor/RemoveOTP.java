package pc01573.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import pc01573.asm.service.SessionService;

@Service
public class RemoveOTP implements HandlerInterceptor {

	@Autowired
	SessionService serviceSession;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Integer link = 0;

		if (request.getRequestURI().equals("/subpage/changepassotp")) {
			link++;
		}
		if (request.getRequestURI().equals("/subpage/sendotp")) {
			link++;
		}
		if (request.getRequestURI().equals("/subpage/sendmailotp")) {
			link++;
		}
		if (request.getRequestURI().equals("/botxxii/resendcode")) {
			link++;
		}
		System.out.println(link);
		if (serviceSession.get("OTP_YWRtaW4") != null || serviceSession.get("GMAIL_YWRtaW4") != null) {
			if (link == 0) {
				serviceSession.remove("OTP_YWRtaW4");
				serviceSession.remove("GMAIL_YWRtaW4");
			}
		}
		return true;

	}

}
