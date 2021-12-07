package com.ssj.myapp.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.ProjectVO;

@Repository("projectDao")
public class ProjectDAOImpl implements ProjectDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createProject(ProjectVO vo) {
		return sqlSession.insert("project.insert",vo);
	}
	
}
