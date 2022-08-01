package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class StyleBoardReplyDTO {

	private int seq;
	private int parent_seq;
	private String writer;
	private String contents;
	private String profileSysName;
	private Timestamp writeDate;
	private String temp;
	public StyleBoardReplyDTO() {
		super();
	}
	public StyleBoardReplyDTO(int seq, int parent_seq, String writer, String contents, String profileSysName,
			Timestamp writeDate, String temp) {
		super();
		this.seq = seq;
		this.parent_seq = parent_seq;
		this.writer = writer;
		this.contents = contents;
		this.profileSysName = profileSysName;
		this.writeDate = writeDate;
		this.temp = temp;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
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
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
		return sdf.format(this.writeDate);
	}
	
		
}
