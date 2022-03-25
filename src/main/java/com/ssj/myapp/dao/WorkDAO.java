package com.ssj.myapp.dao;

import java.util.List;

import com.ssj.myapp.vo.WorkVO;

public interface WorkDAO {
	public int createWork(WorkVO vo);
	public List<WorkVO> selectWorkList();
	public WorkVO selectWorkByNum(int num);
	public void deleteWork(int num);
	public void updateWork(WorkVO vo);
}
