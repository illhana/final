package kh.spring.dto;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class BuyListDTO {
   private int seq;
   private String buyerId;
   private int parentSeq;
   private int price;
   private String sized;
   private Timestamp buyDate;
   private String temp;
   public BuyListDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public BuyListDTO(int seq, String buyerId, int parentSeq, int price, String sized, Timestamp buyDate, String temp) {
      super();
      this.seq = seq;
      this.buyerId = buyerId;
      this.parentSeq = parentSeq;
      this.price = price;
      this.sized = sized;
      this.buyDate = buyDate;
      this.temp = temp;
   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public String getBuyerId() {
      return buyerId;
   }
   public void setBuyerId(String buyerId) {
      this.buyerId = buyerId;
   }
   public int getParentSeq() {
      return parentSeq;
   }
   public void setParentSeq(int parentSeq) {
      this.parentSeq = parentSeq;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getSized() {
      return sized;
   }
   public void setSized(String sized) {
      this.sized = sized;
   }
   public Timestamp getBuyDate() {
      return buyDate;
   }
   public void setBuyDate(Timestamp buyDate) {
      this.buyDate = buyDate;
   }
   public String getTemp() {
      return temp;
   }
   public void setTemp(String temp) {
      this.temp = temp;
   }
// 날짜 형태 변경
   public String getFormedDate() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      return sdf.format(this.buyDate);
   }
 //가격 콤마
   public String getFormedPrice() {
      DecimalFormat decFormat = new DecimalFormat("###,###");
      return decFormat.format(this.price);
   }
}