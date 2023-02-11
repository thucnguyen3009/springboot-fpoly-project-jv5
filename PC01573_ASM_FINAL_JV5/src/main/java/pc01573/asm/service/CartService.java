package pc01573.asm.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
import pc01573.asm.dao.ProductDAO;
import pc01573.asm.entity.Product;
import pc01573.asm.model.Item;

@Service
@SessionScope
public class CartService implements ItemService {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	SessionService sessionService;

	Map<Integer, Item> gioHang = new HashMap<>();

	Item items = new Item();

	@Override
	public Item add(Integer id, Integer qty) {
		items = new Item();
		items = this.ItemsMap(id);
		if (gioHang.containsKey(id)) {
			this.update(id, gioHang.get(id).getAmount() + qty);
		} else {
			items.setAmount(1);
		}
		return gioHang.put(items.getId(), items);
	}

	@Override
	public void remove(Integer id) {
		gioHang.remove(id);
	}

	@Override
	public Item update(Integer id, int qty) {
		items = new Item();
		items = this.ItemsMap(id);
		items.setAmount(qty);
		return gioHang.put(items.getId(), items);
	}

	@Override
	public void clear() {
		gioHang.clear();
	}

	@Override
	public Collection<Item> getItems() {
		return gioHang.values();
	}

	@Override
	public int getCount() {
		return gioHang.size();
	}

	@Override
	public double getAmount() {
		return gioHang.values().stream().mapToDouble(item -> item.getAmount() * item.getPrice() + 30000).sum();
	}

	@Override
	public Item ItemsMap(Integer id) {
		Product products = productDAO.findById(id).get();
		items = new Item();
		items.setId(products.getId());
		items.setName(products.getName());
		items.setPrice(products.getPrice());
		items.setImage(products.getImage());
		return items;
	}

}
