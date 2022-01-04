package com.ssj.myapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.ProjectDAO;
import com.ssj.myapp.dao.SkillsDAO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;
import com.ssj.myapp.vo.SkillVO;

@Service("skillsService")
public class SkillsServiceImpl implements SkillsService {

	@Inject
	@Named("skillsDao")
	SkillsDAO skillsDao;
	
	@Inject
	@Named("projectDao")
	ProjectDAO projectDao;
	
	@Override
	public int createSkills(SkillVO vo) throws Exception {
		return skillsDao.createSkills(vo);
	}

	@Override
	public List<SkillVO> selectSkillsList(Pagination p) throws Exception {
		return skillsDao.selectSkillsList(p);
	}
	
	@Override
	public int getSkillsListCnt() throws Exception {
		return skillsDao.getSkillsListCnt();
	}

	@Override
	public SkillVO getSkillsDetail(SkillVO vo) throws Exception {
		SkillVO tmpSkillVO = new SkillVO();
		List<ProjectVO> pvoList = new ArrayList<ProjectVO>();
		List<ProjectVO> filteredPvoList = new ArrayList<ProjectVO>();
		
		pvoList = projectDao.getProjectListAll();
		tmpSkillVO = skillsDao.getSkillsDetail(vo);
		for(ProjectVO tmpPvo : pvoList) {
			if(tmpPvo.getSkills().indexOf(tmpSkillVO.getSkillName()) != -1) {
				filteredPvoList.add(tmpPvo);
			}
		}
		tmpSkillVO.setProjectList(filteredPvoList);
		
		return tmpSkillVO;
	}

	@Override
	public void editSkills(SkillVO vo) throws Exception {
		skillsDao.updateSkills(vo);
	}

	@Override
	public void deleteSkills(int num) throws Exception {
		skillsDao.deleteSkills(num);
	}

	@Override
	public List<SkillVO> selectSkillsListAll() throws Exception {
		return skillsDao.selectSkillsListAll();
	}
	
}
