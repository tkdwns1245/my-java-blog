package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SkillVO;

public interface SkillsService {
	public int createSkills(SkillVO vo) throws Exception;
	public void editSkills(SkillVO vo) throws Exception;
	public void deleteSkills(int num) throws Exception;
	public List<SkillVO> selectSkillsList(Pagination p) throws Exception;
	public int getSkillsListCnt() throws Exception;
	public SkillVO getSkillsDetail(SkillVO vo) throws Exception;
}
