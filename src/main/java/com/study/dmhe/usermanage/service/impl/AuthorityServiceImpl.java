package com.study.dmhe.usermanage.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.study.dmhe.usermanage.dao.AuthorityDao;
import com.study.dmhe.usermanage.dao.ResourceDao;
import com.study.dmhe.usermanage.entity.admin.Authority;
import com.study.dmhe.usermanage.service.AuthorityService;
import com.study.dmhe.usermanage.util.Pagination;
import com.study.dmhe.usermanage.util.XDetachedCriteria;

@Service("authorityService")
@Transactional
public class AuthorityServiceImpl implements AuthorityService {

	@Resource
	private AuthorityDao authorityDao;
	
	@Resource
	private ResourceDao resourceDao;
	
	@Override
	public Pagination getAuthorities(String name, Pagination page) {
		XDetachedCriteria criteria = new XDetachedCriteria(Authority.class, "m");
		if(StringUtils.hasLength(name)) {
			criteria.add(Restrictions.eq("m.name", name));
		}
		return authorityDao.findByCriteriaAndPagination(criteria, page);
	}

	@Override
	public List<Authority> getAllAuthorities() {
		return authorityDao.getAll();
	}
	
	@Override
	public Authority getAuthorityById(Integer id) {
		return authorityDao.get(id);
	}

	@Override
	public Authority saveAuthority(Authority authority, Integer[] resourceIds) {
		authority.setResources(null);
		if(resourceIds != null) {
			Set<com.study.dmhe.usermanage.entity.admin.Resource> resourceSet = new HashSet<com.study.dmhe.usermanage.entity.admin.Resource>();
			for(Integer resourceId : resourceIds) {
				com.study.dmhe.usermanage.entity.admin.Resource resource = resourceDao.get(resourceId);
				resourceSet.add(resource);
			}
			authority.setResources(resourceSet);
		}
		return authorityDao.save(authority);
	}

}
