package com.study.dmhe.usermanage.service;

import java.util.List;

import com.study.dmhe.usermanage.entity.admin.Role;
import com.study.dmhe.usermanage.util.Pagination;

public interface RoleService {
	
	public Pagination getRoles(String name, Pagination page);
	
	public List<Role> getAllRoles();

}
