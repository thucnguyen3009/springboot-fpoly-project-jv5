package pc01573.lab5.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
 	private String id;
	
	private String name;
	
	@OneToMany(mappedBy = "category")
	List<Product> products;
}