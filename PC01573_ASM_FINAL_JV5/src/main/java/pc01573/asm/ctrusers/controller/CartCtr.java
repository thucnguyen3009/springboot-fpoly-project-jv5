package pc01573.asm.ctrusers.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pc01573.asm.dao.CategoryDAO;
import pc01573.asm.dao.OrderDAO;
import pc01573.asm.dao.OrderDetailDAO;
import pc01573.asm.dao.ProductDAO;
import pc01573.asm.entity.Account;
import pc01573.asm.entity.Category;
import pc01573.asm.entity.Order;
import pc01573.asm.entity.OrderDetail;
import pc01573.asm.model.Item;
import pc01573.asm.service.CartService;
import pc01573.asm.service.SessionService;

@Controller
public class CartCtr {
	@Autowired
	CartService cart;

	@Autowired
	HttpServletRequest req;

	@Autowired
	SessionService sessionService;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	OrderDetailDAO orderDetailDAO;

	@RequestMapping("botxxii/cart")
	public String Load1(Model m) {
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/cart/cart.jsp");
		if (cart.getCount() == 0) {
			sessionService.set("message", "Giỏ hàng trống.");
		} else {
			sessionService.set("message", null);
		}
		m.addAttribute("carts", cart);
		return "/views/index";
	}

	@ModelAttribute("listCategory")
	public List<Category> getCategory() {
		return categoryDAO.findAll();
	}

	@RequestMapping("botxxii/cart/add/{id}")
	public String AddCart(Model m, @PathVariable("id") Integer id, @RequestParam("quantity") String qty) {
		cart.add(id, Integer.valueOf(qty));
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/cart/cart.jsp");
		return "redirect:/botxxii/cart";
	}

	@RequestMapping("botxxii/cart/remove/{id}")
	public String RemoveCart(Model m, @PathVariable("id") Integer id) {
		cart.remove(id);
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/cart/cart.jsp");
		return "redirect:/botxxii/cart";
	}

	@RequestMapping("botxxii/cart/update/{id}")
	public String UpdateSlCart(Model m, @PathVariable("id") Integer id, @RequestParam("quantity") String qty) {
		if (qty.equals("")) {
			qty = "1";
		}
		cart.update(id, Integer.valueOf(qty));
		sessionService.set("vldc", req.getParameter("dc"));
		if (req.getParameter("dc")!=null) {
			sessionService.set("vluDc", "");
		}
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/cart/cart.jsp");
		return "redirect:/botxxii/cart";
	}

	@RequestMapping("botxxii/cart/pay")
	public String pay(Model m) {
		Account account = sessionService.get("AccountUser");
		sessionService.set("message", null);
		sessionService.set("vldc", req.getParameter("dc"));
		if (cart.getCount() == 0) {
			sessionService.set("message", "Giỏ hàng trống.");
			sessionService.set("vluDc", null);
			return "redirect:/botxxii/cart";
		}
		if (account == null) {
			return "redirect:/botxxii/login";
		}
		if (req.getParameter("dc") == "" || req.getParameter("dc") == null) {
			sessionService.set("vluDc", "*Vui lòng nhập địa chỉ nhận hàng.");
			return "redirect:/botxxii/cart";
		} else {
			sessionService.set("vluDc", null);
		}
		Order order = new Order();
		order.setAddress(req.getParameter("dc"));
		order.setStatus(false);
		order.setAccount(account);
		orderDAO.save(order);
		for (Item items : cart.getItems()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setPrice(items.getPrice());
			orderDetail.setQuantity(items.getAmount());
			orderDetail.setOrder(orderDAO.findById(order.getId()).get());
			orderDetail.setProduct(productDAO.findById(items.getId()).get());
			orderDetailDAO.save(orderDetail);
		}
		cart.clear();
		return "redirect:/botxxii/index";
	}
}
