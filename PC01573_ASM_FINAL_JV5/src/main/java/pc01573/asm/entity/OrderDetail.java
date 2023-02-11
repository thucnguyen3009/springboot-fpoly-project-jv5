package pc01573.asm.entity;

import java.io.Serializable;
import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Orderdetails")
public class OrderDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private Double price;

	private Integer quantity;

	@ManyToOne
	@JoinColumn(name = "Productid")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "Orderid")
	private Order order;
}
