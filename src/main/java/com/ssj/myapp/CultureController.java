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
public class CultureController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/culture", method = RequestMethod.GET)
	public ModelAndView culture(Locale locale, Model model) {
		logger.info("This is Culture.", locale);
		ModelAndView categoriesMav = new ModelAndView();
		categoriesMav.setViewName("culture/culture.page");
		categoriesMav.addObject("title","culture");
		return categoriesMav;
	}
}
