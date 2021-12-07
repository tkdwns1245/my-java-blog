package com.ssj.myapp.service;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.ProjectDAO;
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
	
}
