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
@Table(name = "Accounts")
public class Account implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String username;
	
	private String password;
	
	private String fullname;
	
	private String email;
	
	private String photo;
	
	private boolean activated;
	
	private boolean admin;
	
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}