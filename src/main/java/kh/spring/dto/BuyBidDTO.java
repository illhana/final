package kh.spring.dto;

import java.text.DecimalFormat;

public class BuyBidDTO {
   private int seq;
   private int parentSeq;
   private String sized;
   private int price;
   private String id;
   private String temp;
   public BuyBidDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public BuyBidDTO(int seq, int parentSeq, String sized, int price, String id, String temp) {
      super();
      this.seq = seq;
      this.parentSeq = parentSeq;
      this.sized = sized;
      this.price = price;
      this.id = id;
      this.temp = temp;
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
   public String getSized() {
      return sized;
   }
   public void setSized(String sized) {
      this.sized = sized;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getTemp() {
      return temp;
   }
   public void setTemp(String temp) {
      this.temp = temp;
   }
 //가격 콤마
   public String getFormedPrice() {
      DecimalFormat decFormat = new DecimalFormat("###,###");
      return decFormat.format(this.price);
   }
   
}