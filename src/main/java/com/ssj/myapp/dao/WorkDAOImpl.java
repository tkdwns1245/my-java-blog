package com.ssj.myapp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.WorkVO;

@Repository("workDao")
public class WorkDAOImpl implements WorkDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createWork(WorkVO vo) {
		return sqlSession.insert("work.insert",vo);
	}

	@Override
	public List<WorkVO> selectWorkList() {
		return sqlSession.selectList("work.getWorkList");
	}
	
	@Override
	public WorkVO selectWorkByNum(int num) {
		return sqlSession.selectOne("work.getWorkByNum",num);
	}
	
	@Override
	public void deleteWork(int num) {
		sqlSession.delete("work.deleteWork",num);
	}

	@Override
	public void updateWork(WorkVO vo) {
		sqlSession.update("work.updateWork",vo);
	}
	
}
