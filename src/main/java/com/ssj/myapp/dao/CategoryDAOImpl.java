package com.ssj.myapp.dao;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssj.myapp.vo.CategoryVO;

@Repository("categoryDao")
public class CategoryDAOImpl implements CategoryDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int createCategory(CategoryVO vo) {
		return sqlSession.insert("category.insert",vo);
	}

	@Override
	public List<CategoryVO> selectCategoryList() {
		return sqlSession.selectList("category.getCategoryList");
	}
	
	@Override
	public List<CategoryVO> selectCategoryListByType(String type){
		return sqlSession.selectList("category.getCategoryListByType",type);
	}
	
	@Override
	public CategoryVO selectCategoryByNum(int num) {
		return sqlSession.selectOne("category.getCategoryByNum",num);
	}
	
	@Override
	public void deleteCategory(int num) {
		sqlSession.delete("category.deleteCategory",num);
	}

	@Override
	public void updateCategory(CategoryVO vo) {
		sqlSession.update("category.updateCategory",vo);
	}
	
}
