package com.study.dmhe.usermanage.service;

import java.util.List;

import com.study.dmhe.usermanage.entity.admin.Resource;
import com.study.dmhe.usermanage.enums.ResourceType;
import com.study.dmhe.usermanage.util.Pagination;

public interface ResourceService {
	
	public Pagination getResources(String name, ResourceType type, Pagination page);
	
	public List<Resource> getAllResources();
	
	public Resource getResourceById(Integer id);
	
	public Resource saveResource(Resource resource);

}
