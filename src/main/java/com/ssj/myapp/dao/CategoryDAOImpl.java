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
	
	public int createPCategory(CategoryVO vo) {
		return sqlSession.insert("category.pinsert",vo);
	}
	@Override
	public List<CategoryVO> pcategoryList() {
		return sqlSession.selectList("category.pcategory_list");
	}
}
