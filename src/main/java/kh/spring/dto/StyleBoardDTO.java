package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class StyleBoardDTO {

	private int seq;
	private String writer;
	private String contents;
	private String profileSysName;
	private String imageSysName;
	private int likey;
	private Timestamp writeDate;
	private String temp;
	private int replyCount;
	
	public StyleBoardDTO() {
		super();
	}

	public StyleBoardDTO(int seq, String writer, String contents, String profileSysName, String imageSysName, int likey,
			Timestamp writeDate, String temp, int replyCount) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.contents = contents;
		this.profileSysName = profileSysName;
		this.imageSysName = imageSysName;
		this.likey = likey;
		this.writeDate = writeDate;
		this.temp = temp;
		this.replyCount = replyCount;
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

	public int getLikey() {
		return likey;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}
	
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(this.writeDate);
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
}
