package com.ssj.myapp;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssj.myapp.service.SkillsService;
import com.ssj.myapp.service.WorkService;
import com.ssj.myapp.vo.Pagination;
import com.ssj.myapp.vo.SkillVO;
import com.ssj.myapp.vo.WorkVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ResumeController {
	@Inject
	SkillsService skillsService;
	@Inject
	WorkService workService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public String home(Locale locale, Model model
			,@RequestParam(required = false, defaultValue = "1") int skillsPage
			, @RequestParam(required = false, defaultValue = "1") int skillsRange) {
		logger.info("This is Resume.", locale);
		int skillsListCnt;
		List<SkillVO> skillsList = new ArrayList<SkillVO>();
		List<WorkVO> workList = new ArrayList<WorkVO>();
		
		Pagination pagination = new Pagination();
		try {
			skillsListCnt= skillsService.getSkillsListCnt();
			//Pagination 객체생성
			pagination.setListSize(8);
			pagination.setRangeSize(8);
			pagination.pageInfo(skillsPage, skillsRange, skillsListCnt);
			skillsList = skillsService.selectSkillsList(pagination);
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			workList = workService.selectWorkList();
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("skillsList", skillsList );
		model.addAttribute("workList", workList );
		model.addAttribute("pagination",pagination);
		return "/resume/resume.page";
	}
	
}
