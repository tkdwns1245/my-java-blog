package com.ssj.myapp.vo;

import java.util.Date;

public class CategoryVO {
	int num;
	String type;
	String name;
	Date createDate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "CategoryVO [num=" + num + ", type=" + type + ", name=" + name + ", createDate=" + createDate + "]";
	}
	
}
