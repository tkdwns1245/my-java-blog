package com.ssj.myapp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

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

import com.ssj.myapp.service.LifeService;
import com.ssj.myapp.service.ProjectService;
import com.ssj.myapp.service.RecentPostService;
import com.ssj.myapp.service.SkillsService;
import com.ssj.myapp.service.StudyService;
import com.ssj.myapp.service.UserService;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.RecentPostVO;
import com.ssj.myapp.vo.SkillVO;
import com.ssj.myapp.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	StudyService studyService;
	@Inject
	ProjectService projectService;
	@Inject
	SkillsService skillsService;
	@Inject
	LifeService lifeService;
	@Inject
	RecentPostService recentPostService;
	
	@Value("${resourcesPath}")
	private String resourcesPath;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model
			,@RequestParam(required = false, defaultValue = "1") int skillsPage
			, @RequestParam(required = false, defaultValue = "1") int skillsRange) {
		logger.info("This is Home.", locale);
		int skillsListCnt;
		List<SkillVO> skillsList = new ArrayList<SkillVO>();
		List<RecentPostVO> recentPostList = new ArrayList<RecentPostVO>();
		Pagination pagination = new Pagination();
		try {
			skillsListCnt= skillsService.getSkillsListCnt();
			//Pagination 객체생성
			pagination.setListSize(8);
			pagination.setRangeSize(8);
			pagination.pageInfo(skillsPage, skillsRange, skillsListCnt);
			skillsList = skillsService.selectSkillsList(pagination);
			recentPostList = recentPostService.selectRecentPostList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("skillsList", skillsList );
		model.addAttribute("recentPostList", recentPostList );
		model.addAttribute("pagination",pagination);
		model.addAttribute("serverTime", formattedDate );
		
		return "home.page";
	}
	@RequestMapping(value = "/home/skillsList", method = RequestMethod.POST)
	public  @ResponseBody HashMap<String, Object> skillsListPOST(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		int skillsPage = Integer.parseInt(request.getParameter("page"));
		int skillsRange = Integer.parseInt(request.getParameter("range"));
		int skillsListCnt;
		List<SkillVO> skillsList = new ArrayList<SkillVO>();
		Pagination pagination = new Pagination();
		try {
			skillsListCnt= skillsService.getSkillsListCnt();
			//Pagination 객체생성
			pagination.setListSize(8);
			pagination.setRangeSize(8);
			pagination.pageInfo(skillsPage, skillsRange, skillsListCnt);
			skillsList = skillsService.selectSkillsList(pagination);
			result.put("responseCode", "success");
			result.put("data", skillsList );
			result.put("pagination",pagination);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("responseCode", "error");
		}
		
		return result;
	}
	@RequestMapping("/login")
	public String login(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login.page";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPost(UserVO vo, Model model,HttpSession session) {
		session.invalidate();
		return "redirect:/security_logout";
	}
	
	@RequestMapping(value = "/skills/writeSkills", method = RequestMethod.GET)
	public ModelAndView skillsWriteGet(Locale locale, Model model) {
		logger.info("This is writeSkills.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("skills/writeSkills.page");
		return mav;
	}
	
	@RequestMapping(value = "/skills/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> uploadSummernoteImageFile(MultipartHttpServletRequest mtfRequest) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String fileRoot = resourcesPath+"\\skills\\";	//저장될 외부 파일 경로
		MultipartFile multipartFile = mtfRequest.getFile("file");
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		System.out.println(savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			result.put("fileName", savedFileName);
			result.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			result.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/skills/writeSkills", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> skillsWritePost(HttpSession session, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"\\skills\\";
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		String contents = mtfRequest.getParameter("contents");
		String skillName = mtfRequest.getParameter("skillName");
		String summary = mtfRequest.getParameter("summary");
		SkillVO skillVO = new SkillVO();
		skillVO.setSkillName(new String(skillName.getBytes("8859_1"), "utf-8"));
		skillVO.setSummary(new String(summary.getBytes("8859_1"), "utf-8"));
		skillVO.setContents(new String(contents.getBytes("8859_1"), "utf-8"));
		String fileUploadTime = sdf.format(date);
		try {
			List<MultipartFile> mpf = mtfRequest.getFiles("skill_icon");
			for(int i = 0; i < mpf.size(); i++) {
				File file = new File(PATH + mpf.get(i).getOriginalFilename());
				fileFullName = mpf.get(i).getOriginalFilename();
				fileName = FilenameUtils.getBaseName(mpf.get(i).getOriginalFilename());
				if(!fileName.equals("")) {
					fileType = fileFullName.substring(fileFullName.lastIndexOf(".")+1, fileFullName.length());
					file = new File(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					skillVO.setSkillIcon(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
				}
				mpf.get(i).transferTo(file);
			}
			skillsService.createSkills(skillVO);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	
	@RequestMapping(value = "/skills/skillsDetail", method = RequestMethod.GET)
	public ModelAndView skillsDetail(Locale locale, Model model,
			@RequestParam(required = false, defaultValue = "1") int num) {
		SkillVO skillVO = new SkillVO();
		SkillVO skill = new SkillVO();
		skillVO.setNum(num);
		try {
			skill = skillsService.getSkillsDetail(skillVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("skill",skill);
		logger.info("This is Skill.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("skills/skillsDetail.page");
		return mav;
	}
	
	@RequestMapping(value = "/skills/editSkills", method = RequestMethod.GET)
	public ModelAndView skillsEdit(Locale locale, Model model,
			@RequestParam(required = false, defaultValue = "1") int num) {
		SkillVO skillVO = new SkillVO();
		SkillVO skill = new SkillVO();
		skillVO.setNum(num);
		try {
			skill = skillsService.getSkillsDetail(skillVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("skill",skill);
		logger.info("This is SkillEdit.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("skills/editSkills.page");
		return mav;
	}
	
	@RequestMapping(value = "/skills/editSkills", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> skillsEditPost(HttpSession session, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"\\skills\\";
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		String contents = mtfRequest.getParameter("contents");
		String skillName = mtfRequest.getParameter("skillName");
		String summary = mtfRequest.getParameter("summary");
		SkillVO skillVO = new SkillVO();
		skillVO.setNum(Integer.parseInt(mtfRequest.getParameter("num")));
		skillVO.setSkillName(new String(skillName.getBytes("8859_1"), "utf-8"));
		skillVO.setSummary(new String(summary.getBytes("8859_1"), "utf-8"));
		skillVO.setContents(new String(contents.getBytes("8859_1"), "utf-8"));
		String fileUploadTime = sdf.format(date);
		try {
			List<MultipartFile> mpf = mtfRequest.getFiles("skill_icon");
			for(int i = 0; i < mpf.size(); i++) {
				File file = new File(PATH + mpf.get(i).getOriginalFilename());
				fileFullName = mpf.get(i).getOriginalFilename();
				fileName = FilenameUtils.getBaseName(mpf.get(i).getOriginalFilename());
				if(!fileName.equals("")) {
					fileType = fileFullName.substring(fileFullName.lastIndexOf(".")+1, fileFullName.length());
					file = new File(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					skillVO.setSkillIcon(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
					mpf.get(i).transferTo(file);
				}
			}
			skillsService.editSkills(skillVO);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	@RequestMapping(value = "/skills/deleteSkills", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> deleteSkillsPost(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		int num;
		HashMap<String, Object> result = new HashMap<String, Object>();
		num = Integer.parseInt(request.getParameter("num"));
		if(!request.getParameter("num").equals("")) {
			try {
				skillsService.deleteSkills(num);
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
