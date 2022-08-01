package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BuyBidDTO;
import kh.spring.dto.BuyListDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ProductDTO;
import kh.spring.dto.SellBidDTO;
import kh.spring.dto.SellListDTO;
import kh.spring.dto.WishListDTO;
import kh.spring.utils.EncryptUtils;

@Repository
public class MemberDAO {
   
   @Autowired
   private SqlSessionTemplate mybatis;
   
   //id중복확인
   public int isIdDupl(String id) throws Exception {
      return mybatis.selectOne("Member.isIdDupl", id);
   }
   
   //phone중복확인
      public int isPhoneDupl(String phone) throws Exception {
         return mybatis.selectOne("Member.isPhoneDupl", phone);
      }
      
   //email중복확인
      public int isEmailDupl(String email) throws Exception {
         return mybatis.selectOne("Member.isEmailDupl", email);
      }
   
   //회원가입
      public int insert(MemberDTO dto) throws Exception {
         return mybatis.insert("Member.insert",dto);
      }
      
   //로그인 확인
      public int login(String id, String pw) {
         Map<String,String> map = new HashMap<>();
         map.put("id", id);
         map.put("pw", EncryptUtils.SHA512(pw));
         return mybatis.selectOne("Member.login", map);
      }
      
   // 블랙리스트 체크
      public int blackListCheck(String id) {
         return mybatis.selectOne("Member.blackListCheck", id);
      }
      
   //탈퇴
      public int memberOut(String id) throws Exception {   
         return mybatis.delete("Member.memberOut",id);
      }
      
   //탈퇴 체크
      public int memberOutCheck(String id)throws Exception {
         return mybatis.selectOne("Member.memberOutCheck", id);
      }
      
   //아이디찾기
      public String findIdC(String name, String phone)throws Exception{
         Map<String,String> map = new HashMap<>();
         map.put("name", name);
         map.put("phone", phone);
         return mybatis.selectOne("Member.findIdC", map);
      }
   //비번찾기
      public String findPwC(String id, String personalAnswer)throws Exception{
         Map<String,String> map = new HashMap<>();
         map.put("id", id);
         map.put("personalAnswer", personalAnswer);
         return mybatis.selectOne("Member.findPwC", map);
      }
      
   //비번재설정
      public String pwUpdR(String id, String pw)throws Exception{
         Map<String,String> map = new HashMap<>();
         map.put("id", id);
         map.put("pw", EncryptUtils.SHA512(pw));
         return mybatis.selectOne("Member.pwUpdR", map);
      }
      
   //마이페이지
      public MemberDTO myPage(String loginId) throws Exception {
         return mybatis.selectOne("Member.myPage", loginId);
      }
   
   //마이페이지디테일
      public MemberDTO myPageD(String loginId) throws Exception {
         return mybatis.selectOne("Member.myPage", loginId);
      }
      
   // 마이페이지 수정 (프로필 이미지 등록)
      public int update(MemberDTO dto) throws Exception {
         return mybatis.update("Member.update", dto);
      }
   
   //마이페이지 비번 일치여부
      public String myPagePwC(String id, String pw)throws Exception {
         Map<String,String> map = new HashMap<>();
         map.put("id", id);
         map.put("pw", EncryptUtils.SHA512(pw));
         
         return mybatis.selectOne("Member.myPagePwC", map);
      }
            
   // 회원 프로필 이미지 sysName 가져오기 (마이페이지에서 프로필 이미지 수정 안했을 때 사용)
      public String getImageSysName(String loginId) throws Exception {
         return mybatis.selectOne("Member.getImageSysName", loginId);
      }
      
   //회원정보출력
      public List<MemberDTO> list() throws Exception {
         return mybatis.selectList("Member.list");
      }
      
   //블랙리스트등록
      public int addBlackList(String id) throws Exception {
         return mybatis.update("Member.addBlackList",id);
      }
      
   //블랙리스트해제
      public int deleteBlackList(String id) throws Exception {
         return mybatis.update("Member.deleteBlackList", id);
      }
      
   //아이디로 본인 DTO 정보 가져오기
      public List<MemberDTO> personalInfo(String id){
         return mybatis.selectList("Member.personalInfo",id);
      }   
      
   //구매상품(입찰)BuyBid
      public List<BuyBidDTO> bidBuyBid(String id) throws Exception {
         return mybatis.selectList("Member.bidBuyBid",id);
      }
               
   //구매상품(입찰)ProductList
      public ProductDTO bidProductList(int seq) throws Exception {
         return mybatis.selectOne("Member.bidProductList",seq);
      }
               
   //구매상품(입찰)sysNameList
      public String bidSysNameList(int seq) throws Exception {
         return mybatis.selectOne("Member.bidSysNameList",seq);
      }
            
   //구매상품(종료)BuyList
      public List<BuyListDTO> endBuyList(String id) throws Exception {
         return mybatis.selectList("Member.endBuyList",id);
      }
   
   //구매상품(종료)ProductList
      public ProductDTO endProductList(int seq) throws Exception {
         return mybatis.selectOne("Member.endProductList",seq);
      }
   
   //구매상품(종료)sysNameList
      public String endSysNameList(int seq) throws Exception {
         return mybatis.selectOne("Member.endSysNameList",seq);
      }
   
   //판매상품(입찰)saleBid
      public List<SellBidDTO> saleBid(String id) throws Exception {
         return mybatis.selectList("Member.saleBid",id);
      }
      
   //구매상품(입찰)ProductList
      public ProductDTO bidProductList2(int seq) throws Exception {
         return mybatis.selectOne("Member.bidProductList2",seq);
      }
                     
   //구매상품(입찰)sysNameList
      public String bidSysNameList2(int seq) throws Exception {
         return mybatis.selectOne("Member.bidSysNameList2",seq);
      }
   
   //판매입찰(종료)SellBid
      public List<SellListDTO> endSellList(String id)throws Exception {
         return mybatis.selectList("Member.endSellList",id);
      }
      
   //판매상품(종료)ProductList
      public ProductDTO endProductList2(int seq) throws Exception {
         return mybatis.selectOne("Member.endProductList2",seq);
      }
         
   //판매상품(종료)sysNameList
      public String endSysNameList2(int seq) throws Exception {
         return mybatis.selectOne("Member.endSysNameList2",seq);
      }
   
   //관심상품WishList
      public List<WishListDTO> myProduct(String id)throws Exception {
         return mybatis.selectList("Member.myProduct",id);
      }
            
   //관심상품ProductList
      public ProductDTO myProductList(int seq) throws Exception {
         return mybatis.selectOne("Member.myProductList",seq);
      }
         
   //관심상품sysNameList
      public String mySysNameList(int seq) throws Exception {
         return mybatis.selectOne("Member.mySysNameList",seq);
      }
      
   //다현
   //해당 writer가 member로 존재하는지 여부 확인
      public int isExistWriter(String writer) {
         return mybatis.selectOne("Member.isExistWriter", writer);
      }
}