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
	public int createPCategory(CategoryVO vo) throws Exception {
		return categoryDao.createPCategory(vo);
	}
	@Override
	public List<CategoryVO> pcategoryList() throws Exception {
		return categoryDao.pcategoryList();
	}
}
