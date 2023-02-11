package pc01573.asm.vaidator.custom;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import pc01573.asm.entity.Account;
import pc01573.asm.service.SessionService;
import pc01573.asm.vaidator.custom.annotation.CheckPassDatabase;

public class CheckPassDatabaseValidator implements ConstraintValidator<CheckPassDatabase, String> {

	@Autowired
	SessionService sessionService;

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean check = true;
		Account list = sessionService.get("AccountUser");
		if (list != null && !value.isEmpty()) {
			if (!list.getPassword().equals(value)) {
				check = false;
			}
		}
		return check;
	}
}
