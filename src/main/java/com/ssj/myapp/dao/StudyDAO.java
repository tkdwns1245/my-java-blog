package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.StudyVO;

public interface StudyDAO {
	public int createStudy(StudyVO vo);
	public void updateStudy(StudyVO vo);
	public void deleteStudy(int num);
	public List<StudyVO> selectStudyList(Pagination p);
	public int getStudyListCnt();
	public StudyVO getStudyDetail(StudyVO vo);
}
