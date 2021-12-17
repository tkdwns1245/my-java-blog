package com.ssj.myapp.vo;

import java.sql.Timestamp;

public class StudyVO {
	private int num;
	private String title;
	private String introduce;
	private String category;
	private String titleImg;
	private String contents;
	private Timestamp createDate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "StudyVO [num=" + num + ", title=" + title + ", introduce=" + introduce + ", category=" + category
				+ ", titleImg=" + titleImg + ", contents=" + contents + ", createDate=" + createDate + ", getNum()="
				+ getNum() + ", getTitle()=" + getTitle() + ", getIntroduce()=" + getIntroduce() + ", getCategory()="
				+ getCategory() + ", getTitleImg()=" + getTitleImg() + ", getContents()=" + getContents()
				+ ", getCreateDate()=" + getCreateDate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
