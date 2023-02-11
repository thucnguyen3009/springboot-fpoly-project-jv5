package pc01573.asm.ctrusers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pc01573.asm.dao.ProductDAO;
@Controller
public class ProductDetailsCtr {
	
	@Autowired
	ProductDAO productDAO;
	
	
	@GetMapping("botxxii/details/{id}")
	public String LoadDerailsPro(Model m, @PathVariable("id") Integer id) {
		m.addAttribute("listDetailsPro", productDAO.findById(id).get());
		m.addAttribute("viewAside", "/WEB-INF/views/subpage/product/details.jsp");
		return "/views/index";
	}
}
