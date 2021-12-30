package com.ssj.myapp.service;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.UserDao;
import com.ssj.myapp.dao.UserDaoImpl;
import com.ssj.myapp.vo.UserDetailsDto;

@Service("userService")
public class UserServiceImpl implements UserDetailsService{
	@Named("userDao")
	UserDaoImpl userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		ArrayList<String> authList = new ArrayList<String>();
		UserDetailsDto userDetailsDto = userDao.selectUser(username);
		authList = (ArrayList<String>) userDao.getAuthList(username);
		
		if (userDetailsDto == null) { //User을 찾지 못했을 경우
			throw new UsernameNotFoundException(username);
		}
		else {
			userDetailsDto.setAuthority(authList);
		}
		
		return userDetailsDto; //완전한 UserDetails 객체
	}

	public UserDaoImpl getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	
}
