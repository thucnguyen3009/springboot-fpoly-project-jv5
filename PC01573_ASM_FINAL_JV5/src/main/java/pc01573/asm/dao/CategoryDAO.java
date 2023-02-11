package pc01573.asm.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pc01573.asm.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String> {
	
	@Query("SELECT o FROM Category o WHERE o.id=:id")
	Optional<Category> findByIds(String id);
}
