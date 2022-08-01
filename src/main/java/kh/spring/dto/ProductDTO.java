package kh.spring.dto;

import java.text.DecimalFormat;

public class ProductDTO {

   private int seq;
   private String category;
   private String brand;
   private String title;
   private String name;
   private String color;
   private int releasePrice;
   private int likey;
   private String temp;
   
   public ProductDTO() {
      super();
      // TODO Auto-generated constructor stub
   }

   public ProductDTO(int seq, String category, String brand, String title, String name, String color, int releasePrice,
         int likey, String temp) {
      super();
      this.seq = seq;
      this.category = category;
      this.brand = brand;
      this.title = title;
      this.name = name;
      this.color = color;
      this.releasePrice = releasePrice;
      this.likey = likey;
      this.temp = temp;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public String getBrand() {
      return brand;
   }

   public void setBrand(String brand) {
      this.brand = brand;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getColor() {
      return color;
   }

   public void setColor(String color) {
      this.color = color;
   }

   public int getReleasePrice() {
      return releasePrice;
   }

   public void setReleasePrice(int releasePrice) {
      this.releasePrice = releasePrice;
   }

   public int getLikey() {
      return likey;
   }

   public void setLikey(int likey) {
      this.likey = likey;
   }

   public String getTemp() {
      return temp;
   }

   public void setTemp(String temp) {
      this.temp = temp;
   }
   public String getFormedPrice() {
     DecimalFormat decFormat = new DecimalFormat("###,###");
     return decFormat.format(this.releasePrice);
   }
   
}