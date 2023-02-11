package pc01573.asm.vaidator.custom;

import java.util.Optional;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import pc01573.asm.dao.AccountDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.vaidator.custom.annotation.CheckGmailUsers;

public class CheckGmailUsersValidator implements ConstraintValidator<CheckGmailUsers, String> {

	@Autowired
	AccountDAO dao;

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean check = true;
		Optional<Account> list = dao.findByEmail(value);
		if (list.isPresent()) {
			if (!list.get().getEmail().trim().equals(value.trim())) {
				check = false;
			}
		}
		return check;
	}
}
