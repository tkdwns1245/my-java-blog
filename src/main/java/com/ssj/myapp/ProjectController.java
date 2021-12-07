package com.ssj.myapp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ssj.myapp.service.ProjectService;
import com.ssj.myapp.vo.ProjectVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	@Value("${resourcesPath}")
	private String resourcesPath;
	@Inject
	ProjectService projectService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public ModelAndView project(Locale locale, Model model) {
		logger.info("This is Project.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("project/project.page");
		categoriesMav.addObject("title","project");
		return categoriesMav;
	}
	@RequestMapping(value = "/project/write", method = RequestMethod.GET)
	public ModelAndView projectWriteGet(Locale locale, Model model) {
		logger.info("This is Project.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/write.page");
		return mav;
	}
	@RequestMapping(value = "/project/write", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> projectWritePost(HttpSession session, MultipartHttpServletRequest mtfRequest) {
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date date = new Date();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String PATH = resourcesPath+"\\project\\";
		String fileName = "";
		String fileFullName = "";
		String fileType = "";
		ProjectVO pvo = new ProjectVO();
		pvo.setProjectName(mtfRequest.getParameter("project_name"));
		pvo.setIntroduce(mtfRequest.getParameter("introduce"));
		pvo.setMembers(Integer.parseInt(mtfRequest.getParameter("members")));
		pvo.setSkills(parsingSkillsList(mtfRequest.getParameterValues("skills[]")));
		pvo.setFromDate(java.sql.Date.valueOf(mtfRequest.getParameter("from")));
		pvo.setToDate(java.sql.Date.valueOf(mtfRequest.getParameter("to")));
		pvo.setContents(mtfRequest.getParameter("contents"));
		String fileUploadTime = sdf.format(date);
		try {
			List<MultipartFile> mpf = mtfRequest.getFiles("project_img");
			for(int i = 0; i < mpf.size(); i++) {
				File file = new File(PATH + mpf.get(i).getOriginalFilename());
				fileFullName = mpf.get(i).getOriginalFilename();
				fileName = FilenameUtils.getBaseName(mpf.get(i).getOriginalFilename());
				if(!fileName.equals("")) {
					fileType = fileFullName.substring(fileFullName.lastIndexOf(".")+1, fileFullName.length());
					file = new File(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					pvo.setProjectImg(fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("---------------File Upload Start -------------");
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("---------------File Upload End ---------------");
				}
				mpf.get(i).transferTo(file);
			}
			projectService.createProject(pvo);
			result.put("result", "SUCCESS");
			} catch(Exception e) {
				e.printStackTrace();
				result.put("result", "ERROR");
			}
			
			return result;
	}
	@RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public HashMap<String, Object> uploadSummernoteImageFile(MultipartHttpServletRequest mtfRequest) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String fileRoot = resourcesPath+"\\project\\";	//저장될 외부 파일 경로
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
	
	public String parsingSkillsList(String[] skills) {
		String parsedString ="";
		int count = 0;
		for(String skill : skills) {
			if(count == 0) {
				parsedString = skill;
			}else if(count != skills.length-1) {
				parsedString += ","+skill;
			}
			count++;
		}
		return parsedString;
	}
}
