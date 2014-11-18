package com.study.dmhe.usermanage.service;

import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.util.Pagination;

public interface AdminUserService {
	
	public Pagination getAdminUser(String username, Boolean flag, Pagination page);

	public AdminUser saveAdminUser(AdminUser adminUser, Integer[] roleIds);
	
	public AdminUser getAdminUserById(Integer id);

}
