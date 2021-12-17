package com.ssj.myapp.vo;

import java.sql.Timestamp;

public class RecentPostVO implements Comparable<RecentPostVO> {
	int num;
	String type;
	String postName;
	String introduce;
	String postImg;
	Timestamp createDate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	
	@Override
	public String toString() {
		return "RecentPostVO [num=" + num + ", type=" + type + ", postName=" + postName + ", introduce=" + introduce
				+ ", postImg=" + postImg + ", createDate=" + createDate + ", getNum()=" + getNum() + ", getPostName()="
				+ getPostName() + ", getIntroduce()=" + getIntroduce() + ", getCreateDate()=" + getCreateDate()
				+ ", getType()=" + getType() + ", getPostImg()=" + getPostImg() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	@Override
	  public int compareTo(RecentPostVO o) {
		if (getCreateDate() == null || o.getCreateDate() == null)
	        return 0;
	    return getCreateDate().compareTo(o.getCreateDate());
	  }
}
