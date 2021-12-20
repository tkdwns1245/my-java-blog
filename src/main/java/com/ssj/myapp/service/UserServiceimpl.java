package com.ssj.myapp.service;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.UserDaoImpl;
import com.ssj.myapp.vo.UserVO;

@Service("userService")
public class UserServiceimpl implements UserService{
	@Inject
	@Named("userDao")
	UserDaoImpl userDao;
	
	public UserVO selectUser(UserVO vo) throws Exception{
		return userDao.selectUser(vo);
	}
}
