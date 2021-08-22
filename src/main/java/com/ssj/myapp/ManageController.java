package com.ssj.myapp;

import java.util.Locale;

import javax.inject.Inject;
import javax.inject.Named;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssj.myapp.service.CategoryService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public ModelAndView manage(Locale locale, Model model) {
		logger.info("This is Mange.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("manage/manage.page");
		categoriesMav.addObject("title","manage");
		return categoriesMav;
	}
	@RequestMapping(value = "/manage/register/{manageType}", method = RequestMethod.GET)
	public ModelAndView boardReg(@PathVariable("manageType") String manageType,Locale locale, Model model) {
		logger.info("This is register "+ manageType, locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("manage/"+ manageType +"/"+manageType+"_reg.page");
		categoriesMav.addObject("title",manageType + " register");
		return categoriesMav;
	}
}
