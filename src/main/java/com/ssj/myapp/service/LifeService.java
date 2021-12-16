package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.LifeVO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;

public interface LifeService {
	public int createLife(LifeVO vo) throws Exception;
	public void editLife(LifeVO vo) throws Exception;
	public void deleteLife(int num) throws Exception;
	public List<LifeVO> selectLifeList(Pagination p) throws Exception;
	public List<LifeVO> selectLifeListByFilter(Pagination p,SearchFilter filter) throws Exception;
	public int getLifeListCnt() throws Exception;
	public int getLifeListCntByFilter(SearchFilter filter) throws Exception;
	public LifeVO getLifeDetail(LifeVO vo) throws Exception;
}
