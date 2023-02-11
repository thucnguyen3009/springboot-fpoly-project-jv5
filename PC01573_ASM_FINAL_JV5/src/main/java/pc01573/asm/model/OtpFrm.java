package pc01573.asm.model;

import javax.validation.constraints.NotEmpty;

import org.springframework.beans.factory.annotation.Autowired;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pc01573.asm.service.SessionService;
import pc01573.asm.vaidator.custom.annotation.CheckOtp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OtpFrm {
	
	@Autowired
	SessionService service;
	
	@NotEmpty
	@CheckOtp
	private String otp;
}
