package com.ssj.myapp;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssj.myapp.service.CategoryService;
import com.ssj.myapp.service.WorkService;
import com.ssj.myapp.vo.CategoryVO;
import com.ssj.myapp.vo.WorkVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	CategoryService categoryService;
	@Inject
	WorkService workService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public ModelAndView manage(Locale locale, Model model) {
		logger.info("This is Manage.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		try {
			categoryList = categoryService.selectCategoryListByType("study");
		}catch(Exception e) {
			e.printStackTrace();
		}
		categoriesMav.addObject("categoryList",categoryList);
		categoriesMav.setViewName("manage/manage.page");
		categoriesMav.addObject("title","manage");
		return categoriesMav;
	}
	@RequestMapping(value = "/manage/categry/getCategoryByNum", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getCategoryByNumPOST(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String type;
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		
		CategoryVO tmpCategory = new CategoryVO();
		CategoryVO categoryVO = new CategoryVO();
		try {
			tmpCategory.setNum(num);
			categoryVO = categoryService.selectCategoryByNum(num);
			result.put("result", "SUCCESS");
			result.put("data",categoryVO);
		} catch(Exception e) {
			e.printStackTrace();
			result.put("result", "ERROR");
		}
		return result;
	}
	@RequestMapping(value = "/manage/category/study", method = RequestMethod.GET)
	public ModelAndView manageStudyCategoryGET(Locale locale, Model model) {
		logger.info("This is manage life category page.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		try {
			categoryList = categoryService.selectCategoryListByType("study");
		}catch(Exception e) {
			e.printStackTrace();
		}
		categoriesMav.addObject("categoryList",categoryList);
		categoriesMav.setViewName("manage/studyCategory.page");
		return categoriesMav;
	}
	
	@RequestMapping(value = "/manage/category/life", method = RequestMethod.GET)
	public ModelAndView manageLifeCategoryGET(Locale locale, Model model) {
		logger.info("This is manage life category page.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		try {
			categoryList = categoryService.selectCategoryListByType("life");
		}catch(Exception e) {
			e.printStackTrace();
		}
		categoriesMav.addObject("categoryList",categoryList);
		categoriesMav.setViewName("manage/lifeCategory.page");
		return categoriesMav;
	}
	
	@RequestMapping(value = "/manage/record/visit", method = RequestMethod.GET)
	public ModelAndView manageVisitRecordGET(Locale locale, Model model) {
		logger.info("This is visit record page.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("manage/visitRecord.page");
		return categoriesMav;
	}
	@RequestMapping(value = "/manage/resume/record", method = RequestMethod.GET)
	public ModelAndView manageResumeRecordGET(Locale locale, Model model) {
		logger.info("This is resume record page.", locale);
		ModelAndView worksMav = new ModelAndView();
		List<WorkVO> workList = new ArrayList<WorkVO>();
		try {
			workList = workService.selectWorkList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		worksMav.addObject("workList",workList);
		worksMav.setViewName("manage/resumeRecord.page");
		return worksMav;
	}
	@RequestMapping(value = "/manage/category/create", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> createCategoryPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String name;
		String type;
		int seq;
		HashMap<String, Object> result = new HashMap<String, Object>();
		name = request.getParameter("name");
		type = request.getParameter("type");
		seq = Integer.parseInt(request.getParameter("seq"));
		
		CategoryVO tmpCategory = new CategoryVO();
		
		try {
			tmpCategory.setName(name);
			tmpCategory.setSeq(seq);
			tmpCategory.setType(type);
			categoryService.createCategory(tmpCategory);
			result.put("result", "SUCCESS");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("result", "ERROR");
		}
		return result;
	}
	@RequestMapping(value = "/manage/category/edit", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> editCategoryPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String name;
		int seq;
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		name = request.getParameter("name");
		seq = Integer.parseInt(request.getParameter("seq"));
		num = Integer.parseInt(request.getParameter("num"));
		
		CategoryVO tmpCategory = new CategoryVO();
		
		try {
			tmpCategory.setName(name);
			tmpCategory.setSeq(seq);
			tmpCategory.setNum(num);
			categoryService.updateCategory(tmpCategory);
			result.put("result", "SUCCESS");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("result", "ERROR");
		}
		return result;
	}
	
	@RequestMapping(value = "/manage/category/delete", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> deleteCategoryPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		if(!request.getParameter("num").equals("")) {
			try {
				categoryService.deleteCategory(num);
				result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
		}else {
			result.put("result", "ERROR");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/manage/resume/record/create", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> createWorkPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String title;
		String content;
		String date;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		title = request.getParameter("title");
		content = request.getParameter("content");
		date = request.getParameter("date");
		
		WorkVO tmpWork = new WorkVO();
		
		try {
			tmpWork.setTitle(title);
			tmpWork.setContent(content);
			tmpWork.setDate(java.sql.Date.valueOf(date));
			workService.createWork(tmpWork);
			result.put("result", "SUCCESS");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("result", "ERROR");
		}
		return result;
	}
	@RequestMapping(value = "/manage/resume/record/edit", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> editWorkPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String title;
		String content;
		String date;
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		title = request.getParameter("title");
		content = request.getParameter("content");
		date = request.getParameter("date");
		num = Integer.parseInt(request.getParameter("num"));
		
		WorkVO tmpWork = new WorkVO();
		
		try {
			tmpWork.setTitle(title);
			tmpWork.setContent(content);
			tmpWork.setDate(java.sql.Date.valueOf(date));
			tmpWork.setNum(num);
			workService.updateWork(tmpWork);
			result.put("result", "SUCCESS");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("result", "ERROR");
		}
		return result;
	}
	
	@RequestMapping(value = "/manage/resume/record/delete", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> deleteWorkPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		if(!request.getParameter("num").equals("")) {
			try {
				workService.deleteWork(num);
				result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
		}else {
			result.put("result", "ERROR");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/manage/resume/record/getWorkByNum", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getWorkByNumPOST(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		
		WorkVO tmpWork = new WorkVO();
		WorkVO workVO = new WorkVO();
		try {
			tmpWork.setNum(num);
			workVO = workService.selectWorkByNum(num);
			result.put("result", "SUCCESS");
			result.put("data",workVO);
		} catch(Exception e) {
			e.printStackTrace();
			result.put("result", "ERROR");
		}
		return result;
	}
}
