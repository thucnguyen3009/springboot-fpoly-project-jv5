package pc01573.asm.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String name;

	private String icon;

	public Category(String id, String name, String icon) {
		this.id = id;

		this.name = name;

		this.icon = icon;
	}

	@OneToMany(mappedBy = "category")
	List<Product> product;

}