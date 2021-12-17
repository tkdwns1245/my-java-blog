package com.ssj.myapp.vo;

import java.sql.Timestamp;
import java.util.List;

public class SkillVO {
	int num;
	String skillName;
	String summary;
	String skillIcon;
	String contents;
	Timestamp createDate;
	List<ProjectVO> projectList;
	
	public List<ProjectVO> getProjectList() {
		return projectList;
	}
	public void setProjectList(List<ProjectVO> projectList) {
		this.projectList = projectList;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getSkillIcon() {
		return skillIcon;
	}
	public void setSkillIcon(String skillIcon) {
		this.skillIcon = skillIcon;
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
		return "SkillVO [num=" + num + ", skillName=" + skillName + ", summary=" + summary + ", skillIcon=" + skillIcon
				+ ", contents=" + contents + ", createDate=" + createDate + "]";
	}
	
}
