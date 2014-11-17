package com.study.dmhe.usermanage.service.impl;

import javax.annotation.Resource;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.study.dmhe.usermanage.dao.AdminUserDao;
import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.service.AdminUserService;
import com.study.dmhe.usermanage.util.Pagination;
import com.study.dmhe.usermanage.util.XDetachedCriteria;

@Service("adminUserService")
@Transactional
public class AdminUserServiceImpl implements AdminUserService {
	
	@Resource
	private AdminUserDao adminUserDao;

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
	public AdminUser saveAdminUser(AdminUser adminUser) {
		return adminUserDao.save(adminUser);
	}

	@Override
	public AdminUser getAdminUserById(Integer id) {
		return adminUserDao.get(id);
	}

}
