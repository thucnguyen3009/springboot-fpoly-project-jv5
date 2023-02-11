package pc01573.asm.ctrusers.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pc01573.asm.dao.CategoryDAO;
import pc01573.asm.dao.ProductDAO;
import pc01573.asm.entity.Category;
import pc01573.asm.entity.Product;

@Controller
public class IndexCtr {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
    CategoryDAO categoryDAO;
	
	@RequestMapping("botxxii/index")
	public String LoadIndex(Model m) {
		m.addAttribute("viewsListGoiY","/WEB-INF/views/utilities/users/ListMulti.jsp");
		m.addAttribute("viewsPay","/WEB-INF/views/utilities/users/QcPay.jsp");
		m.addAttribute("viewsSlide","/WEB-INF/views/utilities/users/slide.jsp");
		return "/views/index";
	}

	@RequestMapping("botxxii/slide")
	public String ViewHome() {
		return "/views/utilities/users/carousel";
	}
	
	@ModelAttribute("listProductTrue")
	public List<Product> getItems() {
		return productDAO.findAllByAvailableTrue();
	}
	
	@ModelAttribute("listCategory")
	public List<Category> getCategory() {
		return categoryDAO.findAll();
	}
	
}
