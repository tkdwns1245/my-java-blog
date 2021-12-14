package com.ssj.myapp.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.StudyDAO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.StudyVO;

@Service("studyService")
public class StudyServiceImpl implements StudyService {

	@Inject
	@Named("studyDao")
	StudyDAO studyDao;
	
	@Override
	public int createStudy(StudyVO vo) throws Exception {
		return studyDao.createStudy(vo);
	}

	@Override
	public List<StudyVO> selectStudyList(Pagination p) throws Exception {
		return studyDao.selectStudyList(p);
	}

	@Override
	public int getStudyListCnt() throws Exception {
		return studyDao.getStudyListCnt();
	}

	@Override
	public StudyVO getStudyDetail(StudyVO vo) throws Exception {
		return studyDao.getStudyDetail(vo);
	}

	@Override
	public void editStudy(StudyVO vo) throws Exception {
		studyDao.updateStudy(vo);
	}

	@Override
	public void deleteStudy(int num) throws Exception {
		studyDao.deleteStudy(num);
	}
	
	
}
