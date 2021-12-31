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
	private String projectFile;
	private String contents;
	private String github;
	private Timestamp createDate;
	
	
	public String getProjectFile() {
		return projectFile;
	}
	public void setProjectFile(String projectFile) {
		this.projectFile = projectFile;
	}
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
	public String getGithub() {
		return github;
	}
	public void setGithub(String github) {
		this.github = github;
	}
	@Override
	public String toString() {
		return "ProjectVO [num=" + num + ", projectName=" + projectName + ", introduce=" + introduce + ", members="
				+ members + ", fromDate=" + fromDate + ", toDate=" + toDate + ", period=" + period + ", skills="
				+ skills + ", projectImg=" + projectImg + ", projectFile=" + projectFile + ", contents=" + contents
				+ ", github=" + github + ", createDate=" + createDate + ", getProjectFile()=" + getProjectFile()
				+ ", getCreateDate()=" + getCreateDate() + ", getProjectName()=" + getProjectName()
				+ ", getIntroduce()=" + getIntroduce() + ", getMembers()=" + getMembers() + ", getFromDate()="
				+ getFromDate() + ", getToDate()=" + getToDate() + ", getSkills()=" + getSkills() + ", getProjectImg()="
				+ getProjectImg() + ", getContents()=" + getContents() + ", getNum()=" + getNum() + ", getPeriod()="
				+ getPeriod() + ", getGithub()=" + getGithub() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
