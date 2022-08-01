package kh.spring.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.dao.ProductDAO;
import kh.spring.dao.ProductImageDAO;
import kh.spring.dto.OrderListDTO;
import kh.spring.dto.ProductDTO;
import kh.spring.dto.ProductImageDTO;
import kh.spring.dto.WishListDTO;

@Service
public class ProductService {

   @Autowired
   private ProductDAO pdao;
   
   @Autowired
   private ProductImageDAO idao;
   
// 상품 목록 가져오기
   public List<ProductDTO> getProductList() {
      return pdao.getProductList();
   }
   
   // 상품 등록
   @Transactional
   public void insert(ProductDTO dto, String realPath, MultipartHttpServletRequest request) throws Exception {
      // 상품 dto 등록
      pdao.insert(dto);
      
      // 상품 seq 가져오기 ( 상품 이미지의 parentSeq 에 입력 )
      int parentSeq = dto.getSeq();
      
      // 상품 이미지 dto 등록
      Map<String, MultipartFile> fileMap = request.getFileMap();
      
      File realPathFile = new File(realPath);
      if(!realPathFile.exists()) { realPathFile.mkdir(); }
      
      for(MultipartFile m : fileMap.values()) {
         String oriName = m.getOriginalFilename();
         String sysName = UUID.randomUUID() + "_" + oriName;
         m.transferTo(new File(realPath + "/" + sysName));
         idao.insert(new ProductImageDTO(0, parentSeq, oriName, sysName, null));
      }
      
   }
   
   // 상품 dto 가져오기
      public ProductDTO getProductDto(int seq) {
         return pdao.getProductDto(seq);
      }
      
   // 상품 수정
   public void update(ProductDTO dto, String realPath, MultipartHttpServletRequest request) throws Exception {
      // 상품 정보 업데이트
      pdao.update(dto);
      
      Map<String, MultipartFile> fileMap = request.getFileMap();
      
      // 새로 추가된 이미지가 있을 경우
      if(!fileMap.values().isEmpty()) {
         File realPathFile = new File(realPath);
         if(!realPathFile.exists()) { realPathFile.mkdir(); }
         
         for(MultipartFile m : fileMap.values()) {
            String oriName = m.getOriginalFilename();
            String sysName = UUID.randomUUID() + "_" + oriName;
            m.transferTo(new File(realPath + "/" + sysName));
            idao.insert(new ProductImageDTO(0, dto.getSeq(), oriName, sysName, null));
         }
      }
      
   }
   
   // 상품 삭제
   public void delete(int seq) {
      pdao.delete(seq);
      idao.delete(seq);
   }

   
   
   
   
   
  
   
   //상품상세페이지
   public List<ProductDTO> getProductDetail(int seq){
      return pdao.getProductDetail(seq);
   }
   
   
   // 사이즈 상관없이 특정제품의 최저가 가져오기
   public List<String> getTotalMinPrice(int parentSeq) {
      return pdao.getTotalMinPrice(parentSeq);
   }
   
   // 사이즈 상관없이 특정제품의 최고가 가져오기
   public List<String> getTotalMaxPrice(int parentSeq) {
      return pdao.getTotalMaxPrice(parentSeq);
   }
   
   //특정 사이즈의 최저가 가져오기
   public List<String> getMinPrice(String size,int parentSeq) {
      return pdao.getMinPrice(size,parentSeq);
   }
   
   //특정 사이즈의 최고가 가져오기
   public List<String> getMaxPrice(String size,int parentSeq) {
      return pdao.getMaxPrice(size,parentSeq);
   }
   
   // sell_bid 에서 특정 사이즈의 최저가를 가져오고 그중 seq가 가장 앞에 있는 걸 가져오기
   public int minSeqInMinPrice(int parentSeq,int sized) {
      return pdao.minSeqInMinPrice(parentSeq,sized);
   }
   
   // seq로 seller ID 가져오기 (sell_List에 id를 넣어주기 위해서)
   public String getSellerId(int seq) {
      return pdao.getSellerId(seq);
   }
   
   // 즉시구매 할 경우 sell_bid에서 제거
   public int sellBidDeleteBySeq(int seq) {
      return pdao.sellBidDeleteBySeq(seq);
   }
   
   // 구매입찰시 buy_bid 테이블에 입력
   public int insertBuyBid(int parentSeq,int sized,int finalPrice,String id) {
      return pdao.insertBuyBid(parentSeq,sized,finalPrice,id);
   }
   
