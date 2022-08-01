package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ProductDTO;
import kh.spring.dto.StyleBoardDTO;
import kh.spring.dto.WishListDTO;
import kh.spring.service.ProductImageService;
import kh.spring.service.ProductService;
import kh.spring.service.StyleBoardService;

@Controller
public class HomeController {
   @Autowired
   private HttpSession session;
      
   @Autowired
   private ProductService pserv;
      
    @Autowired
   private ProductImageService iserv;
	@Autowired
	private StyleBoardService stServ;
	
	@RequestMapping("/")
	public String home(Model model) {
		// Product
	       List<ProductDTO> brandList=pserv.getCateProductList("명품");
	       List<ProductDTO> shoesList=pserv.getCateProductList("신발");
	       List<ProductDTO> clothesList=pserv.getCateProductList("의류");
	       List<ProductDTO> techList=pserv.getCateProductList("테크");
	       List<ProductDTO> legoList=pserv.getCateProductList("레고");
	       
	       List<String> brandImageList=iserv.getSysNameListImageCate("명품");
	       List<String> shoesImageList=iserv.getSysNameListImageCate("신발");
	       List<String> clothesImageList=iserv.getSysNameListImageCate("의류");
	       List<String> techImageList=iserv.getSysNameListImageCate("테크");
	       List<String> legoImageList=iserv.getSysNameListImageCate("레고");
	       
	       List<WishListDTO> wishList=new ArrayList<>();
	       try{
	          String loginId=(String)session.getAttribute("loginId"); 
	          wishList=pserv.getWishList(loginId);
	          model.addAttribute("wishList",wishList);
	       }catch(Exception e) {
	          
	       }
	       
	       model.addAttribute("brandList",brandList);
	       model.addAttribute("shoesList",shoesList);
	       model.addAttribute("clothesList",clothesList);
	       model.addAttribute("techList",techList);
	       model.addAttribute("legoList",legoList);
	       
	       model.addAttribute("brandImageList",brandImageList);
	       model.addAttribute("shoesImageList",shoesImageList);
	       model.addAttribute("clothesImageList",clothesImageList);
	       model.addAttribute("techImageList",techImageList);
	       model.addAttribute("legoImageList",legoImageList);
	       
		// Style
		List<StyleBoardDTO> styleList = stServ.selectAll();
		
		model.addAttribute("styleList", styleList);
		return "home";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("/event")
	public String event() {
		return "/event/roulette";
	}
}
