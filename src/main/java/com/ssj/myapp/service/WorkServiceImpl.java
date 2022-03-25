package com.ssj.myapp.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.WorkDAO;
import com.ssj.myapp.vo.WorkVO;

@Service("workService")
public class WorkServiceImpl implements WorkService{
	@Inject
	@Named("workDao")
	WorkDAO workDao;

	@Override
	public int createWork(WorkVO vo) throws Exception {
		return workDao.createWork(vo);
	}

	@Override
	public List<WorkVO> selectWorkList() throws Exception {
		return workDao.selectWorkList();
	}
	
	@Override
	public WorkVO selectWorkByNum(int num) throws Exception{
		return workDao.selectWorkByNum(num);
	}

	@Override
	public void deleteWork(int num) throws Exception {
		workDao.deleteWork(num);
	}

	@Override
	public void updateWork(WorkVO vo) throws Exception {
		workDao.updateWork(vo);
	}
}
