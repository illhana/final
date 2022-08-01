package kh.spring.dto;

public class ProductImageDTO {

   private int seq;
   private int parentSeq;
   private String oriName;
   private String sysName;
   private String temp;
   
   public ProductImageDTO() {
      super();
      // TODO Auto-generated constructor stub
   }

   public ProductImageDTO(int seq, int parentSeq, String oriName, String sysName, String temp) {
      super();
      this.seq = seq;
      this.parentSeq = parentSeq;
      this.oriName = oriName;
      this.sysName = sysName;
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

   public String getOriName() {
      return oriName;
   }

   public void setOriName(String oriName) {
      this.oriName = oriName;
   }

   public String getSysName() {
      return sysName;
   }

   public void setSysName(String sysName) {
      this.sysName = sysName;
   }

   public String getTemp() {
      return temp;
   }

   public void setTemp(String temp) {
      this.temp = temp;
   }
   
   
}