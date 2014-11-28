package com.study.dmhe.usermanage.web.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.FilterInvocation;

import com.study.dmhe.usermanage.entity.admin.Authority;
import com.study.dmhe.usermanage.entity.admin.Resource;
import com.study.dmhe.usermanage.service.ResourceService;

public class MyFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	
	@javax.annotation.Resource
	private ResourceService resourceService;
	
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		String requestUrl = ((FilterInvocation) object).getRequestUrl();
		if(resourceMap == null) {
			loadResourceDefine();
		}
		if(requestUrl.indexOf("?") > -1){
			requestUrl=requestUrl.substring(0,requestUrl.indexOf("?"));
		}
		Collection<ConfigAttribute> configAttributes = resourceMap.get(requestUrl);
		return configAttributes;
	}
	
	@PostConstruct
	private void loadResourceDefine() {
		if (resourceMap == null) {
			resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
			List<Resource> resources = resourceService.getAllResources();
			for (Resource resource : resources) {
				Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();
				if(resource.getAuthorities() != null && resource.getAuthorities().size() > 0) {
					for(Authority authority : resource.getAuthorities()) {
						ConfigAttribute configAttribute = new SecurityConfig(authority.getName());
						configAttributes.add(configAttribute);
					}
				}
				resourceMap.put(resource.getUrl(), configAttributes);
			}
		}
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

}
