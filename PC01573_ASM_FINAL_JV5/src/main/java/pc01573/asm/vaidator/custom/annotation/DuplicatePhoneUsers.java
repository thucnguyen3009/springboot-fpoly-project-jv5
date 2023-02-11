package pc01573.asm.vaidator.custom.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;
import pc01573.asm.vaidator.custom.DuplicatePhoneUsersValidator;

@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DuplicatePhoneUsersValidator.class)
public @interface DuplicatePhoneUsers {
	String message() default "{pc01573.asm.vaidator.custom.annotation.DuplicatePhoneUsers.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
