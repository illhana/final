package kh.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.OrderListDTO;
import kh.spring.dto.ProductDTO;
import kh.spring.dto.ProductImageDTO;
import kh.spring.dto.WishListDTO;
import kh.spring.service.MemberService;
import kh.spring.service.ProductImageService;
import kh.spring.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {
   
   @Autowired
   private HttpSession session;
   
   @Autowired
   private ProductService pserv;
   
   @Autowired
   private ProductImageService iserv;
   
   @Autowired
   private MemberService mserv;
   
   
   @RequestMapping("main")
   public String main() {
      return "/manager/main";
   }
   
   @RequestMapping("insertForm")
   public String insertForm() {
      return "/manager/insertForm";
   }
   
   @RequestMapping("insert")
   public String insert(ProductDTO dto, MultipartHttpServletRequest request) throws Exception {
      String realPath = session.getServletContext().getRealPath("upload");
      pserv.insert(dto, realPath, request);
      
      return "/manager/main";
   }
   
   @RequestMapping("productList")
   public String productList(Model model) {
      List<ProductDTO> productList = pserv.getProductList();
      List<String> sysNameList = iserv.getProductListImage();
      model.addAttribute("productList", productList);
      model.addAttribute("sysNameList", sysNameList);
      
      return "/manager/productList";
   }
   
   @RequestMapping("updateForm")
   public String updateForm(int seq, Model model) {
      ProductDTO dto = pserv.getProductDto(seq);
      List<ProductImageDTO> sysNameList = iserv.getProductDtoImage(seq);
      
      model.addAttribute("dto", dto);
      model.addAttribute("sysNameList", sysNameList);
      
      return "/manager/updateForm";
   }
   
   @ResponseBody
   @RequestMapping("deleteSavedImage")
   public void deleteSavedImage(int seq) {
      iserv.deleteSavedImage(seq);
   }
   
   @RequestMapping("update")
   public String update(ProductDTO dto, MultipartHttpServletRequest request) throws Exception {
      String realPath = session.getServletContext().getRealPath("upload");
      pserv.update(dto, realPath, request);
      
      return "redirect:/product/productList";
   }
   
   @RequestMapping("delete")
   public String delete(int seq) {
      pserv.delete(seq);
      
      return "redirect:/product/productList";
   }

   
   
   

 
   
   @RequestMapping("getProductList")
   public String getProductList(Model model) {
      
     String category="??????";
      List<ProductDTO> productList = pserv.getProductList();
      List<String> sysNameList = iserv.getProductListImage();
      model.addAttribute("productList", productList);
      model.addAttribute("sysNameList", sysNameList);
      model.addAttribute("category",category);
 
      
      return "/shop/shopMain";
   }
   
   @RequestMapping("getProductListCate")
   public String getProductList(Model model,String category,int cpage) throws Exception {
      
//     List<ProductDTO> productListCate=pserv.getProductListCate(category);
     int imageCnt=pserv.getImageCntByCate(category);
     List<String> sysNameListCate=iserv.getSysNameTwelveImageCate(category,cpage,imageCnt);
     
     
     
     String loginId=(String)session.getAttribute("loginId"); 
    
     List<WishListDTO> wishList=pserv.getWishList(loginId);
     
     List<ProductDTO> productListCate=pserv.selectByPage(cpage, category);
    
    
     int totalData=pserv.getRecordTotalCount(category);
     
     String pageNavi=pserv.getPageNavi(cpage, totalData,category);
     
     model.addAttribute("navi",pageNavi);
     model.addAttribute("productList", productListCate);
      model.addAttribute("sysNameList", sysNameListCate);
      model.addAttribute("wishList",wishList);
      model.addAttribute("category",category);
      
      
      return "/shop/shopMain";
   }
   
   
   @RequestMapping("getProductDetail")
   public String getProductDetail(Model model,int parentSeq) {
      
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      List<String> sysNameDetail=iserv.getProductDetailImage(parentSeq);
      
      String parentId=(String)session.getAttribute("loginId");
      
     
      
      
      
      int wishSeqCheck;
      
      try {
         wishSeqCheck=pserv.getWishSeqCheck(parentId,parentSeq);
      }catch(Exception e) {
         wishSeqCheck=0;
      }
      
      
//      int wishSeqCheck=pserv.getWishSeqCheck(parentId,parentSeq);

      model.addAttribute("wishSeqCheck",wishSeqCheck);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameDetail",sysNameDetail);
      
      return "/shop/productDetail";
            
   }
   
   
   @ResponseBody
   @RequestMapping("getTotalPrice")
   public String[] getTotalPrice(Model model,int parentSeq) {
      List<String> priceList1=pserv.getTotalMinPrice(parentSeq);
      String[] totalPrice=new String[2];
     if(priceList1.get(0)!=null) {
        totalPrice[0]=priceList1.get(0);
     }else {
        totalPrice[0]="null";
     }
     
     List<String> priceList2=pserv.getTotalMaxPrice(parentSeq);
     
     if(priceList2.get(0)!=null) {
        totalPrice[1]=priceList2.get(0);
     }else {
        totalPrice[1]="null";
     }
     
     return totalPrice;
   }
   
   
   @ResponseBody
   @RequestMapping("getTotalMinPrice")
   public String getTotalMinPrice(Model model,int parentSeq) {
      List<String> priceList=pserv.getTotalMinPrice(parentSeq);
      String totalMinPrice;
     if(priceList.get(0)!=null) {
        totalMinPrice=priceList.get(0);
     }else {
        totalMinPrice="null";
     }

      
     
      return totalMinPrice;
   }
   
   @ResponseBody
   @RequestMapping("getTotalMaxPrice")
   public String getTotalMaxPrice(Model model,int parentSeq) {
      List<String> priceList=pserv.getTotalMaxPrice(parentSeq);
      String totalMaxPrice;
     if(priceList.get(0)!=null) {
        totalMaxPrice=priceList.get(0);
     }else {
        totalMaxPrice="null";
     }

      
      
     
      return totalMaxPrice;
   }
   
   
   @ResponseBody
   @RequestMapping("getMinPrice")
   public String getMinPrice(Model model,String sized,int parentSeq) {
      List<String> priceList=pserv.getMinPrice(sized,parentSeq);
      String minPrice;
     if(priceList.get(0)!=null) {
        minPrice=priceList.get(0);
     }else {
        minPrice="null";
     }
      
      
     
      return minPrice;
   }
   
   @ResponseBody
   @RequestMapping("getMaxPrice")
   public String getMaxPrice(Model model,String sized,int parentSeq) {
      List<String> priceList=pserv.getMaxPrice(sized,parentSeq);
      String maxPrice;
     if(priceList.get(0)!=null) {
        maxPrice=priceList.get(0);
     }else {
        maxPrice="null";
     }
     
      
      
     
      return maxPrice;
   }
   

   
   @RequestMapping("getBuyCheck")
   public String getBuyCheck(String sized,int parentSeq,String buyPrice,String sellPrice,int releasePrice,Model model) {
      
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      
      
      model.addAttribute("releasePrice",releasePrice);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("sized",sized);
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("buyPrice",buyPrice);
      model.addAttribute("sellPrice",sellPrice);
      
      
      return "/shop/buyCheck";
      
   }
   
   @RequestMapping("getSellCheck")
   public String getSellCheck(String sized,int parentSeq,String buyPrice,String sellPrice,int releasePrice,Model model) {
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      

      model.addAttribute("releasePrice",releasePrice);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("sized",sized);
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("buyPrice",buyPrice);
      model.addAttribute("sellPrice",sellPrice);
      
      return "/shop/sellCheck";
   }
   
   @RequestMapping("getBuyChoice")
   public String getBuyChoice(int parentSeq,String sized,String buyPrice,String sellPrice,int releasePrice,Model model) {
      
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      
      model.addAttribute("releasePrice",releasePrice);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("sized",sized);
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("buyPrice",buyPrice);
      model.addAttribute("sellPrice",sellPrice);
      
      return "/shop/buyChoice";
   }
   
   @RequestMapping("getSellChoice")
   public String getSellChoice(int parentSeq,String sized,String buyPrice,String sellPrice,int releasePrice,Model model) {
      
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);

      model.addAttribute("releasePrice",releasePrice);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("sized",sized);
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("buyPrice",buyPrice);
      model.addAttribute("sellPrice",sellPrice);
      
      
      return "/shop/sellChoice";
   }
   
   @RequestMapping("getPaymentCheck")
   public String getPaymentCheck(int parentSeq,int finalPrice,int sized,String result,Model model) {
      
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      
      String id=(String)session.getAttribute("loginId");
      List<MemberDTO> personalInfo=mserv.getPersonalInfo(id);
      
      
      
      
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("result",result);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("personalInfo",personalInfo);
      model.addAttribute("sized",sized);
      model.addAttribute("finalPrice",finalPrice);
      
      return "/shop/paymentCheck";
   }
   
   @RequestMapping("getSellPaymentCheck")
   public String getSellPaymentCheck(int parentSeq,int finalPrice,int sized,String result,Model model) {
      
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      
      String id=(String)session.getAttribute("loginId");
      List<MemberDTO> personalInfo=mserv.getPersonalInfo(id);
      
      //result??? ????????????or????????????
      
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("result",result);
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("personalInfo",personalInfo);
      model.addAttribute("sized",sized);
      model.addAttribute("finalPrice",finalPrice);
      
      return "/shop/sellPaymentCheck";
   }
   
   @RequestMapping("getKakaoPay")
   public String getKakaoPay(int parentSeq,int totalPay,int sized,String result,int finalPrice,Model model) {
      
      
      
      String sysNameOneImage=iserv.getProductOneImage(parentSeq);
      List<ProductDTO> productDetail=pserv.getProductDetail(parentSeq);
      
      String id=(String)session.getAttribute("loginId");
      List<MemberDTO> personalInfo=mserv.getPersonalInfo(id);
      
     
      model.addAttribute("parentSeq",parentSeq);
      model.addAttribute("finalPrice",finalPrice); //?????????,???????????? ??? ?????? ?????? ??????
      model.addAttribute("productDetail",productDetail);
      model.addAttribute("sysNameOneImage",sysNameOneImage);
      model.addAttribute("personalInfo",personalInfo);
      model.addAttribute("sized",sized);
      model.addAttribute("totalPay",totalPay); //?????????,???????????? ????????? ??? ??????
      model.addAttribute("result",result);
      
      return "/shop/kakaopay";
   }
   
   @RequestMapping("getSuccessBuy")
   public String getSuccessBuy(int parentSeq,int totalPay,int sized,String result,int finalPrice,Model model) {
      
      
      
      
      if(result.equals("????????????")) {
         String buyerId=(String)session.getAttribute("loginId");
        
         int seq=pserv.minSeqInMinPrice(parentSeq,sized);  //sell_bid?????? ?????? ???????????? ???????????? ?????? ?????? ?????? seq ????????????
         String sellerId=pserv.getSellerId(seq); //seq??? seller ID ???????????? 
         pserv.enrollBuyList(buyerId,parentSeq,finalPrice,sized);
         pserv.enrollSellList(sellerId,parentSeq,finalPrice,sized);
         pserv.sellBidDeleteBySeq(seq);  //????????? ???????????? sell_bid ??????????????? ??????
         
         List<ProductDTO> productInfo=pserv.getProductDetail(parentSeq); //seq??? ???????????? ????????????
         List<MemberDTO> buyerInfo=mserv.getPersonalInfo(buyerId); // ???????????? ????????? ?????? ?????? 
         List<MemberDTO> sellerInfo=mserv.getPersonalInfo(sellerId); //???????????? ????????? ?????? ??????
         
         
         //?????? ???????????? ?????? ???????????? ?????? ????????? ????????????????????? ?????? ????????????.
         OrderListDTO dto=new OrderListDTO();
         dto.setParentSeq(parentSeq);
         dto.setTitle(productInfo.get(0).getTitle());
         dto.setPrice(finalPrice);
         dto.setSized(sized);
         dto.setCategory(productInfo.get(0).getCategory());
         dto.setBuyerId(buyerId);
         dto.setBuyerName(buyerInfo.get(0).getName());
         dto.setBuyerPhone(buyerInfo.get(0).getPhone());
         dto.setJibunAddress(buyerInfo.get(0).getJibunAddress());
         dto.setSellerId(sellerId);
         dto.setSellerName(sellerInfo.get(0).getName());
         dto.setSellerPhone(sellerInfo.get(0).getPhone());
         
         
         pserv.insertOrderList(dto);  //?????????????????? ?????? ???????????? ??????
         
         return "redirect:/member/purchaseEnd";
         
         
      }else {
         String id=(String)session.getAttribute("loginId");
         pserv.insertBuyBid(parentSeq,sized,finalPrice,id); //?????? ?????? ????????????
       
         return "redirect:/member/purchaseBid"; // ??? ?????????????????? ?????? ????????? ???????????????
      }
      
      
   }

   
   @RequestMapping("getSuccessSell")
   public String getSuccessSell(int parentSeq,int totalPay,int sized,String result,int finalPrice,Model model) {
      

      if(result.equals("????????????")) {
         String sellerId=(String)session.getAttribute("loginId");
         
         int seq=pserv.minSeqInMaxPrice(parentSeq,sized);  //buy_bid?????? ?????? ???????????? ???????????? ?????? ?????? ?????? seq ????????????
        
         String buyerId=pserv.getBuyerId(seq); //seq??? buyer ID ????????????
         
         pserv.enrollBuyList(buyerId,parentSeq,finalPrice,sized);
         pserv.enrollSellList(sellerId,parentSeq,finalPrice,sized);
         pserv.buyBidDeleteBySeq(seq);  //????????? ???????????? buy_bid ??????????????? ??????
         
         List<ProductDTO> productInfo=pserv.getProductDetail(parentSeq); //seq??? ???????????? ????????????
         List<MemberDTO> buyerInfo=mserv.getPersonalInfo(buyerId); // ???????????? ????????? ?????? ?????? 
         List<MemberDTO> sellerInfo=mserv.getPersonalInfo(sellerId); //???????????? ????????? ?????? ??????
         
         
         //?????? ???????????? ?????? ???????????? ?????? ????????? ????????????????????? ?????? ????????????.
         OrderListDTO dto=new OrderListDTO();
         dto.setParentSeq(parentSeq);
         dto.setTitle(productInfo.get(0).getTitle());
         dto.setPrice(finalPrice);
         dto.setSized(sized);
         dto.setCategory(productInfo.get(0).getCategory());
         dto.setBuyerId(buyerId);
         dto.setBuyerName(buyerInfo.get(0).getName());
         dto.setBuyerPhone(buyerInfo.get(0).getPhone());
         dto.setJibunAddress(buyerInfo.get(0).getJibunAddress());
         dto.setSellerId(sellerId);
         dto.setSellerName(sellerInfo.get(0).getName());
         dto.setSellerPhone(sellerInfo.get(0).getPhone());
         
         pserv.insertOrderList(dto);  //?????????????????? ?????? ???????????? ??????
         
         return "redirect:/member/saleEnd";
         
         
      }else {
         String id=(String)session.getAttribute("loginId");
         pserv.insertSellBid(parentSeq,sized,finalPrice,id); //?????? ?????? ????????????
        
         return "redirect:/member/saleBid";  // ??? ?????????????????? ?????? ????????? ???????????????
      }
      
      
   }
   
   @ResponseBody
   @RequestMapping("enrollWishList")
   public String enrollWishList(int parentSeq) {
     
      
      String loginId=(String)session.getAttribute("loginId");
      
      int seq=pserv.enrollWishList(parentSeq,loginId);
      String scc;
      if(seq==1) {
         scc="success";
      }else {
         scc="fail";
      }
      
      
      return scc;
   }
   
   @ResponseBody
   @RequestMapping("deleteWishList")
   public String deleteWishList(int parentSeq) {
      
      String parentId=(String)session.getAttribute("loginId");
      
      int seq=pserv.deleteWishList(parentSeq,parentId);
      String scc;
      if(seq==1) {
         scc="success";
      }else {
         scc="fail";
      }
      
      
      return scc;
   }
   
   
   @RequestMapping("getWishList")
   public String getWishList(Model model) {
      String loginId=(String)session.getAttribute("loginId");
      
      List<WishListDTO> wishList=new ArrayList<>();
      wishList=pserv.getWishList(loginId);
      
      model.addAttribute("wishList",wishList);
      
      return "/shop/shopMain";
   }
   
   @ResponseBody
   @RequestMapping("wishListIdCheck")
   public String wishListIdCheck(int parentSeq) {
      String parentId=pserv.getWishListIdCheck(parentSeq);
      String exist;
      
      String loginId=(String)session.getAttribute("loginId");
      
       
      
      if(loginId.equals(parentId)) {
         exist="exist";
      }else {
         exist="not";
      }
      
      
      return exist;
   }
   
   @RequestMapping("getProductSearch")
   public String getProductSearch(String title,Model model) {
      List<ProductDTO> productList=pserv.getProductSearch(title);
      List<String> sysNameList=new ArrayList<>();
     
      
      
      String loginId=(String)session.getAttribute("loginId"); 
      List<WishListDTO> wishList=pserv.getWishList(loginId);
      
      
      for(int i=0;i<productList.size();i++) {
        int a=productList.get(i).getSeq();
        sysNameList.add(iserv.getSysNameListImageSearch(a)); 
      }
      
     
      
      model.addAttribute("wishList",wishList);
      model.addAttribute("productList",productList);
      model.addAttribute("sysNameList",sysNameList);
      model.addAttribute("category","all");
      
      return "/shop/shopMain";
            
      
   }
   
   @ResponseBody
   @RequestMapping("moreShoes")
   public List<Map<String,Object>> getMoreShoes(int cnt) {
      int end=cnt+4;
      String category="??????";
      List<Map<String,Object>> listMap=new ArrayList<Map<String,Object>>();
      Map<String,Object> map=new HashMap<>();
      
      List<ProductDTO> shoesList=pserv.getMoreShoes(cnt,end,category);
      for(int i=0;i<shoesList.size();i++) {
         map.put("seq", shoesList.get(i).getSeq());
         map.put("brand", shoesList.get(i).getBrand());
         map.put("name", shoesList.get(i).getName());
         map.put("price", shoesList.get(i).getFormedPrice());
         map.put("title", shoesList.get(i).getTitle());
         map.put("picture", iserv.getProductOneImage(shoesList.get(i).getSeq()));
         listMap.add(map);
      }
            
      return listMap;
   }
   
   @RequestMapping("getOrderList")
   public String getOrderList(Model model) {
      List<OrderListDTO> orderList=pserv.getOrderList();
      
      
      model.addAttribute("orderList",orderList);
      
      return "/manager/orderList";
   }
   
 
   @ExceptionHandler
   public String exceptionHandler(Exception e) {
      e.printStackTrace();
      return "error";
   }
   
}