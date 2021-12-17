package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.RecentPostVO;

public interface RecentPostService {
	public List<RecentPostVO> selectRecentPostList() throws Exception;
}
