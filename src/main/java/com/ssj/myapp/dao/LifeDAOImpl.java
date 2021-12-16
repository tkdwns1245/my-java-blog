package com.ssj.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.LifeVO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;

@Repository("lifeDao")
public class LifeDAOImpl implements LifeDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createLife(LifeVO vo) {
		return sqlSession.insert("life.insert",vo);
	}
	
	@Override
	public List<LifeVO> selectLifeList(Pagination p) {
		return sqlSession.selectList("life.getLifeList",p);
	}
	
	@Override
	public List<LifeVO> selectLifeListByFilter(Pagination p,SearchFilter filter) {
		Map map = new HashMap();
		map.put("startList", p.getStartList());
		map.put("listSize", p.getListSize());
		map.put("category", filter.getCategory().getName());
		map.put("keyword", filter.getKeyword());
		
		return sqlSession.selectList("life.getLifeListByFilter",map);
	}
	
	@Override
	public int getLifeListCnt() {
		return sqlSession.selectOne("life.getLifeListCnt");
	}

	public int getLifeListCntByFilter(SearchFilter filter) {
		Map map = new HashMap();
		map.put("category", filter.getCategory().getName());
		map.put("keyword", filter.getKeyword());
		return sqlSession.selectOne("life.getLifeListCntByFilter",map);
	}
	@Override
	public LifeVO getLifeDetail(LifeVO vo) {
		return sqlSession.selectOne("life.getLifeDetail",vo);
	}

	@Override
	public void updateLife(LifeVO vo) {
		sqlSession.update("life.updateLife",vo);
	}

	@Override
	public void deleteLife(int num) {
		sqlSession.delete("life.deleteLife",num);
	}
	
}
