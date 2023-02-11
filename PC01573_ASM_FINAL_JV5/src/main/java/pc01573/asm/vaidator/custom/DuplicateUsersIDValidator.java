package pc01573.asm.vaidator.custom;

import java.util.Optional;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import pc01573.asm.dao.AccountDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.vaidator.custom.annotation.DuplicateUsersID;

public class DuplicateUsersIDValidator implements ConstraintValidator<DuplicateUsersID, String> {

	@Autowired
	AccountDAO dao;

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean check = true;
		Optional<Account> list = dao.findByUsernames(value);
		if (list.isPresent()) {
			if (list.get().getUsername().equalsIgnoreCase(value)) {
				check = false;
			}
		}
		return check;
	}
}
