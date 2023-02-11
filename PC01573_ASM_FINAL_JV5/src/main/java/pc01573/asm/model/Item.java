package pc01573.asm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Item {
	private Integer id;
	
	private String name;

	private String image;

	private Double price;

	private Integer amount = 0;
}
