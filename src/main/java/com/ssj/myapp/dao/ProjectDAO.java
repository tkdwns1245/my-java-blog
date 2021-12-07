package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;

public interface ProjectDAO {
	public int createProject(ProjectVO vo);
	public List<ProjectVO> selectProjectList(Pagination p);
	public int getProjectListCnt();
	public ProjectVO getProjectDetail(ProjectVO vo);
}
