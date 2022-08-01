package kh.spring.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.BuyBidDTO;
import kh.spring.dto.BuyListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ProductDTO;
import kh.spring.dto.SellBidDTO;
import kh.spring.dto.SellListDTO;
import kh.spring.dto.WishListDTO;
import kh.spring.utils.EncryptUtils;

@Service
public class MemberService {

   @Autowired
   private MemberDAO dao;
   
   //id중복확인
   public String isIdDupl(String id) throws Exception {
      boolean isIdDupl;
      int idDuplCount = dao.isIdDupl(id);
      if(idDuplCount>0) {
         isIdDupl=true;
      }else {
         isIdDupl=false;
      }
      
      return String.valueOf(isIdDupl);
   }
   
   //phone중복확인
      public String isPhoneDupl(String phone) throws Exception {
         boolean isPhoneDupl;
         int phoneDuplCount = dao.isPhoneDupl(phone);
         if(phoneDuplCount>0) {
            isPhoneDupl=true;
         }else {
            isPhoneDupl=false;
         }
         
         return String.valueOf(isPhoneDupl);
      }
      
      //email중복확인
            public String isEmailDupl(String email) throws Exception {
               boolean isEmailDupl;
               int emailDuplCount = dao.isEmailDupl(email);
               if(emailDuplCount>0) {
                  isEmailDupl=true;
               }else {
                  isEmailDupl=false;
               }
               
               return String.valueOf(isEmailDupl);
            }
   
   //회원가입
      public int insert(MemberDTO dto) throws Exception {
         dto.setPw(EncryptUtils.SHA512(dto.getPw()));
         return dao.insert(dto);
      }
   
   //로그인 확인
   public int login(String id, String pw) {
      return dao.login(id, pw);
   }
   
   // 블랙리스트 체크
   public int blackListCheck(String id) {
      return dao.blackListCheck(id);
   }
   
   //탈퇴
   public int memberOut(String id) throws Exception {   
      return dao.memberOut(id);
   }
   
   //탈퇴 체크
   public int memberOutCheck(String id)throws Exception {
      return dao.memberOutCheck(id);
   }

   //아이디찾기
   public String findIdC(String name, String phone)throws Exception{
      String findIdC = dao.findIdC(name, phone);   
      return findIdC;
   }
   
   //비번찾기
   public String findPwC(String id, String personalAnswer)throws Exception{
      String findPwC = dao.findPwC(id, personalAnswer);   
      return findPwC;
   }
   
   //비번재설정
   public String pwUpdR(String id, String pw)throws Exception{
      return dao.pwUpdR(id,pw);
   }
   
   //마이페이지
   public MemberDTO myPage(String loginId) throws Exception {
      return dao.myPage(loginId);
   }
   
   //마이페이지디테일
      public MemberDTO myPageD(String loginId) throws Exception {
         return dao.myPage(loginId);
   }
      
   // 마이페이지 수정
   public int update(MemberDTO dto, String realPath, MultipartFile file) throws Exception {
         if(!file.isEmpty()) {
            // 사용자가 새로운 프로필 이미지를 넣었을 때
            File realPathFile = new File(realPath);
            if(!realPathFile.exists()) { realPathFile.mkdir(); }
            
            String oriName = file.getOriginalFilename();
            String sysName = UUID.randomUUID() + "_" + oriName;
            file.transferTo(new File(realPath + "/" + sysName));
            
            dto.setImageSysName(sysName);
            
            return dao.update(dto);
            
         } else {
            // 사용자가 이미지를 수정하지 않았을 때 (기존 이미지의 sysName 을 가져와서 dto 에 넣어준다.)
            return dao.update(dto);
         }
      
   }
   
   //마이페이지 비번 일치여부
      public String myPagePwC(String id, String pw)throws Exception{
         String myPagePwC = dao.myPagePwC(id,pw);   
         return myPagePwC;
      }
   
   // 회원 프로필 이미지 sysName 가져오기 (마이페이지에서 프로필 이미지 수정 안했을 때 사용)
         public String getImageSysName(String loginId) throws Exception {
            return dao.getImageSysName(loginId);
         }
   
   //회원정보출력
         public List<MemberDTO> list() throws Exception {
            return dao.list();
         }
         
   //블랙리스트등록
         public int addBlackList(String id) throws Exception {
            return dao.addBlackList(id);
         }
         
   //블랙리스트해제
         public int deleteBlackList(String id) throws Exception {
            return dao.deleteBlackList(id);
         }
   
   //아이디로 본인 DTO 정보 가져오기-윤태
         public List<MemberDTO> getPersonalInfo(String id){
            return dao.personalInfo(id);
         }
         
   //구매상품(입찰)BuyBid
         public List<BuyBidDTO> bidBuyBid(String id) throws Exception {
            return dao.bidBuyBid(id);
         }
         
   //구매상품(입찰)ProductList
         public ProductDTO bidProductList(int seq) throws Exception {
            return dao.bidProductList(seq);
         }
   //구매상품(입찰)sysNameList
         public String bidSysNameList(int seq) throws Exception {
            return dao.bidSysNameList(seq);
         }
   //구매상품(종료)BuyList
         public List<BuyListDTO> endBuyList(String id) throws Exception {
            return dao.endBuyList(id);
         }
   //구매상품(종료)ProductList
         public ProductDTO endProductList(int seq) throws Exception {
            return dao.endProductList(seq);
         }
   //구매상품(종료)sysNameList
         public String endSysNameList(int seq) throws Exception {
            return dao.endSysNameList(seq);
         }   
         
   //판매상품(입찰)SellBid
         public List<SellBidDTO> saleBid(String id) throws Exception {
            return dao.saleBid(id);
         }
         
   //구매상품(입찰)ProductList
         public ProductDTO bidProductList2(int seq) throws Exception {
            return dao.bidProductList2(seq);
         }
         
   //구매상품(입찰)sysNameList
         public String bidSysNameList2(int seq) throws Exception {
            return dao.bidSysNameList2(seq);
         }      
   //판매상품(종료)SellList
         public List<SellListDTO> endSellList(String id) throws Exception {
            return dao.endSellList(id);
         }
   
   //판매상품(종료)ProductList
         public ProductDTO endProductList2(int seq) throws Exception {
            return dao.endProductList2(seq);
         }
         
   //판매상품(종료)sysNameList
         public String endSysNameList2(int seq) throws Exception {
            return dao.endSysNameList2(seq);
         }

   //관심상품WishList
         public List<WishListDTO> myProduct(String id) throws Exception {
            return dao.myProduct(id);
         }
   
   //관심상품ProductList
         public ProductDTO myProductList(int seq) throws Exception {
            return dao.myProductList(seq);
         }
         
   //관심상품sysNameList
         public String mySysNameList(int seq) throws Exception {
            return dao.mySysNameList(seq);
         }
         
   // 다현
         // 해당 writer가 member로 존재하는지 여부 확인
         public int isExistWriter(String writer) {
            return dao.isExistWriter(writer);
         }
}