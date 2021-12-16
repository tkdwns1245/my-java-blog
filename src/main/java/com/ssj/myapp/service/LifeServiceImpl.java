package com.ssj.myapp.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.LifeDAO;
import com.ssj.myapp.vo.LifeVO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;

@Service("lifeService")
public class LifeServiceImpl implements LifeService {

	@Inject
	@Named("lifeDao")
	LifeDAO lifeDao;
	
	@Override
	public int createLife(LifeVO vo) throws Exception {
		return lifeDao.createLife(vo);
	}

	@Override
	public List<LifeVO> selectLifeList(Pagination p) throws Exception {
		return lifeDao.selectLifeList(p);
	}
	
	@Override
	public List<LifeVO> selectLifeListByFilter(Pagination p,SearchFilter filter) throws Exception{
		return lifeDao.selectLifeListByFilter(p,filter);
	}
	
	@Override
	public int getLifeListCnt() throws Exception {
		return lifeDao.getLifeListCnt();
	}
	@Override
	public int getLifeListCntByFilter(SearchFilter filter) throws Exception {
		return lifeDao.getLifeListCntByFilter(filter);
	}

	@Override
	public LifeVO getLifeDetail(LifeVO vo) throws Exception {
		return lifeDao.getLifeDetail(vo);
	}

	@Override
	public void editLife(LifeVO vo) throws Exception {
		lifeDao.updateLife(vo);
	}

	@Override
	public void deleteLife(int num) throws Exception {
		lifeDao.deleteLife(num);
	}
	
	
}
