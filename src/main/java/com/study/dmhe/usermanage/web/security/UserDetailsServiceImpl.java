package com.study.dmhe.usermanage.web.security;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.service.AdminUserService;

@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Resource
	private AdminUserService adminUserService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AdminUser adminUser = adminUserService.getAdminUserByUserName(username);
		if(adminUser == null) {
			throw new UsernameNotFoundException("用户" + username + " 不存在");
		}
		return adminUser;
	}

}
