package com.ssj.myapp.handler;


import java.io.IOException;
import java.util.Locale;

import javax.inject.Named;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.ssj.myapp.dao.UserDaoImpl;
import com.ssj.myapp.vo.UserDetailsDto;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	private final String DEFAULT_FAILURE_URL = "/login?error";
	
	@Named("messageSource") 
	private MessageSource messageSource;
	
	@Named("userDao")
	UserDaoImpl userDao;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());


	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String loginId = (String)request.getParameter("id");
		log.info("######### onAuthenticationFailure #########");
		
		String errormsg = exception.getMessage();
		
		if(exception instanceof BadCredentialsException) {
			// 잠긴계정인지 확인하여, errormsg변경해준다.
			boolean userUnLock = true;
			userUnLock = failCnt(loginId);
			if ( !userUnLock )
				errormsg = messageSource.getMessage("AccountStatusUserDetailsChecker.disabled", null , Locale.KOREA);
			else
				errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", null , Locale.KOREA);
		} else if(exception instanceof DisabledException) {
			errormsg = messageSource.getMessage("AccountStatusUserDetailsChecker.disabled", null , Locale.KOREA);
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = messageSource.getMessage("AccountStatusUserDetailsChecker.expired", null , Locale.KOREA);
		} else if(exception instanceof UsernameNotFoundException) {
			Object[] args = new String[] { loginId } ;
			errormsg = messageSource.getMessage("DigestAuthenticationFilter.usernameNotFound", args , Locale.KOREA);
		} else if(exception instanceof AccountExpiredException) {
			errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.expired", null , Locale.KOREA);
		} else if(exception instanceof LockedException) {
			errormsg = messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.locked", null , Locale.KOREA);
		} 
		
		request.setAttribute("errorMessage", errormsg);
		
		log.info(" exception.getMessage() : " + exception.getMessage() );
		
		request.getRequestDispatcher(DEFAULT_FAILURE_URL).forward(request, response);
	}
	
	private boolean failCnt(String loginId) {
		
		// 계정이 잠겼으면 추가로 실패횟수 증가시키지않고, true를 return한다.
		boolean userUnLock = true;

		// 실패횟수 select
		UserDetailsDto userDetailsDto = userDao.selectUser(loginId);
		userUnLock = userDetailsDto.isEnabled();

		// 계정이 활성화 되어있는 경우에만 실패횟수와, Enabled설정을 변경한다.
		// Enabled설정은 실패횟수가 5이상일 때 바뀐다.
		if ( userUnLock ) {
			if( userDetailsDto.getFAILCNT() < 5 )
				userDao.loginFailCnt(loginId);
			else
				userDao.changeEnabled(loginId);
		}
		return userUnLock;
	}

	public UserDaoImpl getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}

	public MessageSource getMessageSource() {
		return messageSource;
	}

	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}
	
	
	
}
