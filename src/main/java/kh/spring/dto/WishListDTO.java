package kh.spring.dto;

public class WishListDTO {
   private int seq;
   private String parentId;
   private int parentSeq;
   private String temp;
   public WishListDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public WishListDTO(int seq, String parentid, int parentSeq, String temp) {
      super();
      this.seq = seq;
      this.parentId = parentid;
      this.parentSeq = parentSeq;
      this.temp = temp;
   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public String getParentid() {
      return parentId;
   }
   public void setParentid(String parentid) {
      this.parentId = parentid;
   }
   public int getParentSeq() {
      return parentSeq;
   }
   public void setParentSeq(int parentSeq) {
      this.parentSeq = parentSeq;
   }
   public String getTemp() {
      return temp;
   }
   public void setTemp(String temp) {
      this.temp = temp;
   }
   
   
}