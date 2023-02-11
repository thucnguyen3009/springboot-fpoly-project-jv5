package pc01573.asm.vaidator.custom.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;
import pc01573.asm.vaidator.custom.DuplicateUsersIDValidator;

@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DuplicateUsersIDValidator.class)
public @interface DuplicateUsersID {
	String message() default "{pc01573.asm.vaidator.custom.annotation.DuplicateUsersID.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
