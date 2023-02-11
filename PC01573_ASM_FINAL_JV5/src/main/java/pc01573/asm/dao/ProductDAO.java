package pc01573.asm.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import pc01573.asm.entity.Category;
import pc01573.asm.entity.Product;
public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	List<Product> findAllByAvailableTrue();
	
	Optional<Product> findById(String username);
	
	List<Product> findByCategory(Category category);
	
	Optional<Product> findByImage(String image);
}
