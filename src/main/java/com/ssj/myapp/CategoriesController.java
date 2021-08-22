package com.ssj.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssj.myapp.service.CategoryService;
import com.ssj.myapp.vo.CategoryVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CategoriesController {
	@Inject
	CategoryService categoryService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public ModelAndView categories(Locale locale, Model model) {
		logger.info("This is Categories.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("categories/categories.page");
		categoriesMav.addObject("title","categories");
		return categoriesMav;
	}
	@RequestMapping(value = "/categories/{category_list}", method = RequestMethod.GET)
	public ModelAndView categoryList(@PathVariable("category_list") String category_list,Locale locale, Model model) {
		logger.info("This is Categories.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("categories/category_list.page");
		categoriesMav.addObject("title",category_list);
		return categoriesMav;
	}
	@RequestMapping(value = "/categories/{category_list}/{category_detail}", method = RequestMethod.GET)
	public ModelAndView categoryDetail(@PathVariable("category_detail") String category_detail,Locale locale, Model model) {
		logger.info("This is Categories.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("categories/category_detail.page");
		categoriesMav.addObject("title",category_detail);
		return categoriesMav;
	}
	@ResponseBody
	@RequestMapping(value = "/categories/pcategoryList", method=RequestMethod.GET)
	public Map  pcategoryList() throws Exception{
		logger.info("select PCategoryList");
		List<CategoryVO> pcategoryList = categoryService.pcategoryList();
		logger.info("success select PCategoryList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultMsg", "입력에 성공하였습니다.");
		map.put("pcategoryList", pcategoryList);
		
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/categories/pcategoryInsert", method=RequestMethod.POST)
	public Map  pcategoryInsert (@ModelAttribute CategoryVO vo) throws Exception{
		logger.info("insert PCategory"+vo.toString());
		categoryService.createPCategory(vo);
		int returnId = vo.getCategoryId();
		logger.info("success insert PCategory"+vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultMsg", "입력에 성공하였습니다.");
		map.put("categoryId", returnId);
		
		return map;
	}
}
