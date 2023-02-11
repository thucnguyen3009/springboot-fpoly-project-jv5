package pc01573.asm.ctrusers.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pc01573.asm.dao.CategoryDAO;
import pc01573.asm.dao.ProductDAO;
import pc01573.asm.entity.Category;
import pc01573.asm.entity.Product;

@Controller
public class ProductCtr {
	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping("botxxii/product/{loai}")
	public String LoadProduct(Model m, @PathVariable("loai") String loai) {
//		if (loai.equals("phone")) {
//			m.addAttribute("titleProduct", "Sản Phẩm/Điện Thoại");
//		} else if (loai.equals("tablet")) {
//			m.addAttribute("titleProduct", "Sản Phẩm/Máy Tính Bảng");
//		} else if (loai.equals("laptop")) {
//			m.addAttribute("titleProduct", "Sản Phẩm/Laptop");
//		} else if (loai.equals("accessory")) {
//			m.addAttribute("titleProduct", "Sản Phẩm/Phụ Kiện");
//		} else {
//			m.addAttribute("titleProduct", "Tất cả sản phẩm");
//		}
		Category category = new Category();
		List<Product> list = new ArrayList<>();
		if (categoryDAO.findById(loai).isPresent()) {
			category = categoryDAO.findById(loai).get();
			m.addAttribute("titleProduct", "Sản Phẩm/" + categoryDAO.findById(loai).get().getName());
			list = productDAO.findByCategory(category);
		} else {
			return "redirect:/botxxii/product/ALL";
		}
		m.addAttribute("listProByCate", list);
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/product/product.jsp");
		return "/views/index";
	}

	@RequestMapping("botxxii/product/ALL")
	public String loadProAll(Model m) {
		m.addAttribute("titleProduct", "Sản Phẩm/Tất Cả");
		m.addAttribute("listProByCate", productDAO.findAll());
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/product/product.jsp");
		return "/views/index";
	}

	@ModelAttribute("listCategory")
	public List<Category> getCategory() {
		return categoryDAO.findAll();
	}
}
