package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;

public interface ProjectService {
	public int createProject(ProjectVO vo) throws Exception;
	public List<ProjectVO> selectProjectList(Pagination p) throws Exception;
	public int getProjectListCnt() throws Exception;
	public ProjectVO getProjectDetail(ProjectVO vo) throws Exception;
}
