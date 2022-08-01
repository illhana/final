package kh.spring.dto;

public class MemberDTO {
   private String id;
   private String pw;
   private String name;
   private String phone;
   private String email;
   private String zipcode;
   private String roadAddress;
   private String jibunAddress;
   private String specAddress;
   private String personalAnswer;
   private String imageSysName;
   private String blackList;
   private String memberOut;
   
   public MemberDTO() {
      super();
      // TODO Auto-generated constructor stub
   }

   public MemberDTO(String id, String pw, String name, String phone, String email, String zipcode, String roadAddress,
         String jibunAddress, String specAddress, String personalAnswer, String imageSysName, String blackList,
         String memberOut) {
      super();
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.phone = phone;
      this.email = email;
      this.zipcode = zipcode;
      this.roadAddress = roadAddress;
      this.jibunAddress = jibunAddress;
      this.specAddress = specAddress;
      this.personalAnswer = personalAnswer;
      this.imageSysName = imageSysName;
      this.blackList = blackList;
      this.memberOut = memberOut;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPw() {
      return pw;
   }

   public void setPw(String pw) {
      this.pw = pw;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getZipcode() {
      return zipcode;
   }

   public void setZipcode(String zipcode) {
      this.zipcode = zipcode;
   }

   public String getRoadAddress() {
      return roadAddress;
   }

   public void setRoadAddress(String roadAddress) {
      this.roadAddress = roadAddress;
   }

   public String getJibunAddress() {
      return jibunAddress;
   }

   public void setJibunAddress(String jibunAddress) {
      this.jibunAddress = jibunAddress;
   }

   public String getSpecAddress() {
      return specAddress;
   }

   public void setSpecAddress(String specAddress) {
      this.specAddress = specAddress;
   }

   public String getPersonalAnswer() {
      return personalAnswer;
   }

   public void setPersonalAnswer(String personalAnswer) {
      this.personalAnswer = personalAnswer;
   }

   public String getImageSysName() {
      return imageSysName;
   }

   public void setImageSysName(String imageSysName) {
      this.imageSysName = imageSysName;
   }

   public String getBlackList() {
      return blackList;
   }

   public void setBlackList(String blackList) {
      this.blackList = blackList;
   }

   public String getMemberOut() {
      return memberOut;
   }

   public void setMemberOut(String memberOut) {
      this.memberOut = memberOut;
   }
   
}