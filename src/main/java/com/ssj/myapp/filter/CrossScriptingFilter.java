package com.ssj.myapp.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ssj.myapp.exception.BadParameterException;

public class CrossScriptingFilter extends OncePerRequestFilter{
	private static final Logger logger = LoggerFactory.getLogger(CrossScriptingFilter.class);
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		 try {
			 if(request instanceof MultipartHttpServletRequest) {
	            filterChain.doFilter(new XSSRequestWrapper((MultipartHttpServletRequest) request), response);
			 }else {
				 filterChain.doFilter(new XSSRequestWrapper((HttpServletRequest) request), response);
			 }
	        }catch(BadParameterException e) {
        		logger.error("BadParameterException",e);
	        	response.sendError(900,"finded illegal word!");
	        }catch (Exception e) {
	        	logger.error("exception",e);
	            response.sendError(900,"finded illegal word!");
	        }
	}


}
