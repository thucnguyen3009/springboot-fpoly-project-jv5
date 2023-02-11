package pc01573.asm.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class MessageConfig {

	@Bean("messageSource")
	public MessageSource getMessageResource() {
		ReloadableResourceBundleMessageSource ms = new ReloadableResourceBundleMessageSource();
		ms.setBasenames("classpath:messageerror/login", "classpath:messageerror/singup",
				"classpath:messageerror/send-gmail-otp", "classpath:messageerror/send-otp",
				"classpath:messageerror/change-pass-otp", "classpath:messageerror/edit-profile-user",
				"classpath:messageerror/change-pass-profile", "classpath:messageerror/account-model",
				"classpath:messageerror/product-model");
		ms.setDefaultEncoding("utf-8");
		return ms;

	}
}
