package com.ssj.myapp;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AboutController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView about(Locale locale, Model model) {
		logger.info("This is About.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("about/about.page");
		categoriesMav.addObject("title","about");
		return categoriesMav;
	}
}
