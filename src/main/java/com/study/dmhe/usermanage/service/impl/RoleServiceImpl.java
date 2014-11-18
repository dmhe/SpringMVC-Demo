package com.study.dmhe.usermanage.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.study.dmhe.usermanage.dao.ResourceDao;
import com.study.dmhe.usermanage.dao.RoleDao;
import com.study.dmhe.usermanage.entity.admin.Role;
import com.study.dmhe.usermanage.service.RoleService;
import com.study.dmhe.usermanage.util.Pagination;
import com.study.dmhe.usermanage.util.XDetachedCriteria;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleDao roleDao;
	
	@Resource
	private ResourceDao resourceDao;
	
	@Override
	public Pagination getRoles(String name, Pagination page) {
		XDetachedCriteria criteria = new XDetachedCriteria(Role.class, "m");
		if(StringUtils.hasLength(name)) {
			criteria.add(Restrictions.eq("m.name", name));
		}
		return roleDao.findByCriteriaAndPagination(criteria, page);
	}

	@Override
	public List<Role> getAllRoles() {
		return roleDao.getAll();
	}
	
	@Override
	public Role getRoleById(Integer id) {
		return roleDao.get(id);
	}

	@Override
	public Role saveRole(Role role, Integer[] resourceIds) {
		role.setResources(null);
		if(resourceIds != null) {
			Set<com.study.dmhe.usermanage.entity.admin.Resource> resourceSet = new HashSet<com.study.dmhe.usermanage.entity.admin.Resource>();
			for(Integer resourceId : resourceIds) {
				com.study.dmhe.usermanage.entity.admin.Resource resource = resourceDao.get(resourceId);
				resourceSet.add(resource);
			}
			role.setResources(resourceSet);
		}
		return roleDao.save(role);
	}

}
