package pc01573.asm.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pc01573.asm.vaidator.custom.annotation.DuplicateGmailUsers;
import pc01573.asm.vaidator.custom.annotation.DuplicatePhoneUsers;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditProfileUser {
	
	@NotBlank
	private String fullname;
	
	@NotBlank
	@Email
	@DuplicateGmailUsers
	private String mail;
	
	@Pattern(regexp = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$")
	@DuplicatePhoneUsers
	private String phones;
}
