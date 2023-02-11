package pc01573.asm.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModol {

	@NotBlank
	private String name;

	@NotNull
	@NumberFormat(style = Style.NUMBER)
	@Min(0)
	private Double price;

	private Boolean available = true;

	private CategoryModel category;

}