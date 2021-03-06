package com.ssj.myapp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ssj.myapp.service.CategoryService;
import com.ssj.myapp.service.LifeService;
import com.ssj.myapp.vo.CategoryVO;
import com.ssj.myapp.vo.LifeVO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LifeController {
	@Inject
	LifeService lifeService;
	@Inject
	CategoryService categoryService;
	@Value("${resourcesPath}")
	private String resourcesPath;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/life/lifeList", method = RequestMethod.GET)
	public ModelAndView lifeListGet(Locale locale, Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		
		int listCnt;
		List<LifeVO> lifeList = new ArrayList<LifeVO>();
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		Pagination pagination = new Pagination();
		try {
			listCnt= lifeService.getLifeListCnt();
			//Pagination ????????????
			pagination.setListSize(8);
			pagination.setRangeSize(8);
			pagination.pageInfo(page, range, listCnt);
			lifeList = lifeService.selectLifeList(pagination);
			categoryList = categoryService.selectCategoryListByType("life");
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("This is Life.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("life/lifeList.page");
		categoriesMav.addObject("title","life");
		categoriesMav.addObject("lifeList", lifeList);
		categoriesMav.addObject("categoryList",categoryList);
		categoriesMav.addObject("pagination", pagination);
		return categoriesMav;
	}
	
	@RequestMapping(value = "/life/filterLifeList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> filterLifeListPOST(HttpSession session, HttpServletRequest request) {
		
		int listCnt;
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<LifeVO> lifeList = new ArrayList<LifeVO>();
		Pagination pagination = new Pagination();
		int page;
		int range;
		String keyword;
		CategoryVO cvo = new CategoryVO();
		SearchFilter sf = new SearchFilter();
		
		page = Integer.parseInt(request.getParameter("page"));
		range = Integer.parseInt(request.getParameter("range"));
		cvo.setName(request.getParameter("category"));
		keyword = request.getParameter("keyword");
		
		sf.setCategory(cvo);
		sf.setKeyword(keyword);
		try {
			listCnt = lifeService.getLifeListCntByFilter(sf);
			//Pagination ????????????
			pagination.setListSize(8);
			pagination.setRangeSize(8);
			pagination.pageInfo(page, range, listCnt);
			lifeList = lifeService.selectLifeListByFilter(pagination,sf);
			result.put("responseCode", "success");
			result.put("data", lifeList);
			result.put("pagination",pagination);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("responseCode", "error");
		}
		return result;
	}
	@RequestMapping(value = "/life/writeLife", method = RequestMethod.GET)
	public ModelAndView lifeWriteGet(Locale locale, Model model) {
		logger.info("This is writeLife.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("life/writeLife.page");
		return mav;
	}
	
	@RequestMapping(value = "/life/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> uploadSummernoteImageFile(MultipartHttpServletRequest mtfRequest) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String fileRoot = resourcesPath+"/life/";	//????????? ?????? ?????? ??????
		fileRoot = fileRoot.replaceAll("/", Matcher.quoteReplacement(File.separator)); //os??? ?????? ????????? ??????
		MultipartFile multipartFile = mtfRequest.getFile("file");
		String originalFileName = multipartFile.getOriginalFilename();	//???????????? ?????????
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//?????? ?????????
				
		String savedFileName = UUID.randomUUID() + extension;	//????????? ?????? ???
		
		File targetFile = new File(fileRoot + savedFileName);	
		System.out.println(savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//?????? ??????
			result.put("fileName", savedFileName);
			result.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//????????? ?????? ??????
			result.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/life/writeLife", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> lifeWritePost(HttpSession session, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"/life/";
		PATH = PATH.replaceAll("/", Matcher.quoteReplacement(File.separator)); //os??? ?????? ????????? ??????
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		String contents = mtfRequest.getParameter("contents");
		String title = mtfRequest.getParameter("title");
		String introduce = mtfRequest.getParameter("introduce");
		String category = mtfRequest.getParameter("category");
		LifeVO lvo = new LifeVO();
		lvo.setTitle(title);
		lvo.setIntroduce(introduce);
		lvo.setCategory(category);
		lvo.setContents(contents);
		String fileUploadTime = sdf.format(date);
		try {
			List<MultipartFile> mpf = mtfRequest.getFiles("title_img");
			for(int i = 0; i < mpf.size(); i++) {
				File file = new File(PATH + mpf.get(i).getOriginalFilename());
				fileFullName = mpf.get(i).getOriginalFilename();
				fileName = FilenameUtils.getBaseName(mpf.get(i).getOriginalFilename());
				if(!fileName.equals("")) {
					fileType = fileFullName.substring(fileFullName.lastIndexOf(".")+1, fileFullName.length());
					file = new File(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					lvo.setTitleImg(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
				}
				mpf.get(i).transferTo(file);
			}
			lifeService.createLife(lvo);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	
	@RequestMapping(value = "/life/lifeDetail", method = RequestMethod.GET)
	public ModelAndView lifeDetail(Locale locale, Model model,
			@RequestParam(required = false, defaultValue = "1") int num) {
		LifeVO lvo = new LifeVO();
		LifeVO life = new LifeVO();
		lvo.setNum(num);
		try {
			life = lifeService.getLifeDetail(lvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("life",life);
		logger.info("This is Life.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("life/lifeDetail.page");
		return mav;
	}
	
	@RequestMapping(value = "/life/editLife", method = RequestMethod.GET)
	public ModelAndView lifeEdit(Locale locale, Model model,
			@RequestParam(required = false, defaultValue = "1") int num) {
		LifeVO lvo = new LifeVO();
		LifeVO life = new LifeVO();
		lvo.setNum(num);
		try {
			life = lifeService.getLifeDetail(lvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("life",life);
		logger.info("This is LifeEdit.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("life/editLife.page");
		return mav;
	}
	
	@RequestMapping(value = "/life/editLife", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> lifeEditPost(HttpSession session, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"/life/";
		PATH = PATH.replaceAll("/", Matcher.quoteReplacement(File.separator)); //os??? ?????? ????????? ??????
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		String contents = mtfRequest.getParameter("contents");
		String title = mtfRequest.getParameter("title");
		String introduce = mtfRequest.getParameter("introduce");
		String category = mtfRequest.getParameter("category");
		LifeVO lvo = new LifeVO();
		lvo.setNum(Integer.parseInt(mtfRequest.getParameter("num")));
		lvo.setTitle(title);
		lvo.setIntroduce(introduce);
		lvo.setCategory(category);
		lvo.setContents(contents);
		String fileUploadTime = sdf.format(date);
		try {
			List<MultipartFile> mpf = mtfRequest.getFiles("title_img");
			for(int i = 0; i < mpf.size(); i++) {
				File file = new File(PATH + mpf.get(i).getOriginalFilename());
				fileFullName = mpf.get(i).getOriginalFilename();
				fileName = FilenameUtils.getBaseName(mpf.get(i).getOriginalFilename());
				if(!fileName.equals("")) {
					fileType = fileFullName.substring(fileFullName.lastIndexOf(".")+1, fileFullName.length());
					file = new File(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					lvo.setTitleImg(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
					mpf.get(i).transferTo(file);
				}
			}
			lifeService.editLife(lvo);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	@RequestMapping(value = "/life/deleteLife", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> deleteLifePost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		if(!request.getParameter("num").equals("")) {
			try {
				lifeService.deleteLife(num);
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
}
