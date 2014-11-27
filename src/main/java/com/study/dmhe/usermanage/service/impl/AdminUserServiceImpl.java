package com.study.dmhe.usermanage.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.study.dmhe.usermanage.dao.AdminUserDao;
import com.study.dmhe.usermanage.dao.RoleDao;
import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.entity.admin.Role;
import com.study.dmhe.usermanage.service.AdminUserService;
import com.study.dmhe.usermanage.util.Pagination;
import com.study.dmhe.usermanage.util.XDetachedCriteria;

@Service("adminUserService")
@Transactional
public class AdminUserServiceImpl implements AdminUserService {
	
	@Resource
	private AdminUserDao adminUserDao;
	
	@Resource
	private RoleDao roleDao;

	@Override
	public Pagination getAdminUser(String username, Boolean flag, Pagination page) {
		XDetachedCriteria criteria = new XDetachedCriteria(AdminUser.class, "m");
		if(StringUtils.hasLength(username)) {
			criteria.add(Restrictions.eq("m.username", username));
		}
		if(flag != null) {
			criteria.add(Restrictions.eq("m.flag", flag));
		}
		return adminUserDao.findByCriteriaAndPagination(criteria, page);
	}
	
	@Override
	public AdminUser saveAdminUser(AdminUser adminUser, Integer[] roleIds) {
		adminUser.setRoles(null);
		if(roleIds != null) {
			Set<Role> roleSet = new HashSet<Role>();
			for(Integer roleId : roleIds) {
				Role role = roleDao.get(roleId);
				roleSet.add(role);
			}
			adminUser.setRoles(roleSet);
		}
		return adminUserDao.save(adminUser);
	}

	@Override
	public AdminUser getAdminUserById(Integer id) {
		return adminUserDao.get(id);
	}

	@Override
	public AdminUser getAdminUserByUserName(String username) {
		return adminUserDao.findUniqueBy("username", username);
	}

}
