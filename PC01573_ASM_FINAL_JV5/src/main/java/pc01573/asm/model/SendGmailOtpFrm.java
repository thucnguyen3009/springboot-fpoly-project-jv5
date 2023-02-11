package pc01573.asm.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.*;
import pc01573.asm.vaidator.custom.annotation.CheckGmailUsers;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SendGmailOtpFrm {

	@NotEmpty
	@Email
	@CheckGmailUsers
	private String email;
}
