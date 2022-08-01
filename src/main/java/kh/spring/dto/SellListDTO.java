package kh.spring.dto;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class SellListDTO {
   private int seq;
   private String sellerId;
   private int parentSeq;
   private int price;
   private String sized;
   private Timestamp sellDate;
   private String temp;
   public SellListDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public SellListDTO(int seq, String sellerId, int parentSeq, int price, String sized, Timestamp sellDate,
         String temp) {
      super();
      this.seq = seq;
      this.sellerId = sellerId;
      this.parentSeq = parentSeq;
      this.price = price;
      this.sized = sized;
      this.sellDate = sellDate;
      this.temp = temp;
   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public String getSellerId() {
      return sellerId;
   }
   public void setSellerId(String sellerId) {
      this.sellerId = sellerId;
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
   public Timestamp getSellDate() {
      return sellDate;
   }
   public void setSellDate(Timestamp sellDate) {
      this.sellDate = sellDate;
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
      return sdf.format(this.sellDate);
   }
 //가격 콤마
   public String getFormedPrice() {
      DecimalFormat decFormat = new DecimalFormat("###,###");
      return decFormat.format(this.price);
   }
}