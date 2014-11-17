package com.study.dmhe.usermanage.service.impl;

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

}
