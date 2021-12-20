package com.ssj.myapp.service;

import com.ssj.myapp.vo.UserVO;

public interface UserService {
	public UserVO selectUser(UserVO vo) throws Exception;
}
