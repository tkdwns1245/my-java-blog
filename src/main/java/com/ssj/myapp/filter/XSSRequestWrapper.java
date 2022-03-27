package com.ssj.myapp.filter;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import com.ssj.myapp.exception.BadParameterException;
import com.ssj.myapp.util.MyReportEnabledWhitelist;
import java.util.regex.Pattern;

public final class XSSRequestWrapper extends HttpServletRequestWrapper {
	
	private Map<String, String[]> parameterMap = null;
	
	public XSSRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
        parameterMap = new HashMap<String, String[]> (servletRequest.getParameterMap());
    }
 
    public String[] getParameterValues(String parameter){
 
      String[] values = super.getParameterValues(parameter);
      if (values==null)  {
                  return null;
          }
      int count = values.length;
      for (int i = 0; i < count; i++) {
    	  values[i] = cleanXSS(values[i]);
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
        	values[i] = cleanXSS(values[i]); 
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
        	values[i] = cleanXSS(values[i]);
         }
        return values;
      }
    
    public Map<String,String[]> getParameterMap(){
    	Map<String,String[]> parameterMap = this.parameterMap;
    	Iterator<String> keys = parameterMap.keySet().iterator();
    	while( keys.hasNext() ){
            String key = keys.next();
            String[] tmpString = parameterMap.get(key);
            int count = tmpString.length;
            
            for (int i = 0; i < count; i++) {
        	tmpString[i] = cleanXSS(tmpString[i]);
            }
        }
    	return parameterMap;
    }
 
    public String getParameter(String parameter) {
          String value = super.getParameter(parameter);
          
          return cleanXSS(value);
    }
 
    public String getHeader(String name) {
        String value = super.getHeader(name);
        
        return cleanXSS(value);
    }
 
    private String cleanXSS(String value) {
    	if (value != null) {
            // NOTE: It's highly recommended to use the ESAPI library and uncomment the following line to
            // avoid encoded attacks.
            // value = ESAPI.encoder().canonicalize(value);

            // Avoid null characters
            value = value.replaceAll("", "");

            // Avoid anything between script tags
            Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid anything in a src='...' type of expression
            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Remove any lonesome </script> tag
            scriptPattern = Pattern.compile("</script>", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Remove any lonesome <script ...> tag
            scriptPattern = Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid eval(...) expressions
            scriptPattern = Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid expression(...) expressions
            scriptPattern = Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid javascript:... expressions
            scriptPattern = Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid vbscript:... expressions
            scriptPattern = Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid onload= expressions
            scriptPattern = Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");
        }
        return value;
    }
}
