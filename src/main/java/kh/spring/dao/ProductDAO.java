package kh.spring.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.OrderListDTO;
import kh.spring.dto.ProductDTO;
import kh.spring.dto.WishListDTO;

@Repository
public class ProductDAO {

   @Autowired
   private SqlSession mybatis;
   
   
   
   
   // 상품 등록
   public int insert(ProductDTO dto) {
      return mybatis.insert("product.insert", dto);
   }
   
   // 상품 목록 가져오기
   public List<ProductDTO> getProductList() {
      return mybatis.selectList("product.getProductList");
   }
   
   // 상품 dto 가져오기
   public ProductDTO getProductDto(int seq) {
      return mybatis.selectOne("product.getProductDto", seq);
   }
   
   // 상품 수정
   public int update(ProductDTO dto) {
      return mybatis.update("product.update", dto);
   }
   
   // 상품 삭제
   public int delete(int seq) {
      return mybatis.delete("product.delete", seq);
   }

   
   
   
   
   
   
   
   
   // 상품 상세페이지
   public List<ProductDTO> getProductDetail(int seq){
      return mybatis.selectList("product.getProductDetail",seq);
   }
   

   public List<String> getTotalMinPrice(int parentSeq) {
      return mybatis.selectList("product.getTotalMinPrice",parentSeq);
   }
   
   
   
