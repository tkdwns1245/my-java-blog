package com.ssj.myapp.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class CrossScriptingFilter extends OncePerRequestFilter{

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		 try {
			 if(request instanceof MultipartHttpServletRequest) {
	            filterChain.doFilter(new RequestWrapper((MultipartHttpServletRequest) request), response);
			 }else {
				 filterChain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
			 }
	        } catch (Exception e) {
	            response.sendError(900,"finded illegal word!");
	    }
	}


}
