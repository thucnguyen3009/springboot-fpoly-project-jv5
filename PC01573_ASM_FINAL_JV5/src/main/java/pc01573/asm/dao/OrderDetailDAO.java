package pc01573.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pc01573.asm.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
}