   public List<String> getMinPrice(String sized,int parentSeq) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      return mybatis.selectList("product.getMinPrice",param);
   }
   
   
   public List<String> getTotalMaxPrice(int parentSeq) {
      return mybatis.selectList("product.getTotalMaxPrice",parentSeq);
   }
   
   
   public List<String> getMaxPrice(String sized,int parentSeq) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      return mybatis.selectList("product.getMaxPrice",param);
   }
   
   public int minSeqInMinPrice(int parentSeq,int sized) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      return mybatis.selectOne("product.getMinSeqInMinPrice",param);
   }
   
   public int sellBidDeleteBySeq(int seq) {
      return mybatis.delete("product.sellBidDeleteBySeq",seq);
   }
   
   public int insertBuyBid(int parentSeq,int sized,int finalPrice,String id) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      param.put("finalPrice",finalPrice);
      param.put("buyerId", id);
      return mybatis.insert("product.insertBuyBid",param);
   }
   
   public String getSellerId(int seq) {
      return mybatis.selectOne("product.getSellerId",seq);
   }
   
   public String getBuyerId(int seq) {
      return mybatis.selectOne("product.getBuyerId",seq);
   }
   
   public int enrollBuyList(String buyerId,int parentSeq,int finalPrice,int sized) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      param.put("finalPrice",finalPrice);
      param.put("buyerId", buyerId);
      
      return mybatis.insert("product.enrollBuyList",param);
   }
   
   public int enrollSellList(String sellerId,int parentSeq,int finalPrice,int sized) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      param.put("finalPrice",finalPrice);
      param.put("sellerId", sellerId);
      
      return mybatis.insert("product.enrollSellList",param);
   }
   
   public int minSeqInMaxPrice(int parentSeq,int sized) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      return mybatis.selectOne("product.getMinSeqInMaxPrice",param);
   }
   
   public int buyBidDeleteBySeq(int seq) {
      return mybatis.delete("product.buyBidDeleteBySeq",seq);
   }
   
   public int insertSellBid(int parentSeq,int sized,int finalPrice,String id) {
      Map<Object, Object> param = new HashMap<>();
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      param.put("finalPrice",finalPrice);
      param.put("sellerId", id);
      return mybatis.insert("product.insertSellBid",param);
   }
   
   // category로 productList가져오기 
   public List<ProductDTO> getProductListCate(String category) {
      return mybatis.selectList("product.getProductListCate",category);
   }
   
   // id로 관심상품 가져오기
   public List<WishListDTO> getWishList(String id){
      return mybatis.selectList("product.getWishList",id);
   }
   
   // id와 상품seq를 이용하여 wishList 등록하기
   public int enrollWishList(int parentSeq,String parentId) {
      
      Map<Object,Object> param=new HashMap<>();
      param.put("parentId", parentId);
      param.put("parentSeq", parentSeq);
      
      return mybatis.insert("product.enrollWishList",param);
   }
   
   // seq로 관심상품  id 가져오기
   public String getWishListIdCheck(int parentSeq) {
      return mybatis.selectOne("product.getWishListIdCheck",parentSeq);
   }
   
   // seq와 id로 관심상품 취소(삭제)하기
   public int deleteWishList(int parentSeq,String parentId) {
      Map<Object,Object> param=new HashMap<>();
      param.put("parentId", parentId);
      param.put("parentSeq", parentSeq);
      return mybatis.delete("product.deleteWishList",param);
   }
   
   // seq와 id로 관심상품인지 아닌지 판단
   public int getWishSeqCheck(String  parentId,int parentSeq) {
      Map<Object,Object> param=new HashMap<>();
      param.put("parentId",  parentId);
      param.put("parentSeq", parentSeq);
      
//      System.out.println("DAO에서 "+parentId+":"+parentSeq);
      return mybatis.selectOne("product.getWishSeqCheck",param);
   }
   
   // 검색했을 때 상품리스트 가져오기(제목으로 찾기)
   public List<ProductDTO> getProductSearch(String title){
      return mybatis.selectList("product.getProductSearch",title);
   }
   
   //카테고리별 상품 리스트 가져오기
   public List<ProductDTO> getCateProductList(String category){
      return mybatis.selectList("product.getCateProductList",category);
   }
   
   //더보기 버튼 눌렀을때 신발 더 가져오기
   public List<ProductDTO> getMoreShoes(int cnt,int end,String category){
      Map<Object,Object> param=new HashMap<>();
      param.put("cnt", cnt);
      param.put("end", end);
      param.put("category", category);
      return mybatis.selectList("product.getMoreShoes",param);
   }
   
   // 관리자가 상품리스트 가져오기
   public List<ProductDTO> getProductListFM(){
      return mybatis.selectList("product.getProductListFM");
   }
   
   // 거래 완료 후 OrderList에 넣기
   public void insertOrderList(OrderListDTO dto){
     mybatis.insert("product.insertOrderList",dto);
   }
   // OrderList 가져오기 
   public List<OrderListDTO> getOrderList(){
      return mybatis.selectList("product.getOrderList");
   }
   
   // buy_list 에서 거래체결 날짜,시간 가져오기
   public Timestamp getjoinDatefromBuyList(String buyerId,int parentSeq,int sized) {
      Map<Object,Object> param=new HashMap<>();
      param.put("buyerId", buyerId);
      param.put("parentSeq", parentSeq);
      param.put("sized", sized);
      
      
      return mybatis.selectOne("product.getjoinDatefromBuyList",param);
   }
   
 //해당 카테고리 전체개수 가져오기
   public int getRecordTotalCount(String category) {
     return mybatis.selectOne("product.getRecordTotalCount",category);
  }
  
  
	  public String getPageNavi (int currentPage,int totalData,String category) throws Exception {
	       
	     int recordTotalCount = totalData; // 총 데이터의 개수 -> 향후 실제 데이터베이스의 개수를 세어와야 함.
	
	        int recordCountPerPage = 12;    // 한 페이지에 몇개의 게시글을 보여 줄 건지
	        int naviCountPerPage = 10;     // 한 페이지에 몇개의 네비를 보여 줄 건지
	
	        int pageTotalCount = 0;       // 총 몇개의 페이지가 필요한가?
	
	        if(recordTotalCount % recordCountPerPage > 0) { // 전체 페이지 + 1 해야 함.
	           pageTotalCount = recordTotalCount / recordCountPerPage + 1;
	        }else {
	           pageTotalCount = recordTotalCount / recordCountPerPage;
	        }
	        
	        
	        
	        if(currentPage < 1) {
	           currentPage = 1;
	        }else if(currentPage > pageTotalCount) {
	           currentPage = pageTotalCount;
	        }
	        
	
	        int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
	        int endNavi = startNavi + naviCountPerPage - 1;
	        
	        
	        if(endNavi > pageTotalCount) {
	           endNavi = pageTotalCount;
	        }
	
	//        System.out.println("현재 페이지 : " + currentPage);
	//        System.out.println("네비 시작 값 : " + startNavi);
	//        System.out.println("네비 끝 값 : " + endNavi);
	
	        boolean needNext = true;
	        boolean needPrev = true;
	        
	        if(startNavi == 1) {
	           needPrev = false;
	        }
	        
	        if(endNavi == pageTotalCount) {
	           needNext = false;
	        }
	        
	        
	        StringBuilder sb = new StringBuilder();
	    
	        if(needPrev) {
	           sb.append("<a class='BeAf' href='/product/getProductListCate?cpage="+(startNavi-1)+"&category="+(category)+"'>< </a>");
	        }
	        
	        for(int i = startNavi;i <= endNavi;i++) {
	           if(currentPage == i) {
	              sb.append("<a class='pgNation' style='border: 1px solid #000000;' href='/product/getProductListCate?cpage="+i+"&category="+(category)+"'>" + i + " </a>");
	           }else {
	             sb.append("<a class='pgNation'  href='/product/getProductListCate?cpage="+i+"&category="+(category)+"'>" + i + " </a>");
	           }
	        }
	        
	        if(needNext) {
	           sb.append("<a class='BeAf'  href='/product/getProductListCate?cpage="+(endNavi+1)+"&category="+(category)+"'>></a>");
	        }
	        
	        return sb.toString();
	  }
	  
	  // 해당 페이지 게시물 가져오기 
	  public List<ProductDTO> selectByPage(int cpage,String category){
	     
	     int start=cpage+(11*(cpage-1));
	     int end = cpage*12;
//	     System.out.println("DAO에서 selectByPage start:"+start);
//	     System.out.println("DAO에서 selectByPage end:"+end);
	     
	     Map<Object,Object> param=new HashMap<>();
	     param.put("start", start);
	     param.put("end", end);
	     param.put("category", category);
	//     String sql="select * from (select row_number() over(order by seq desc) line,car_board.* from car_board) where line between ? and ?";
	     
	     return mybatis.selectList("product.selectByPage",param);
	     
	  }
  
	  // 해당 카테고리 전체 이미지 개수
	  public int getImageCntByCate(String category) {
	     return mybatis.selectOne("product.getImageCntByCate",category);
	  }
   
}