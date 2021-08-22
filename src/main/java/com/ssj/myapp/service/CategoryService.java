package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.CategoryVO;

public interface CategoryService {
	public int createPCategory(CategoryVO vo) throws Exception;
	public List<CategoryVO> pcategoryList() throws Exception;
}
