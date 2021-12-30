package com.ssj.myapp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.UserDetailsDto;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	@Inject
	SqlSession sqlSession;

	@Override
	public UserDetailsDto selectUser(String username) {
		return sqlSession.selectOne("user.selectUser",username);
	}

	@Override
	public List<String> getAuthList(String username) {
		return sqlSession.selectList("user.selectAuthList",username);
	}

	@Override
	public void loginFailCnt(String username) {
		sqlSession.update("user.failCntUpdate",username);
	}

	@Override
	public void changeEnabled(String username) {
		sqlSession.update("user.changeEnabled",username);
	}
	
}
