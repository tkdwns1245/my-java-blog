package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;

public interface ProjectDAO {
	public int createProject(ProjectVO vo);
	public void updateProject(ProjectVO vo);
	public void deleteProject(int num);
	public List<ProjectVO> selectProjectList(Pagination p);
	public List<ProjectVO> selectRecentProjectList();
	public List<ProjectVO> getProjectListAll();
	public int getProjectListCnt();
	public ProjectVO getProjectDetail(ProjectVO vo);
}
