package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChatDTO {

	private int seq;
	private String writer;
	private String contents;
	private String profileSysName;
	private String imageSysName;
	private Timestamp writeDate;
	private String formedDate;
	
	public ChatDTO() {
		super();
	}

	public ChatDTO(int seq, String writer, String contents, String profileSysName, String imageSysName,
			Timestamp writeDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.contents = contents;
		this.profileSysName = profileSysName;
		this.imageSysName = imageSysName;
		this.writeDate = writeDate;
		//this.formedDate = writeDate;
		
//		if(writeDate != null) {
//	         SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
//	         this.formedDate = sdf.format(this.writeDate);
//	      }
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getProfileSysName() {
		return profileSysName;
	}

	public void setProfileSysName(String profileSysName) {
		this.profileSysName = profileSysName;
	}

	public String getImageSysName() {
		return imageSysName;
	}

	public void setImageSysName(String imageSysName) {
		this.imageSysName = imageSysName;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getFormedDate() {
		return formedDate;
	}

	public void setFormedDate(String formedDate) {
		this.formedDate = formedDate;
	}

		
	
		
}
