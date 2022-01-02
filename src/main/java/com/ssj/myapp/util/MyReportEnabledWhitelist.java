package com.ssj.myapp.util;

import java.util.HashSet;
import java.util.Set;

import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ssj.myapp.HomeController;

public class MyReportEnabledWhitelist extends Whitelist {

    private Set<String> alreadyCheckedAttributeSignatures = new HashSet<String>();
    private static final Logger logger = LoggerFactory.getLogger(MyReportEnabledWhitelist.class);
    @Override
    protected boolean isSafeTag(String tag) {
        boolean isSafe = super.isSafeTag(tag);

        if (!isSafe) {
        	logger.error("Disallowed tag: " + tag);
        }

        return isSafe;
    }

    @Override
    protected boolean isSafeAttribute(String tagName, Element el, Attribute attr) {
        boolean isSafe = super.isSafeAttribute(tagName, el, attr);

        String signature = el.hashCode() + "-" + attr.hashCode();
        if (alreadyCheckedAttributeSignatures.contains(signature) == false) {
            alreadyCheckedAttributeSignatures.add(signature);

            if (!isSafe) {
            	logger.error("Wrong attribute: " + attr.getKey() + " (" + attr.html() + ") in " + el.outerHtml());
            }
        }

        return isSafe;
    }
}