package pc01573.asm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import pc01573.asm.interceptor.AutoLogin;
import pc01573.asm.interceptor.EditProfile;
import pc01573.asm.interceptor.PreventLogin;
import pc01573.asm.interceptor.RemoveOTP;
import pc01573.asm.interceptor.SignOut;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	PreventLogin preventLogin;

	@Autowired
	AutoLogin autoLogin;

	@Autowired
	RemoveOTP removeOTP;

	@Autowired
	EditProfile editProfile;
	
	@Autowired
	SignOut signOut;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(preventLogin).addPathPatterns("/botxxii/**", "/subpage/**").excludePathPatterns(
				"/admin/assets/**", "/admin/css/**", "/admin/js/**", "/css/**", "/js/**", "/lib/**", "/images/**");

		registry.addInterceptor(autoLogin).addPathPatterns("/botxxii/**", "/subpage/**").excludePathPatterns(
				"/admin/assets/**", "/admin/css/**", "/admin/js/**", "/css/**", "/js/**", "/lib/**", "/images/**");

		registry.addInterceptor(removeOTP).addPathPatterns("/botxxii/**", "/subpage/**").excludePathPatterns(
				"/admin/assets/**", "/admin/css/**", "/admin/js/**", "/css/**", "/js/**", "/lib/**", "/images/**");

		registry.addInterceptor(editProfile).addPathPatterns("/botxxii/myaccount", "/botxxii/profilechangepass",
				"/botxxii/addresses");
		
		registry.addInterceptor(signOut).addPathPatterns("/botxxii/**").excludePathPatterns(
				"/admin/assets/**", "/admin/css/**", "/admin/js/**", "/css/**", "/js/**", "/lib/**", "/images/**", "/subpage/**");
	}

}
