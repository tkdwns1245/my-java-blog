package com.ssj.myapp.service;

import java.util.List;

import com.ssj.myapp.vo.CategoryVO;

public interface CategoryService {
	public int createCategory(CategoryVO vo) throws Exception;
	public List<CategoryVO> selectCategoryList() throws Exception;
	public List<CategoryVO> selectCategoryListByType(String type) throws Exception;
	public CategoryVO selectCategoryByNum(int num) throws Exception; 
	public void deleteCategory(int num) throws Exception;
	public void updateCategory(CategoryVO vo) throws Exception;
}
