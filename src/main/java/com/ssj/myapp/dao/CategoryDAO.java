package com.ssj.myapp.dao;

import java.util.List;
import com.ssj.myapp.vo.CategoryVO;

public interface CategoryDAO {
	public int createPCategory(CategoryVO vo);
	public List<CategoryVO> pcategoryList();
}
