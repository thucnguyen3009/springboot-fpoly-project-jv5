package pc01573.asm.vaidator.custom;

import java.util.Optional;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import pc01573.asm.dao.AccountDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.vaidator.custom.annotation.DuplicatePhoneUsers;

public class DuplicatePhoneUsersValidator implements ConstraintValidator<DuplicatePhoneUsers, String> {

	@Autowired
	AccountDAO dao;

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean check = true;
		Optional<Account> list = dao.findByPhoto(value);
		if (list.isPresent()) {
			if (list.get().getPhoto().equals(value)) {
				check = false;
			}
		}
		return check;
	}
}
