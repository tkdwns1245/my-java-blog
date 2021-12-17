package com.ssj.myapp.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ProjectVO {
	private int num;
	private String projectName;
	private String introduce;
	private int members;
	private Date fromDate;
	private Date toDate;
	private long period;
	private String skills;
	private String projectImg;
	private String contents;
	private String forderName;
	private Timestamp createDate;
	
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getMembers() {
		return members;
	}
	public void setMembers(int members) {
		this.members = members;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getProjectImg() {
		return projectImg;
	}
	public void setProjectImg(String projectImg) {
		this.projectImg = projectImg;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getForderName() {
		return forderName;
	}
	public void setForderName(String forderName) {
		this.forderName = forderName;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public long getPeriod() {
		return period;
	}
	public void setPeriod(long period) {
		this.period = period;
	}
	@Override
	public String toString() {
		return "ProjectVO [projectName=" + projectName + ", introduce=" + introduce + ", members=" + members
				+ ", fromDate=" + fromDate + ", toDate=" + toDate + ", skills=" + skills + ", projectImg=" + projectImg
				+ ", contents=" + contents + ", forderName=" + forderName + "]";
	}
	
}
