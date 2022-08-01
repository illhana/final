package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ProductImageDAO;
import kh.spring.dto.ProductImageDTO;

@Service
public class ProductImageService {

   @Autowired
   private ProductImageDAO dao;

   public int insert(ProductImageDTO dto) {
      return dao.insert(dto);
   }

   public List<String> getProductListImage() {
      return dao.getProductListImage();
   }

   // 개별 상품 이미지 가져오기
   public List<ProductImageDTO> getProductDtoImage(int seq) {
      return dao.getProductDtoImage(seq);
   }

   // 수정시에 첨부된 이미지 개별 삭제
   public int deleteSavedImage(int seq) {
      return dao.deleteSavedImage(seq);
   }
   
   
   
   
   
   
   
   
   

   public List<String> getProductDetailImage(int seq) {
      return dao.getProductDetailImage(seq);
   }

   public String getProductOneImage(int seq) {
      return dao.getProductOneImage(seq);
   }

   public List<String> getSysNameListImageCate(String category) {
      return dao.getSysNameListImageCate(category);
   }

   public String getSysNameListImageSearch(int parentSeq) {
      return dao.getSysNameListImageSearch(parentSeq);
   }
   
   public List<String> getSysNameTwelveImageCate(String category,int cpage,int imageCnt){
	  return dao.getSysNameTwelveImageCate(category,cpage,imageCnt);
   }
}