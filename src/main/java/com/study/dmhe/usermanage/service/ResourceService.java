package com.study.dmhe.usermanage.service;

import com.study.dmhe.usermanage.enums.ResourceType;
import com.study.dmhe.usermanage.util.Pagination;

public interface ResourceService {
	
	public Pagination getResources(String name, ResourceType type, Pagination page);

}
