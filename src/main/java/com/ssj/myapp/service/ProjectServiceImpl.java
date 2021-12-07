package com.ssj.myapp.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.ProjectDAO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Inject
	@Named("projectDao")
	ProjectDAO projectDao;
	
	@Override
	public int createProject(ProjectVO vo) throws Exception {
		return projectDao.createProject(vo);
	}

	@Override
	public List<ProjectVO> selectProjectList(Pagination p) throws Exception {
		return projectDao.selectProjectList(p);
	}

	@Override
	public int getProjectListCnt() throws Exception {
		return projectDao.getProjectListCnt();
	}

	@Override
	public ProjectVO getProjectDetail(ProjectVO vo) throws Exception {
		return projectDao.getProjectDetail(vo);
	}
	
	
}
