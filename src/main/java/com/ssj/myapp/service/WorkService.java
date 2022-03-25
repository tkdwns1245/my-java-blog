package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.WorkVO;

public interface WorkService {
	public int createWork(WorkVO vo) throws Exception;
	public List<WorkVO> selectWorkList() throws Exception;
	public WorkVO selectWorkByNum(int num) throws Exception; 
	public void deleteWork(int num) throws Exception;
	public void updateWork(WorkVO vo) throws Exception;
}
