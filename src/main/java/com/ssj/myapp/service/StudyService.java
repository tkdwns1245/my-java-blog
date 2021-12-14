package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.StudyVO;

public interface StudyService {
	public int createStudy(StudyVO vo) throws Exception;
	public void editStudy(StudyVO vo) throws Exception;
	public void deleteStudy(int num) throws Exception;
	public List<StudyVO> selectStudyList(Pagination p) throws Exception;
	public int getStudyListCnt() throws Exception;
	public StudyVO getStudyDetail(StudyVO vo) throws Exception;
}
