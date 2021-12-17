package com.ssj.myapp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;

@Repository("projectDao")
public class ProjectDAOImpl implements ProjectDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createProject(ProjectVO vo) {
		return sqlSession.insert("project.insert",vo);
	}
	
	@Override
	public List<ProjectVO> selectProjectList(Pagination p) {
		return sqlSession.selectList("project.project_list",p);
	}
	
	@Override
	public List<ProjectVO> getProjectListAll(){
		return sqlSession.selectList("project.getProjectListAll");
	}
	
	@Override
	public int getProjectListCnt() {
		return sqlSession.selectOne("project.getProjectListCnt");
	}

	@Override
	public ProjectVO getProjectDetail(ProjectVO vo) {
		return sqlSession.selectOne("project.getProjectDetail",vo);
	}

	@Override
	public void updateProject(ProjectVO vo) {
		sqlSession.update("project.updateProject",vo);
	}

	@Override
	public void deleteProject(int num) {
		sqlSession.delete("project.deleteProject",num);
	}
	
}
