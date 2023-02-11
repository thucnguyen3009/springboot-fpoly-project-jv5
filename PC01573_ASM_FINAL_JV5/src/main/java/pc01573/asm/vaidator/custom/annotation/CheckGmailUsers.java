package pc01573.asm.vaidator.custom.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;
import pc01573.asm.vaidator.custom.CheckGmailUsersValidator;

@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CheckGmailUsersValidator.class)
public @interface CheckGmailUsers {
	String message() default "{pc01573.asm.vaidator.custom.annotation.CheckGmailUsers.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
