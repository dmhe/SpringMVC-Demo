package com.study.dmhe.usermanage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.study.dmhe.usermanage.dao.ResourceDao;
import com.study.dmhe.usermanage.enums.ResourceType;
import com.study.dmhe.usermanage.service.ResourceService;
import com.study.dmhe.usermanage.util.Pagination;
import com.study.dmhe.usermanage.util.XDetachedCriteria;

@Service("resourceService")
@Transactional
public class ResourceServiceImpl implements ResourceService {

	@Resource
	private ResourceDao resourceDao;
	
	@Override
	public Pagination getResources(String name, ResourceType type, Pagination page) {
		XDetachedCriteria criteria = new XDetachedCriteria(com.study.dmhe.usermanage.entity.admin.Resource.class, "m");
		if(StringUtils.hasLength(name)) {
			criteria.add(Restrictions.eq("m.name", name));
		}
		if(type != null) {
			criteria.add(Restrictions.eq("m.type", type));
		}
		return resourceDao.findByCriteriaAndPagination(criteria, page);
	}

	@Override
	public List<com.study.dmhe.usermanage.entity.admin.Resource> getAllResources() {
		return resourceDao.getAll();
	}
	
	@Override
	public com.study.dmhe.usermanage.entity.admin.Resource getResourceById(Integer id) {
		return resourceDao.get(id);
	}

	@Override
	public com.study.dmhe.usermanage.entity.admin.Resource saveResource(com.study.dmhe.usermanage.entity.admin.Resource resource) {
		return resourceDao.save(resource);
	}

}
