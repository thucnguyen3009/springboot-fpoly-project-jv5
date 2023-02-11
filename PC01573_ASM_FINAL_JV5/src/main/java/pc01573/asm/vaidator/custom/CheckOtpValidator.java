package pc01573.asm.vaidator.custom;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pc01573.asm.service.SessionService;
import pc01573.asm.vaidator.custom.annotation.CheckOtp;

@Service
public class CheckOtpValidator implements ConstraintValidator<CheckOtp, String> {

	@Autowired
	SessionService sessionService;

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean check = true;
		String otp = sessionService.get("OTP_YWRtaW4").toString();
		if (otp != null) {
			if (!otp.equals(value.trim())) {
				check = false;
			}
		}
		return check;
	}
}
