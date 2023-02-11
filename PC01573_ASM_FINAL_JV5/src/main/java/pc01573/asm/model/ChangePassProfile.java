package pc01573.asm.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pc01573.asm.vaidator.custom.annotation.CheckPassDatabase;
import pc01573.asm.vaidator.custom.annotation.ConfirmPasswords;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ConfirmPasswords(first = "cfmPass", second = "newPass")
public class ChangePassProfile {

	@NotBlank
	@CheckPassDatabase
	private String oldPass;

	@NotBlank
	private String newPass;

	@NotBlank
	private String cfmPass;
}