   // 구매완료후(최종결제까지 완료) buy_List에 등록 
   public int enrollBuyList(String buyerId,int parentSeq,int finalPrice,int sized) {
      return  pdao.enrollBuyList(buyerId,parentSeq,finalPrice,sized);
   }
   
   // 구매완료후(최종결제까지 완료) sell_List에 등록
   public int enrollSellList(String sellerId,int parentSeq,int finalPrice,int sized) {
      return pdao.enrollSellList(sellerId,parentSeq,finalPrice,sized);
   }
   
   //여기부터 판매과정
   
   // buy_bid 에서 특정 사이즈의 최고가를 가져오고 그중 seq가 가장 앞에 있는 걸 가져오기
   public int minSeqInMaxPrice(int parentSeq,int sized) {
      return pdao.minSeqInMaxPrice(parentSeq,sized);
   }
   
   // 즉시판매 할 경우 buy_bid에서 제거
   public int buyBidDeleteBySeq(int seq) {
      return pdao.buyBidDeleteBySeq(seq);
   }
   
   // 판매입찰시 sell_bid 테이블에 입력
   public int insertSellBid(int parentSeq,int sized,int finalPrice,String id) {
      return pdao.insertSellBid(parentSeq,sized,finalPrice,id);
   }
   
   // seq로 buyerID 가져오기 (buy_List에 id를 넣어주기 위해서)
   public String getBuyerId(int seq) {
      return pdao.getBuyerId(seq);
   }
   
   // category로 productListImage가져오기 
   public List<ProductDTO> getProductListCate(String category) {
     return pdao.getProductListCate(category);
   } 
   
   // id로 관심상품 가져오기
   public List<WishListDTO> getWishList(String id){
      return pdao.getWishList(id);
   }
   
   // id와 상품seq를 이용하여 wishList 등록하기
   public int enrollWishList(int parentSeq,String parentId) {
      return pdao.enrollWishList(parentSeq,parentId);
   }
   
   // seq로 관심상품 id가져오기
   public String getWishListIdCheck(int parentSeq) {
      return pdao.getWishListIdCheck(parentSeq);
   }
   
   // seq와 id로 관심상품 취소(삭제)하기
   public int deleteWishList(int parentSeq,String parentId) {
      return pdao.deleteWishList(parentSeq,parentId);
   }
   
   // seq와 id로 관심상품인지 아닌지 판단
   public int getWishSeqCheck(String  parentId,int parentSeq) {
//      System.out.println("service에서 parentId,parentSeq"+parentId+":"+parentSeq);
      return pdao.getWishSeqCheck(parentId,parentSeq);
   }
   
   // 검색했을 때 상품리스트 가져오기(제목으로 찾기)
   public List<ProductDTO> getProductSearch(String title){
      return pdao.getProductSearch(title);
   }
   
   // 카테고리별 상품 리스트 가져오기
   public List<ProductDTO> getCateProductList(String category){
      return pdao.getCateProductList(category);
   }
   
   // 더보기 버튼 눌렀을 때 신발 더 가져오기
   public List<ProductDTO> getMoreShoes(int cnt,int end,String category){
      return pdao.getMoreShoes(cnt,end,category);
   }
   
   //관리자가 상품 리스트 가져오기 
   public List<ProductDTO> getProductListFM(){
      return pdao.getProductListFM();
   }
   
   //주문 관리 테이블에 넣기
   public void insertOrderList(OrderListDTO dto) {
      pdao.insertOrderList(dto);
   }
   
   //orderlist 리스트 가져오기
   public List<OrderListDTO> getOrderList(){
      return pdao.getOrderList();
   }
   
   //해당 카테고리 전체 이미지 개수
   public int getImageCntByCate(String category) {
      return pdao.getImageCntByCate(category);
   }
   
   // buy_list 에서 거래체결 날짜,시간 가져오기
   public Timestamp getjoinDatefromBuyList(String buyerId,int parentSeq,int sized) {
      return pdao.getjoinDatefromBuyList(buyerId,parentSeq,sized);
   }
   
   //해당 카테고리 전체개수 가져오기
   public int getRecordTotalCount(String category) {
      return pdao.getRecordTotalCount(category);
   }
   
   public List<ProductDTO> selectByPage(int cpage,String category){
      return pdao.selectByPage(cpage,category);
   }
   
   public String getPageNavi(int currentPage,int totalData,String category) throws Exception {
      return pdao.getPageNavi(currentPage, totalData,category);
   }
   
}