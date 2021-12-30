package com.ssj.myapp.filter;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public final class RequestWrapper extends HttpServletRequestWrapper {
	
	private Map<String, String[]> parameterMap = null;
	
	public RequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
        parameterMap = new HashMap<String, String[]> (servletRequest.getParameterMap());
    }
 
    public String[] getParameterValues(String parameter) {
 
      String[] values = super.getParameterValues(parameter);
      if (values==null)  {
                  return null;
          }
      int count = values.length;
      for (int i = 0; i < count; i++) {
    	  if (cleanXSS(values[i])) {
    		  continue;
          }else {
          	throw new RuntimeException();
          }
       }
      return values;
    }
    
    public String[] getParts(String parameter) {
    	 
        String[] values = super.getParameterValues(parameter);
        if (values==null)  {
                    return null;
            }
        int count = values.length;
        for (int i = 0; i < count; i++) {
      	  if (cleanXSS(values[i])) {
      		  continue;
            }else {
            	throw new RuntimeException();
            }
         }
        return values;
      }
    
    public String[] getPart(String parameter) {
   	 
        String[] values = super.getParameterValues(parameter);
        if (values==null)  {
                    return null;
            }
        int count = values.length;
        for (int i = 0; i < count; i++) {
      	  if (cleanXSS(values[i])) {
      		  continue;
            }else {
            	throw new RuntimeException();
            }
         }
        return values;
      }
    
    public Map<String,String[]> getParameterMap(){
    	Map<String,String[]> parameterMap = this.parameterMap;
    	Iterator<String> keys = parameterMap.keySet().iterator();
    	while( keys.hasNext() ){
            String key = keys.next();
            int count = parameterMap.get(key).length;
            for (int i = 0; i < count; i++) {
          	  if (cleanXSS(parameterMap.get(key)[i])) {
          		  continue;
                }else {
                	throw new RuntimeException();
                }
             }
        }
    	return parameterMap;
    }
 
    public String getParameter(String parameter) {
          String value = super.getParameter(parameter);
          if (value==null)  {
              return null;
          }
          if (cleanXSS(value)) {
              return value;
          }else {
          	throw new RuntimeException();
          }
    }
 
    public String getHeader(String name) {
        String value = super.getHeader(name);
        if (value==null)  {
            return null;
        }
        if (cleanXSS(value)) {
            return value;
        }else {
        	throw new RuntimeException();
        }
    }
 
    private Boolean cleanXSS(String value) {
                //You'll need to remove the spaces from the html entities below
    	String safe_value = Jsoup.clean(value, Whitelist.basic());
		if(safe_value == null) {
			return false;
		}else {
			return true;
		}
    }
}
