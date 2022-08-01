package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.BuyBidDTO;
import kh.spring.dto.BuyListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ProductDTO;
import kh.spring.dto.SellBidDTO;
import kh.spring.dto.SellListDTO;
import kh.spring.dto.WishListDTO;
import kh.spring.service.ChatService;
import kh.spring.service.MemberService;
import kh.spring.service.StyleBoardReplyService;
import kh.spring.service.StyleBoardService;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private MemberService mServ;
	@Autowired
	private StyleBoardService stServ;
	@Autowired
	private StyleBoardReplyService strServ;
	@Autowired
	private ChatService cServ;

   @Autowired
   private HttpSession session;

   @RequestMapping("loginGo")
   public String loginGo() {
      session.invalidate();
      return "/member/login";
   }

   @RequestMapping("join")
   public String join() {
      return "/member/join";
   }
   
   @RequestMapping("findId")
   public String findId() {
      return "/member/findId";
   }
   
   @RequestMapping("findPw")
   public String findPW() {
      return "/member/findPw";
   }
   
   @RequestMapping("pwUpdate")
   public String pwUpdate() {
      return "/member/pwUpdate";
   }
   
   @RequestMapping("myPagePw")
   public String myPagePw() {
      return "/member/myPagePw";
   }
   
   //마이페이지 
   @RequestMapping("myPage")
   public String myPage(Model model) throws Exception {
      String loginId = (String)session.getAttribute("loginId");
      MemberDTO dto = mServ.myPage(loginId);
      
      //입찰 진행중 갯수
      List<BuyBidDTO> bidCountList = mServ.bidBuyBid(loginId);
      int bidCount = bidCountList.size();
      //입찰 종료 갯수
      List<BuyListDTO> bidEndCountList = mServ.endBuyList(loginId);
      int bidEndCount = bidEndCountList.size();
      //진행중+종료
      int bidCountAll = bidCount + bidEndCount;
      
      if(bidCountAll == 0) {
         model.addAttribute("bidCount", 0);
         model.addAttribute("bidEndCount", 0);
         model.addAttribute("bidCountAll", 0);
      } else {
         model.addAttribute("bidCount", bidCount);
         model.addAttribute("bidEndCount", bidEndCount);
         model.addAttribute("bidCountAll", bidCountAll);
      }
      
      //판매 진행중 갯수
      List<SellBidDTO> sellCountList = mServ.saleBid(loginId);
      int sellCount = sellCountList.size();
      //판매 종료 갯수
      List<SellListDTO> sellEndCountList = mServ.endSellList(loginId);
      int sellEndCount = sellEndCountList.size();
      //진행중+종료
      int sellCountAll = sellCount + sellEndCount;
            
      if(sellCountAll == 0) {
         model.addAttribute("sellCount", 0);
         model.addAttribute("sellEndCount", 0);
         model.addAttribute("sellCountAll", 0);
      } else {
         model.addAttribute("sellCount", sellCount);
         model.addAttribute("sellEndCount", sellEndCount);
         model.addAttribute("sellCountAll", sellCountAll);
         }
      
      
      model.addAttribute("dto", dto);
      
      return "/member/myPage";
   }
   //마이페이지 디테일
   @RequestMapping("myPageDetail")
   public String myPageDetail(Model model) throws Exception {
      String loginId = (String)session.getAttribute("loginId");
      MemberDTO dto = mServ.myPageD(loginId);
      
      model.addAttribute("dto", dto);
      
      return "/member/myPageDetail";
   }
   
   //마이페이지 업데이트
   @RequestMapping("update")
   public String update(MemberDTO dto, MultipartFile file)throws Exception{
      String loginId = (String)session.getAttribute("loginId");
      dto.setId(loginId);
      
      String realPath = session.getServletContext().getRealPath("upload"); 
      
      if(!file.isEmpty()) {
         // 사용자가 새로운 프로필 이미지를 넣었을 때
         mServ.update(dto, realPath, file);
         // style_board && style_board_reply && multichat 의 profile 수정
         stServ.updateProfile(dto.getImageSysName(), loginId);
         strServ.updateProfile(dto.getImageSysName(), loginId);
         cServ.updateProfile(dto.getImageSysName(), loginId);
         //profile 수정했으면 기존 프로필 사진은 삭제하기

      } else {
         // 사용자가 이미지를 수정하지 않았을 때 (기존 이미지의 sysName 을 가져와서 dto 에 넣어준다.)
         dto.setImageSysName(mServ.getImageSysName(loginId));
         mServ.update(dto, realPath, file);
      }
      
      
      return "redirect:/member/myPageDetail";
   }
   
   //마이페이지 비번 일치여부
   @ResponseBody
   @RequestMapping("myPagePwC")
      public String myPagePwC(String pw) throws Exception {
         String id = (String)session.getAttribute("loginId");
         String myPagePwU = mServ.myPagePwC(id,pw);      
//         System.out.println(myPagePwU); 값 확인
         return myPagePwU;
      }
   

   //마이페이지 PW재설정
   @RequestMapping("myPagePwU")
      public String myPagePwU(String pw) throws Exception {
         String id = (String) session.getAttribute("loginId");
         String myPagePwU = mServ.pwUpdR(id,pw);      
         return "/member/login";
      }

   //아이디 중복확인
   @ResponseBody//ajax인 경우
   @RequestMapping("idDuplCheck")
   public String idDuplCheck(String id) throws Exception {   
      String isIdDupl = mServ.isIdDupl(id);
      return isIdDupl;
   }
   
   //핸드폰번호 중복확인
   @ResponseBody
   @RequestMapping("phoneDuplCheck")
   public String phoneDuplCheck(String phone) throws Exception {
      String isPhoneDupl = mServ.isPhoneDupl(phone);
      return isPhoneDupl;
   }
   
   //이메일 중복확인
      @ResponseBody
      @RequestMapping("emailDuplCheck")
      public String emailDuplCheck(String email) throws Exception {
         String isEmailDupl = mServ.isEmailDupl(email);
         return isEmailDupl;
      }
   
   //회원가입
      @RequestMapping("signUp")
      public String signup(MemberDTO dto) throws Exception{
         mServ.insert(dto);
         return "/member/login";
      }
      
   //로그인
   @RequestMapping("login")
   public String login(String id, String pw) throws Exception {
      int result = mServ.login(id,pw);
      
      if(result>0) {
         if(mServ.blackListCheck(id) == 1) {
            session.setAttribute("isLoginOk", 2);
         } else if(mServ.memberOutCheck(id) == 1) {
            session.setAttribute("isLoginOk", 3);
         } else {
            session.setAttribute("isLoginOk", 1);//세션에 id 저장
            session.setAttribute("loginId", id);
         }
         
         
//         int isLoginOk = (int)session.getAttribute("isLoginOk");
//         System.out.println("로그인확인: "+isLoginOk);
         
      }else {
         session.setAttribute("isLoginOk", 0);//세션에 id 저장
      }
      return "redirect:/";
         
   }   
   
   //로그아웃
   @RequestMapping("logout")
      public String logout() throws Exception {
         session.invalidate();//세션 비우기
         return "redirect:/";
      }
   
   //탈퇴
      @RequestMapping("memberOut")
      public String memberout() throws Exception {
         String id = (String)session.getAttribute("loginId");
         mServ.memberOut(id);
         session.invalidate();
//데이터 보존을 위해 방법 변경
//         String id = (String)session.getAttribute("loginId");
//         mServ.deleteById(id);//멤버삭제
//         session.invalidate();//세션 비우기
         
         // 탈퇴시 style_board 게시글 지우기
         stServ.deleteByWriter(id);
         
         return "redirect:/";
      }   
   
   //아이디찾기
   @ResponseBody
   @RequestMapping("findIdCheck")
      public String findIdCheck(String name, String phone) throws Exception {
         String findIdC = mServ.findIdC(name,phone);      
//         System.out.println(findIdC); 아이디 값 확인
         return findIdC;
      }
   
   //비번찾기
   @ResponseBody
   @RequestMapping("findPwCheck")
      public String findPwCheck(String id, String personalAnswer) throws Exception {
      session.setAttribute("findPwCId", id);
         String findPwC = mServ.findPwC(id,personalAnswer);      
         return findPwC;
      }
   
   //로그인/마이페이지 PW재설정
      @RequestMapping("pwUpdateRe")
         public String pwUpdateRe(String pw) throws Exception {
            String id;
            String findPwCId = (String) session.getAttribute("findPwCId");
            String myPageId = (String)session.getAttribute("loginId");
            
            if(findPwCId != null) {
               id = findPwCId;
               String pwUpdR = mServ.pwUpdR(id,pw);      
               
            }else if(myPageId != null) {
               id = myPageId;
               String pwUpdR = mServ.pwUpdR(id,pw);   
            }
                  
            return "/member/login";
         }   
      
   //회원정보출력
      @RequestMapping("list")
      public String list(Model model) throws Exception {
         List<MemberDTO> list = mServ.list();
         model.addAttribute("list", list);
         
         return "/manager/memberList";
      }
   
   //블랙리스트 둥록
      @RequestMapping("addBlackList")
      public String addBlackList(String id) throws Exception {
         mServ.addBlackList(id);
         
         return "redirect:/member/list";
      }
      
   //블랙리스트 둥록
         @RequestMapping("deleteBlackList")
         public String deleteBlackList(String id) throws Exception {
            mServ.deleteBlackList(id);
            
            return "redirect:/member/list";
         }
      
      //구매상품(입찰진행중)BuyBid
      @RequestMapping("purchaseBid")
      public String purchaseBid(Model model) throws Exception {
         String id = (String)session.getAttribute("loginId");
         
         //Buybid
         List<BuyBidDTO> list = mServ.bidBuyBid(id);
         
         //product
         List<ProductDTO> productList = new ArrayList<>();
         for(int i=0; i<list.size(); i++) {
            productList.add(mServ.bidProductList(list.get(i).getParentSeq()));
         }
         
         //sysName
         List<String> sysNameList = new ArrayList<>();
         for(int i=0; i<productList.size(); i++) {
            sysNameList.add(mServ.bidSysNameList(productList.get(i).getSeq()));
         }
         
         model.addAttribute("bList", list);
         model.addAttribute("pList", productList);
         model.addAttribute("sList", sysNameList);
         
         //BuyList 의 갯수 표시
         List<BuyListDTO> countList = mServ.endBuyList(id);
         int count = countList.size();
         
         if(count == 0) {
            model.addAttribute("count", 0);
         } else {
            model.addAttribute("count", count);
         }
         
         return "/member/purchaseBid";
      }
      
      
      //구매상품(종료)BuyList,product
      @RequestMapping("purchaseEnd")
      public String purchaseEnd(Model model) throws Exception{
         String id = (String)session.getAttribute("loginId");
         
         //BuyList
         List<BuyListDTO> list = mServ.endBuyList(id);
   
         //product
         List<ProductDTO> productList = new ArrayList<>();
         for(int i=0; i<list.size(); i++) {
            productList.add(mServ.endProductList(list.get(i).getParentSeq()));
         }
         
         //sysName
         List<String> sysNameList = new ArrayList<>();
         for(int i=0; i<productList.size(); i++) {
            sysNameList.add(mServ.endSysNameList(productList.get(i).getSeq()));
         }
         
         model.addAttribute("bList", list);
         model.addAttribute("pList", productList);
         model.addAttribute("sList", sysNameList);
         
         //BuyBid 의 갯수 표시
         List<BuyBidDTO> countList = mServ.bidBuyBid(id);
         int count = countList.size();
         
         if(count == 0) {
            model.addAttribute("count", 0);
         } else {
            model.addAttribute("count", count);
         }
         
         return "/member/purchaseEnd";
      }
      
      //판매상품(입찰진행중)
         @RequestMapping("saleBid")
         public String saleBid(Model model) throws Exception{
            String id = (String)session.getAttribute("loginId");
            
            //SellBid
            List<SellBidDTO> list = mServ.saleBid(id);
            
            //product
            List<ProductDTO> productList = new ArrayList<>();
            for(int i=0; i<list.size(); i++) {
               productList.add(mServ.bidProductList2(list.get(i).getParentSeq()));
            }
            
            //sysName
            List<String> sysNameList = new ArrayList<>();
            for(int i=0; i<productList.size(); i++) {
               sysNameList.add(mServ.bidSysNameList2(productList.get(i).getSeq()));
            }
            
            model.addAttribute("saleList", list);
            model.addAttribute("pList", productList);
            model.addAttribute("sList", sysNameList);
            
            //SellList 의 갯수 표시
            List<SellListDTO> countList = mServ.endSellList(id);
            int count = countList.size();
            
            if(count == 0) {
               model.addAttribute("count", 0);
            } else {
               model.addAttribute("count", count);
            }
            
            return "/member/saleBid";
      }
         
      //판매상품(종료)
         @RequestMapping("saleEnd")
         public String saleEnd(Model model) throws Exception{
            String id = (String)session.getAttribute("loginId");
            
            //SellList
            List<SellListDTO> list = mServ.endSellList(id);
            
            //product
            List<ProductDTO> productList = new ArrayList<>();
            for(int i=0; i<list.size(); i++) {
               productList.add(mServ.endProductList2(list.get(i).getParentSeq()));
            }
            
            //sysName
            List<String> sysNameList = new ArrayList<>();
            for(int i=0; i<productList.size(); i++) {
               sysNameList.add(mServ.endSysNameList2(productList.get(i).getSeq()));
            }
            
            model.addAttribute("saleList", list);
            model.addAttribute("pList", productList);
            model.addAttribute("sList", sysNameList);
            
            //SaleBid 의 갯수 표시
            List<SellBidDTO> countList = mServ.saleBid(id);
            int count = countList.size();
            
            if(count == 0) {
               model.addAttribute("count", 0);
            } else {
               model.addAttribute("count", count);
            }
            
            return "/member/saleEnd";
      }         
         
      //관심상품
         @RequestMapping("myProduct")
         public String myProduct(Model model) throws Exception{
            String id = (String)session.getAttribute("loginId");
            
            //WishList
            List<WishListDTO> list = mServ.myProduct(id);
            
            //product
            List<ProductDTO> productList = new ArrayList<>();
            for(int i=0; i<list.size(); i++) {
               productList.add(mServ.myProductList(list.get(i).getParentSeq()));
            }
            
            //sysName
            List<String> sysNameList = new ArrayList<>();
            for(int i=0; i<productList.size(); i++) {
               sysNameList.add(mServ.mySysNameList(productList.get(i).getSeq()));
            }
            
            model.addAttribute("wList", list);
            model.addAttribute("pList", productList);
            model.addAttribute("sList", sysNameList);
            
            return "/member/myProduct";
         }
         
         
      
   @ExceptionHandler
   public String ExceptionHandler(Exception e) {
      e.printStackTrace();
      return "error";
   }
}