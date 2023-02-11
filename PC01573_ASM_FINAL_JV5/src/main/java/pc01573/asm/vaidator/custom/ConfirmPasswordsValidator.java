package pc01573.asm.vaidator.custom;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.apache.commons.beanutils.BeanUtils;
import pc01573.asm.vaidator.custom.annotation.ConfirmPasswords;

public class ConfirmPasswordsValidator implements ConstraintValidator<ConfirmPasswords, Object> {

	private String firstFieldName;
	private String secondFieldName;
	private String message;

	@Override
	public void initialize(final ConfirmPasswords constraintAnnotation) {
		firstFieldName = constraintAnnotation.first();
		secondFieldName = constraintAnnotation.second();
		setMessage(constraintAnnotation.message());
	}

	@Override
	public boolean isValid(final Object value, ConstraintValidatorContext context) {
		boolean valid = true;
		try {
			final Object firstObj = BeanUtils.getProperty(value, firstFieldName);
			final Object secondObj = BeanUtils.getProperty(value, secondFieldName);

			valid = firstObj == null && secondObj == null || firstObj != null && firstObj.equals(secondObj);
		} catch (final Exception ignore) {
		}

		if (!valid) {
			context.buildConstraintViolationWithTemplate(message).addPropertyNode(firstFieldName)
					.addConstraintViolation().disableDefaultConstraintViolation();
		}
	
		return valid;
	}

	public String getFirstFieldName() {
		return firstFieldName;
	}

	public void setFirstFieldName(String firstFieldName) {
		this.firstFieldName = firstFieldName;
	}

	public String getSecondFieldName() {
		return secondFieldName;
	}

	public void setSecondFieldName(String secondFieldName) {
		this.secondFieldName = secondFieldName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
