package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.UserDetailsDto;

public interface UserDao {
	public UserDetailsDto selectUser(String username);
	public List<String> getAuthList(String username);
	public void loginFailCnt(String username);
	public void changeEnabled(String username);
}
