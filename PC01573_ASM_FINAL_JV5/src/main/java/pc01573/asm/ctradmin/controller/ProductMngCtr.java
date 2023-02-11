package pc01573.asm.ctradmin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.tomcat.util.http.fileupload.impl.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pc01573.asm.dao.CategoryDAO;
import pc01573.asm.dao.ProductDAO;
import pc01573.asm.entity.Category;
import pc01573.asm.entity.Product;
import pc01573.asm.model.CategoryModel;
import pc01573.asm.model.ProductModol;
import pc01573.asm.service.SessionService;

@Controller
public class ProductMngCtr {
	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ServletContext context;

	@Autowired
	HttpServletRequest req;

	@Autowired
	SessionService sessionService;

	@RequestMapping("botxxii/admin/product")
	public String Load2(Model m, @ModelAttribute("productModol") ProductModol productModol,
			@RequestParam("xuannhi") Optional<String> p) {
		sessionService.set("urlUpload", "redirect:/botxxii/admin/product?xuannhi=" + p.orElse("0"));
		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = productDAO.findAll(pageable);
		Integer paged = 0;
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/product?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/product?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = productDAO.findAll(pageable);
		sessionService.set("urlEditPro", true);
		sessionService.remove("proEdit");
		m.addAttribute("listPro", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/product/loadimage")
	public String LoadAnh(Model m, @ModelAttribute("productModol") ProductModol productModol,
			@RequestParam("xuannhi") Optional<String> p, @RequestParam("upload") Optional<MultipartFile> attach) {
		sessionService.set("productModel2", productModol);
		try {
			if (attach.isPresent()) {
				MultipartFile hinhanh = attach.get();
				String pathUpload = context.getRealPath("/images/product");
				File dirs = new File(pathUpload);
				if (!dirs.exists())
					dirs.mkdirs();
				String namefileOrgin = hinhanh.getOriginalFilename();
				int index = namefileOrgin.lastIndexOf(".");
				String rename = namefileOrgin.substring(0, index - 1) + "_" + (new Date()).getTime() + "_"
						+ (long) Math.floor(Math.random() * (1000 - 100 + 1) + 100) + "."
						+ namefileOrgin.substring(index + 1);
				File upload = new File(pathUpload + "/" + rename);
				sessionService.set("imagesPro", rename);
				hinhanh.transferTo(upload);
				sessionService.set("imagesPro", rename);
			}
		} catch (FileSizeLimitExceededException e) {

		} catch (IllegalStateException | IOException e) {

		}
		if (sessionService.get("urlUpload") == null) {
			sessionService.set("urlUpload", "redirect:/botxxii/admin/product?xuannhi=0");
		}
		return sessionService.get("urlUpload");

	}

	@RequestMapping("botxxii/admin/product/page")
	public String Load3(Model m, @ModelAttribute("productModol") ProductModol productModol,
			@RequestParam("xuannhi") Optional<String> p, @RequestParam("idPro") Optional<String> idPro) {
		sessionService.remove("message");

		if (idPro.isPresent()) {
			Boolean check = NumberUtils.isParsable(idPro.get());
			Product list = null;
			if (check == true) {
				list = productDAO.findById(Integer.valueOf(idPro.get())).get();
			}
			if (list != null) {
				productModol = new ProductModol();
				productModol.setName(list.getName());
				productModol.setPrice(list.getPrice());
				CategoryModel category = new CategoryModel(list.getCategory().getId(), list.getCategory().getName(),
						list.getCategory().getIcon());
				productModol.setCategory(category);
				productModol.setAvailable(list.getAvailable());
				m.addAttribute("productModol", productModol);
			} else {
				sessionService.remove("proEdit");
				sessionService.remove("pro");
			}
		}
		Pageable pageable = PageRequest.of(Integer.valueOf(p.orElse("0")), 5);
		Page<Product> page = productDAO.findAll(pageable);
		m.addAttribute("listPro", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/product/edit/{id}")
	public String DoEditUser(Model m, @PathVariable("id") String username, @RequestParam("xuannhi") Optional<String> p,
			@ModelAttribute("productModol") ProductModol productModol) {
		sessionService.remove("message");
		sessionService.set("urlUpload", "redirect:/botxxii/admin/product/update/" + username + "?xuannhi=" + p.get());
		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = productDAO.findAll(pageable);
		Integer paged = 0;
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/product/edit/" + username + "?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/product/edit/" + username + "?xuannhi=0";
			}
		}

		Boolean check = NumberUtils.isParsable(username);
		Product list = null;
		if (check == true) {
			list = productDAO.findById(Integer.valueOf(username)).get();
		}

		if (list != null) {
			productModol.setName(list.getName());
			productModol.setPrice(list.getPrice());

			CategoryModel category = new CategoryModel(list.getCategory().getId(), list.getCategory().getName(),
					list.getCategory().getIcon());

			productModol.setCategory(category);

			productModol.setAvailable(list.getAvailable());

			sessionService.set("imagesPro", list.getImage());

			sessionService.set("proEdit", username);
			sessionService.set("pro", list);
			sessionService.set("urlEditPro", false);
		} else {
			sessionService.remove("userEdit");
			sessionService.remove("pro");
			sessionService.set("urlEditPro", true);
			return "redirect:/botxxii/admin/product?xuannhi=" + String.valueOf(p.get());
		}
		pageable = PageRequest.of(paged, 5);
		page = productDAO.findAll(pageable);
		m.addAttribute("listPro", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		return "/views/detach/admin/index";
	}

	@GetMapping("botxxii/admin/product/create")
	public String DoGetAddPro(Model m, @RequestParam("xuannhi") Optional<String> p,
			@ModelAttribute("productModol") ProductModol productModol) {

		sessionService.remove("message");
		sessionService.set("urlUpload", "redirect:/botxxii/admin/product/create?xuannhi=" + p.get());
		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = productDAO.findAll(pageable);
		Integer paged = Integer.valueOf(p.get());
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/product/create?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/product/create?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = productDAO.findAll(pageable);
		m.addAttribute("listPro", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		if (!req.getMethod().equalsIgnoreCase("post")) {
			ProductModol pro = sessionService.get("productModel2");
			if (pro != null) {
				m.addAttribute("productModol", pro);
			}
		}
		return "/views/detach/admin/index";
	}

	@PostMapping("botxxii/admin/product/create")
	public String DoAddPro(Model m, @RequestParam("xuannhi") Optional<String> p,
			@Valid @ModelAttribute("productModol") ProductModol productModol, BindingResult rs) {
		sessionService.remove("message");
		sessionService.set("urlUpload", "redirect:/botxxii/admin/product/create?xuannhi=" + p.get());

		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = productDAO.findAll(pageable);
		Integer paged = Integer.valueOf(p.get());
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/product/create?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/product/create?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = productDAO.findAll(pageable);
		m.addAttribute("listPro", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		if (req.getMethod().equalsIgnoreCase("post")) {
			Product product = new Product();
			if (!rs.hasErrors()) {
				int errActivated = 0;
				if (String.valueOf(productModol.getAvailable()).equals("true")) {
					errActivated++;
				} else if (String.valueOf(productModol.getAvailable()).equals("false")) {
					errActivated++;
				}
				Optional<Category> listCate = categoryDAO.findById(productModol.getCategory().getId());
				if (listCate.isPresent() && errActivated > 0) {
					if (sessionService.get("imagesPro") == null) {
						product.setImage(sessionService.get("imagesPro"));
					} else {
						product.setImage("undraw_personal_info_re_ur1n.svg");
					}
					product.setName(productModol.getName());
					product.setPrice(productModol.getPrice());
					product.setCategory(listCate.get());
					product.setAvailable(productModol.getAvailable());
					productDAO.save(product);
					sessionService.remove("imagesPro");
					sessionService.remove("productModel2");
					sessionService.set("message", "Thêm thành công sản phẩm" + product.getName() + ".");
					return "redirect:/botxxii/admin/product?xuannhi=" + paged.toString();
				}

			}
		}
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/product/cancel")
	public String DoCancelUser(Model m, @ModelAttribute("productModol") ProductModol productModol,
			@RequestParam("xuannhi") Optional<Integer> p) {
		sessionService.remove("message");
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		Product account = sessionService.get("pro");
		String user = null;
		if (account != null) {
			sessionService.set("imagesPro", account.getImage());
			user = account.getId().toString();
		}
		return "redirect:/botxxii/admin/product/edit/" + user + "?xuannhi=" + String.valueOf(p.orElse(0));
	}

	@ModelAttribute("categorys")
	public List<CategoryModel> getCategories() {
		List<CategoryModel> list = new ArrayList<>();
		for (Category cate : categoryDAO.findAll()) {
			CategoryModel model = new CategoryModel();
			model.setId(cate.getId());
			model.setName(cate.getName());
			model.setIcon(cate.getIcon());
			list.add(model);
		}
		return list;
	}

	@GetMapping("botxxii/admin/product/update/{id}")
	public String DoUpdateUser(Model m, @PathVariable("id") String username,
			@RequestParam("xuannhi") Optional<String> p, @ModelAttribute("productModol") ProductModol productModol) {
		ProductModol pro = sessionService.get("productModel2");
		if (pro != null) {
			m.addAttribute("productModol", pro);
		}
		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = productDAO.findAll(pageable);
		Integer paged = Integer.valueOf(p.get());
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/acount/edit/" + username + "?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/acount/edit/" + username + "?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = productDAO.findAll(pageable);
		m.addAttribute("listPro", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");

		Boolean check = NumberUtils.isParsable(username);
		Product list = null;
		if (check == true) {
			list = productDAO.findById(Integer.valueOf(username)).get();
		}

		if (list != null) {
			productModol.setName(list.getName());
			productModol.setPrice(list.getPrice());

			CategoryModel category = new CategoryModel(list.getCategory().getId(), list.getCategory().getName(),
					list.getCategory().getIcon());

			productModol.setCategory(category);

			productModol.setAvailable(list.getAvailable());

			sessionService.set("proEdit", username);
			sessionService.set("pro", list);
			sessionService.set("urlEditPro", false);
		} else {
			sessionService.remove("userEdit");
			sessionService.remove("pro");
			sessionService.set("urlEditPro", true);
			return "redirect:/botxxii/admin/product?xuannhi=" + String.valueOf(p.get());
		}
		return "/views/detach/admin/index";
	}

	@RequestMapping("botxxii/admin/product/reset")
	public String DoResetUser(Model m, @ModelAttribute("productModol") ProductModol productModol,
			@RequestParam("xuannhi") Optional<String> p) {
		sessionService.remove("message");
		String paged = p.get();
		Boolean check = NumberUtils.isParsable(paged);
		if (check == false) {
			paged = "0";
			return "redirect:/botxxii/admin/product?xuannhi=0";
		}
		productModol = new ProductModol();
		sessionService.remove("imagesPro");
		sessionService.set("urlEditPro", true);
		sessionService.remove("proEdit");
		return "redirect:/botxxii/admin/product?xuannhi=" + paged;
	}

	@RequestMapping("botxxii/admin/product/update/{id}")
	public String DoUpdateUser(Model m, @PathVariable("id") String username,
			@RequestParam("xuannhi") Optional<String> p,
			@Valid @ModelAttribute("productModol") ProductModol productModol, BindingResult rs) {
		sessionService.remove("message");
		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = productDAO.findAll(pageable);
		Integer paged = Integer.valueOf(p.get());
		if (p.isPresent()) {
			Integer total = page.getTotalPages() - 1;
			if (NumberUtils.isParsable(p.get())) {
				paged = Integer.valueOf(p.get());
			} else {
				return "redirect:/botxxii/admin/product/edit/" + username + "?xuannhi=0";
			}
			if (paged > total || paged < 0) {
				paged = 0;
				return "redirect:/botxxii/admin/product/edit/" + username + "?xuannhi=0";
			}
		}
		pageable = PageRequest.of(paged, 5);
		page = productDAO.findAll(pageable);
		m.addAttribute("listAcc", page);
		m.addAttribute("viewsAdmin", "/WEB-INF/views/detach/admin/product.jsp");
		Optional<Product> list = productDAO.findById(Integer.valueOf(username));
		Product acc = sessionService.get("pro");
		if (list.isPresent() && acc != null) {
			if (req.getMethod().equalsIgnoreCase("post")) {
				Product product = new Product();
				if (!rs.hasErrors()) {
					int errActivated = 0;
					if (String.valueOf(productModol.getAvailable()).equals("true")) {
						errActivated++;
					} else if (String.valueOf(productModol.getAvailable()).equals("false")) {
						errActivated++;
					}
					Optional<Category> listCate = categoryDAO.findById(productModol.getCategory().getId());
					if (listCate.isPresent() && errActivated > 0) {
						if (sessionService.get("imagesPro") != null) {
							product.setImage(sessionService.get("imagesPro"));
						} else {
							product.setImage("undraw_personal_info_re_ur1n.svg");
						}
						product.setId(acc.getId());
						product.setName(productModol.getName());
						product.setPrice(productModol.getPrice());
						product.setCategory(listCate.get());
						product.setAvailable(productModol.getAvailable());
						productDAO.save(product);
						sessionService.remove("imagesPro");
						sessionService.remove("productModel2");
						sessionService.set("message", "Thêm thành công sản phẩm" + product.getName() + ".");
						return "redirect:/botxxii/admin/product?xuannhi=" + paged.toString();
					}

				}

			} else {
				return "redirect:/botxxii/admin/product/edit/" + list.get().getId() + "?xuannhi="
						+ String.valueOf(p.get());
			}

		} else {
			sessionService.remove("proEdit");
			sessionService.remove("pro");
			sessionService.set("urlEditPro", true);
			return "redirect:/botxxii/admin/product?xuannhi=" + String.valueOf(p.get());
		}
		return "/views/detach/admin/index";
	}
}
