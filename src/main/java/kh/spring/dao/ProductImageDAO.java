package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ProductImageDTO;

@Repository
public class ProductImageDAO {
   
   @Autowired
   private SqlSession mybatis;
   
   // 상품 이미지 등록
   public int insert(ProductImageDTO dto) {
      return mybatis.insert("productImage.insert", dto);
   }
   
   // 전체 상품 대표 이미지 가져오기
   public List<String> getProductListImage() {
      return mybatis.selectList("productImage.getProductListImage");
   }
   
   // 개별 상품 이미지 가져오기
   public List<ProductImageDTO> getProductDtoImage(int seq) {
      return mybatis.selectList("productImage.getProductDtoImage", seq);
   }
   
   // 수정시에 첨부된 이미지 개별 삭제
   public int deleteSavedImage(int seq) {
      return mybatis.delete("productImage.deleteSavedImage", seq);
   }
   
   // 상품 삭제시에 첨부된 이미지 모두 삭제
   public int delete(int seq) {
      return mybatis.delete("productImage.delete", seq);
   }

   
   
   
   
   
   
   
   
   // 상품 디테일에서 이미지 가져오기
   public List<String> getProductDetailImage(int seq){
      return mybatis.selectList("productImage.getProductDetailImage",seq);
   }
   
   //상품 사진 하나 가져오기
   public String getProductOneImage(int seq){
      return mybatis.selectOne("productImage.getProductOneImage",seq);
   }
   
   // 카테고리 별 대표 이미지 가져오기
   public List<String> getSysNameListImageCate(String category) {
      return mybatis.selectList("productImage.getSysNameListImageCate",category);
   }
   
   //제목 검색했을때 해당 게시물 이미지 가져오기
   public String getSysNameListImageSearch(int parentSeq){
      return mybatis.selectOne("productImage.getSysNameListImageSearch",parentSeq);
   }
   
   // 이미지 12개씩 가져오기
   public List<String> getSysNameTwelveImageCate(String category,int cpage,int imageCnt){
      int start=(imageCnt-12*cpage)+1;
      int end =imageCnt-12*(cpage-1);
      
      if(start<=0) {
         start=1;
      }
      
//      System.out.println("imagedao 에서 start:"+start);
//      System.out.println("imagedao 에서 end:"+end);
      
      Map<Object,Object> param=new HashMap<>();
      param.put("start", start);
      param.put("end", end);
      param.put("category", category);
      
      return mybatis.selectList("productImage.getSysNameTwelveImageCate",param);
   }
   
   
}