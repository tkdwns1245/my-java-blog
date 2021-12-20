package com.ssj.myapp.dao;

import java.util.List;
import com.ssj.myapp.vo.CategoryVO;
import com.ssj.myapp.vo.LifeVO;

public interface CategoryDAO {
	public int createCategory(CategoryVO vo);
	public List<CategoryVO> selectCategoryList();
	public List<CategoryVO> selectCategoryListByType(String type);
	public CategoryVO selectCategoryByNum(int num);
	public void deleteCategory(int num);
	public void updateCategory(CategoryVO vo);
}
