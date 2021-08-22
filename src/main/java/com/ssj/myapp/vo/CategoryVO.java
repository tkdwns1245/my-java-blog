package com.ssj.myapp.vo;

import java.util.Date;

public class CategoryVO {
	private int categoryId;
	private String categoryName;
	private Date regDate;
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryId=" + categoryId + ", categoryName=" + categoryName + ", regDate=" + regDate + "]";
	}
	
}
