package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SkillVO;

public interface SkillsDAO {
	public int createSkills(SkillVO vo);
	public void updateSkills(SkillVO vo);
	public void deleteSkills(int num);
	public List<SkillVO> selectSkillsList(Pagination p);
	public int getSkillsListCnt();
	public SkillVO getSkillsDetail(SkillVO vo);
}
