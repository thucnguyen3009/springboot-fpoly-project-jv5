package pc01573.asm.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pc01573.asm.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {

	@Query("SELECT o FROM Account o WHERE o.username=:username")
	Optional<Account> findByUsernames(String username);

	Optional<Account> findByPhoto(String photo);

	Optional<Account> findByEmail(String email);
	
	Page<Account> findAll(Pageable pageable);
}
