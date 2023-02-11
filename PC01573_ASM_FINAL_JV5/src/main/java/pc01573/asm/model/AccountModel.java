package pc01573.asm.model;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pc01573.asm.vaidator.custom.annotation.ConfirmPasswords;
import pc01573.asm.vaidator.custom.annotation.DuplicateGmailUsers;
import pc01573.asm.vaidator.custom.annotation.DuplicatePhoneUsers;
import pc01573.asm.vaidator.custom.annotation.DuplicateUsersID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ConfirmPasswords(first = "cfm", second = "password")
public class AccountModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@NotBlank
	@DuplicateUsersID
	private String username;
	
	@NotBlank
	private String password;
	
	@NotBlank
	private String cfm;
	
	@NotBlank
	private String fullname;
	
	@NotBlank
	@Email
	@DuplicateGmailUsers
	private String email;
	
	@NotBlank
	@Pattern(regexp = "(.{0})|^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$")
	@DuplicatePhoneUsers
	private String phone;
	
	private boolean activated = true;
	
	private boolean admin = false;
}