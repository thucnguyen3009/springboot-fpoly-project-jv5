package pc01573.asm.dao;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import pc01573.asm.entity.Account;
import pc01573.asm.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long> {
	Optional<Account> findByAccount(Account account);
}
