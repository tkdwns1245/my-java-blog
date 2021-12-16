package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.LifeVO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;

public interface LifeDAO {
	public int createLife(LifeVO vo);
	public void updateLife(LifeVO vo);
	public void deleteLife(int num);
	public List<LifeVO> selectLifeList(Pagination p);
	public List<LifeVO> selectLifeListByFilter(Pagination p,SearchFilter filter);
	public int getLifeListCnt();
	public int getLifeListCntByFilter(SearchFilter filter);
	public LifeVO getLifeDetail(LifeVO vo);
}
