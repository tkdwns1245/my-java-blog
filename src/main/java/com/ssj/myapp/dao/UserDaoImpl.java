package com.ssj.myapp.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.UserVO;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	@Inject
	SqlSession sqlSession;
	
	public UserVO selectUser(UserVO vo) {
		return sqlSession.selectOne("user.selectUser",vo);
	}
}
