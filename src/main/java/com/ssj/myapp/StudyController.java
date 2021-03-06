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
import com.ssj.myapp.service.StudyService;
import com.ssj.myapp.vo.CategoryVO;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SearchFilter;
import com.ssj.myapp.vo.StudyVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class StudyController {
	@Inject
	StudyService studyService;
	@Inject
	CategoryService categoryService;
	@Value("${resourcesPath}")
	private String resourcesPath;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/study/studyList", method = RequestMethod.GET)
	public ModelAndView studyListGet(Locale locale, Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		
		int listCnt;
		List<StudyVO> studyList = new ArrayList<StudyVO>();
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		Pagination pagination = new Pagination();
		try {
			listCnt= studyService.getStudyListCnt();
			//Pagination ????????????
			pagination.setListSize(8);
			pagination.setRangeSize(8);
			pagination.pageInfo(page, range, listCnt);
			studyList = studyService.selectStudyList(pagination);
			categoryList = categoryService.selectCategoryListByType("study");
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("This is Study.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("study/studyList.page");
		categoriesMav.addObject("title","study");
		categoriesMav.addObject("studyList", studyList);
		categoriesMav.addObject("categoryList", categoryList);
		categoriesMav.addObject("pagination", pagination);
		return categoriesMav;
	}
	
	@RequestMapping(value = "/study/filterStudyList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> filterStudyListPOST(HttpSession session, HttpServletRequest request) {
		
		int listCnt;
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<StudyVO> studyList = new ArrayList<StudyVO>();
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
			listCnt = studyService.getStudyListCntByFilter(sf);
			//Pagination ????????????
			pagination.pageInfo(page, range, listCnt);
			studyList = studyService.selectStudyListByFilter(pagination,sf);
			if (request.isUserInRole("ROLE_ADMIN")) {
				result.put("authority","ROLE_ADMIN");
		    }
			result.put("responseCode", "success");
			result.put("data", studyList);
			result.put("pagination",pagination);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("responseCode", "error");
		}
		return result;
	}
	@RequestMapping(value = "/study/writeStudy", method = RequestMethod.GET)
	public ModelAndView studyWriteGet(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		try {
			categoryList = categoryService.selectCategoryListByType("study");
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("This is Study.", locale);
		mav.addObject("categoryList",categoryList);
		mav.setViewName("study/writeStudy.page");
		return mav;
	}
	
	@RequestMapping(value = "/study/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> uploadSummernoteImageFile(MultipartHttpServletRequest mtfRequest) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String fileRoot = resourcesPath+"/study/";	//????????? ?????? ?????? ??????
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
	
	@RequestMapping(value = "/study/writeStudy", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> studyWritePost(HttpSession session, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"/study/";
		PATH = PATH.replaceAll("/", Matcher.quoteReplacement(File.separator)); //os??? ?????? ????????? ??????
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		String isShow = mtfRequest.getParameter("isShow");
		String contents = mtfRequest.getParameter("contents");
		String title = mtfRequest.getParameter("title");
		String introduce = mtfRequest.getParameter("introduce");
		String category = mtfRequest.getParameter("category");
		StudyVO svo = new StudyVO();
		svo.setTitle(title);
		svo.setIntroduce(introduce);
		svo.setCategory(category);
		svo.setContents(contents);
		if(isShow != null) {
			svo.setIsShow("true");
		}else {
			svo.setIsShow("false");
		}
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
					svo.setTitleImg(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
				}
				mpf.get(i).transferTo(file);
			}
			studyService.createStudy(svo);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	
	@RequestMapping(value = "/study/studyDetail", method = RequestMethod.GET)
	public ModelAndView studyDetail(Locale locale, Model model,
			@RequestParam(required = false, defaultValue = "1") int num) {
		StudyVO svo = new StudyVO();
		StudyVO study = new StudyVO();
		svo.setNum(num);
		try {
			study = studyService.getStudyDetail(svo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("study",study);
		logger.info("This is Study.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("study/studyDetail.page");
		return mav;
	}
	
	@RequestMapping(value = "/study/editStudy", method = RequestMethod.GET)
	public ModelAndView studyEdit(Locale locale, Model model,
			@RequestParam(required = false, defaultValue = "1") int num) {
		StudyVO pvo = new StudyVO();
		StudyVO study = new StudyVO();
		pvo.setNum(num);
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		try {
			categoryList = categoryService.selectCategoryListByType("study");
			study = studyService.getStudyDetail(pvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("study",study);
		logger.info("This is StudyEdit.", locale);
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList",categoryList);
		mav.setViewName("study/editStudy.page");
		return mav;
	}
	
	@RequestMapping(value = "/study/editStudy", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> studyEditPost(HttpSession session, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"/study/";
		PATH = PATH.replaceAll("/", Matcher.quoteReplacement(File.separator)); //os??? ?????? ????????? ??????
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		String contents = mtfRequest.getParameter("contents");
		String title = mtfRequest.getParameter("title");
		String introduce = mtfRequest.getParameter("introduce");
		String isShow = mtfRequest.getParameter("isShow");
		String category = mtfRequest.getParameter("category");
		StudyVO svo = new StudyVO();
		svo.setNum(Integer.parseInt(mtfRequest.getParameter("num")));
		svo.setTitle(title);
		svo.setIntroduce(introduce);
		svo.setCategory(category);
		svo.setContents(contents);
		if(isShow != null) {
			svo.setIsShow("true");
		}else {
			svo.setIsShow("false");
		}
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
					svo.setTitleImg(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
					mpf.get(i).transferTo(file);
				}
			}
			studyService.editStudy(svo);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	@RequestMapping(value = "/study/deleteStudy", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> deleteStudyPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		if(!request.getParameter("num").equals("")) {
			try {
				studyService.deleteStudy(num);
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
