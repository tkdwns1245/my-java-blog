package com.ssj.myapp.vo;

public class UserVO {
	private String id;
	private String pass;
	private int lvl;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pass=" + pass + ", lvl=" + lvl + "]";
	}
	
}
