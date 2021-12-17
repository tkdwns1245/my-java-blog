package com.ssj.myapp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SkillVO;

@Repository("skillsDao")
public class SkillsDAOImpl implements SkillsDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createSkills(SkillVO vo) {
		return sqlSession.insert("skills.insert",vo);
	}
	
	@Override
	public List<SkillVO> selectSkillsList(Pagination p) {
		return sqlSession.selectList("skills.getSkillsList",p);
	}
	
	@Override
	public int getSkillsListCnt() {
		return sqlSession.selectOne("skills.getSkillsListCnt");
	}

	@Override
	public SkillVO getSkillsDetail(SkillVO vo) {
		return sqlSession.selectOne("skills.getSkillsDetail",vo);
	}

	@Override
	public void updateSkills(SkillVO vo) {
		sqlSession.update("skills.updateSkills",vo);
	}

	@Override
	public void deleteSkills(int num) {
		sqlSession.delete("skills.deleteSkills",num);
	}
	
}
