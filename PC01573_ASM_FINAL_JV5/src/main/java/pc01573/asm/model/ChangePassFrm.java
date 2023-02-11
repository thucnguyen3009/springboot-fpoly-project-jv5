package pc01573.asm.model;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pc01573.asm.vaidator.custom.annotation.ConfirmPasswords;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ConfirmPasswords(first = "pwdCfm", second = "pwd")
public class ChangePassFrm {

	@NotBlank
	private String pwd;

	@NotBlank
	private String pwdCfm;
}
