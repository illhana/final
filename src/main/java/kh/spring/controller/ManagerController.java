package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ProductDTO;
import kh.spring.service.ProductService;


@Controller
@RequestMapping("/manager/")
public class ManagerController {
   
   @Autowired
   private ProductService pserv;
   
   @RequestMapping("main")
   public String manager() {
      return "/manager/main";
   }
   @RequestMapping("insertForm")
   public String insertForm() {
      return "/manager/insertForm";
   }
   
   @RequestMapping("getProductListFM")
   public String getProductListFM(Model model) {
      
      List<ProductDTO> productList=pserv.getProductListFM();
      
      model.addAttribute("productList",productList);
      
      return "/manager/productList";
      
   }
}