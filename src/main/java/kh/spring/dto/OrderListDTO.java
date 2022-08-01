package kh.spring.dto;

import java.sql.Timestamp;

public class OrderListDTO {
   private int seq;
   private int parentSeq;
   private String title;
   private int price;
   private int sized;
   private String category;
   private String buyerId;
   private String buyerName;
   private String buyerPhone;
   private String jibunAddress;
   private String sellerId;
   private String sellerName;
   private String sellerPhone;
   private Timestamp joinDate;
   
   public OrderListDTO() {}

   public OrderListDTO(int seq, int parentSeq, String title, int price, int sized, String category, String buyerId,
         String buyerName, String buyerPhone, String jibunAddress, String sellerId, String sellerName,
         String sellerPhone, Timestamp joinDate) {
      super();
      this.seq = seq;
      this.parentSeq = parentSeq;
      this.title = title;
      this.price = price;
      this.sized = sized;
      this.category = category;
      this.buyerId = buyerId;
      this.buyerName = buyerName;
      this.buyerPhone = buyerPhone;
      this.jibunAddress = jibunAddress;
      this.sellerId = sellerId;
      this.sellerName = sellerName;
      this.sellerPhone = sellerPhone;
      this.joinDate = joinDate;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public int getParentSeq() {
      return parentSeq;
   }

   public void setParentSeq(int parentSeq) {
      this.parentSeq = parentSeq;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public int getSized() {
      return sized;
   }

   public void setSized(int sized) {
      this.sized = sized;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public String getBuyerId() {
      return buyerId;
   }

   public void setBuyerId(String buyerId) {
      this.buyerId = buyerId;
   }

   public String getBuyerName() {
      return buyerName;
   }

   public void setBuyerName(String buyerName) {
      this.buyerName = buyerName;
   }

   public String getBuyerPhone() {
      return buyerPhone;
   }

   public void setBuyerPhone(String buyerPhone) {
      this.buyerPhone = buyerPhone;
   }

   public String getJibunAddress() {
      return jibunAddress;
   }

   public void setJibunAddress(String jibunAddress) {
      this.jibunAddress = jibunAddress;
   }

   public String getSellerId() {
      return sellerId;
   }

   public void setSellerId(String sellerId) {
      this.sellerId = sellerId;
   }

   public String getSellerName() {
      return sellerName;
   }

   public void setSellerName(String sellerName) {
      this.sellerName = sellerName;
   }

   public String getSellerPhone() {
      return sellerPhone;
   }

   public void setSellerPhone(String sellerPhone) {
      this.sellerPhone = sellerPhone;
   }

   public Timestamp getJoinDate() {
      return joinDate;
   }

   public void setJoinDate(Timestamp joinDate) {
      this.joinDate = joinDate;
   }
   
   
   
   
   
   
   
   
   
   
}