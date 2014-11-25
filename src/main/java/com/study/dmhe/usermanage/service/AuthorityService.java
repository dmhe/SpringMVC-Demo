package com.study.dmhe.usermanage.service;

import java.util.List;

import com.study.dmhe.usermanage.entity.admin.Authority;
import com.study.dmhe.usermanage.util.Pagination;

public interface AuthorityService {
	
	public Pagination getAuthorities(String name, Pagination page);
	
	public List<Authority> getAllAuthorities();
	
	public Authority getAuthorityById(Integer id);
	
	public Authority saveAuthority(Authority authority, Integer[] resourceIds);

}
