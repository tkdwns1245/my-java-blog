package com.ssj.myapp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.ProjectVO;
import com.ssj.myapp.vo.StudyVO;

@Repository("studyDao")
public class StudyDAOImpl implements StudyDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createStudy(StudyVO vo) {
		return sqlSession.insert("study.insert",vo);
	}
	
	@Override
	public List<StudyVO> selectStudyList(Pagination p) {
		return sqlSession.selectList("study.getStudyList",p);
	}
	@Override
	public int getStudyListCnt() {
		return sqlSession.selectOne("study.getStudyListCnt");
	}

	@Override
	public StudyVO getStudyDetail(StudyVO vo) {
		return sqlSession.selectOne("study.getStudyDetail",vo);
	}

	@Override
	public void updateStudy(StudyVO vo) {
		sqlSession.update("study.updateStudy",vo);
	}

	@Override
	public void deleteStudy(int num) {
		sqlSession.delete("study.deleteStudy",num);
	}
	
}
