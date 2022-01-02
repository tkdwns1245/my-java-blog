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

public final class RequestWrapper extends HttpServletRequestWrapper {
	
	private Map<String, String[]> parameterMap = null;
	
	public RequestWrapper(HttpServletRequest servletRequest) {
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
    	  if (cleanXSS(values[i])) {
    		  continue;
          }else {
          	throw new BadParameterException("find illegal word : " + values[i]);
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
            	throw new BadParameterException("find illegal word : " + values[i]);
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
            	throw new BadParameterException("find illegal word : " + values[i]);
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
                	throw new BadParameterException("find illegal word : " + parameterMap.get(key)[i]);
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
        	  throw new BadParameterException("find illegal word : " + value);
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
        	throw new BadParameterException("find illegal word : " + value);
        }
    }
 
    private Boolean cleanXSS(String value) {
    	Whitelist myReportEnabledWhitelist = new MyReportEnabledWhitelist();
    	
    	// ** Basic whitelist (from Jsoup)
    	myReportEnabledWhitelist.addTags("div","a", "b", "blockquote", "br", "cite", "code", "dd", "dl", "dt", "em", "i", "li", "ol", "p", "pre", "q", "small", "span",
                    "strike", "strong", "sub", "sup", "u", "ul","img","h1","h2","h3","h4","h5") //

        .addAttributes("a", "href") //
        .addAttributes("blockquote", "cite") //
        .addAttributes("q", "cite") //
        .addAttributes("img", "align", "alt", "height", "src", "title", "width","style")
        .addAttributes(":all","style")
        .addAttributes(":all","src")
        .addProtocols("img", "src", "http", "https")
        .addProtocols("a", "href", "ftp", "http", "https", "mailto") //
        .addProtocols("blockquote", "cite", "http", "https") //
        .addProtocols("cite", "cite", "http", "https") //

        .addEnforcedAttribute("a", "rel", "nofollow") //

        // ** Customizations
        .addTags("body") //
        .addProtocols("a", "href", "tel", "device") //
        .removeProtocols("img", "src", "http", "https")
    	.removeProtocols("a", "href", "ftp", "http", "https", "mailto");

                //You'll need to remove the spaces from the html entities below
    	return  Jsoup.isValid(value, myReportEnabledWhitelist);
    }
}
