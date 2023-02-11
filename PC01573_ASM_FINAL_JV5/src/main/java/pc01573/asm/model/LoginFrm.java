package pc01573.asm.model;

import javax.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginFrm {

	@NotBlank
	private String us = null;
	
	@NotBlank
	private String pass = null;
	
	private Boolean rmb = false;
}
