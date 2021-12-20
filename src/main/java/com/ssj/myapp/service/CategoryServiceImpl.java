package com.ssj.myapp.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.CategoryDAO;
import com.ssj.myapp.vo.CategoryVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Inject
	@Named("categoryDao")
	CategoryDAO categoryDao;

	@Override
	public int createCategory(CategoryVO vo) throws Exception {
		return categoryDao.createCategory(vo);
	}

	@Override
	public List<CategoryVO> selectCategoryList() throws Exception {
		return categoryDao.selectCategoryList();
	}

	@Override
	public List<CategoryVO> selectCategoryListByType(String type) throws Exception{
		return categoryDao.selectCategoryListByType(type);
	}
	
	@Override
	public CategoryVO selectCategoryByNum(int num) throws Exception{
		return categoryDao.selectCategoryByNum(num);
	}

	@Override
	public void deleteCategory(int num) throws Exception {
		categoryDao.deleteCategory(num);
	}

	@Override
	public void updateCategory(CategoryVO vo) throws Exception {
		categoryDao.updateCategory(vo);
	}
}
