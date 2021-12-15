package com.ssj.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;
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
	public List<StudyVO> selectStudyListByFilter(Pagination p,SearchFilter filter) {
		Map map = new HashMap();
		map.put("startList", p.getStartList());
		map.put("listSize", p.getListSize());
		map.put("category", filter.getCategory().getName());
		map.put("keyword", filter.getKeyword());
		
		return sqlSession.selectList("study.getStudyListByFilter",map);
	}
	
	@Override
	public int getStudyListCnt() {
		return sqlSession.selectOne("study.getStudyListCnt");
	}

	public int getStudyListCntByFilter(SearchFilter filter) {
		Map map = new HashMap();
		map.put("category", filter.getCategory().getName());
		map.put("keyword", filter.getKeyword());
		return sqlSession.selectOne("study.getStudyListCntByFilter",map);
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
