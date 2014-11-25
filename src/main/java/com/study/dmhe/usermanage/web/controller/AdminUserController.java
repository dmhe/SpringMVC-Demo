package com.study.dmhe.usermanage.web.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.entity.admin.Authority;
import com.study.dmhe.usermanage.entity.admin.Role;
import com.study.dmhe.usermanage.enums.ResourceType;
import com.study.dmhe.usermanage.service.AdminUserService;
import com.study.dmhe.usermanage.service.AuthorityService;
import com.study.dmhe.usermanage.service.ResourceService;
import com.study.dmhe.usermanage.service.RoleService;
import com.study.dmhe.usermanage.util.Pagination;

@Controller
@RequestMapping("admin/admin")
public class AdminUserController {
	
	@Resource
	private AdminUserService adminUserService;
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private AuthorityService authorityService;
	
	@Resource
	private ResourceService resourceService;
	
	@RequestMapping(value="/getAdminUsers")
	public String getAdminUsers(String username, Boolean flag, Integer pageNo, ModelMap model) {
		Pagination pagination = new Pagination(10);
		if(pageNo != null) {
			pagination.setPageNo(pageNo);
		}
		pagination = adminUserService.getAdminUser(username, flag, pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("username", username==null?"":username);
		model.addAttribute("flag", flag==null?false:flag);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("subMenu", "adminUserManage");
		model.addAttribute("mainMenu", "adminManage");
		model.addAttribute("allRoles", roleService.getAllRoles());
		return "/admin/admin/adminUserManage";
	}
	
	@RequestMapping(value="/saveAdminUser")
	public String saveAdminUser(@ModelAttribute AdminUser adminUser, Integer[] roleIds, ModelMap model) {
		try {
			adminUser.setCreateTime(new Date());
			adminUser.setFlag(true);
			adminUserService.saveAdminUser(adminUser, roleIds);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getAdminUsers(null, null, null, model);
	}
	
	@RequestMapping(value="/toEditAdminUser")
	public String toEditAdminUser(Integer id, ModelMap model) {
		AdminUser adminUser = adminUserService.getAdminUserById(id);
		model.addAttribute("editedAdminUser", adminUser);
		return this.getAdminUsers(null, null, null, model);
	}
	
	@RequestMapping(value="/editAdminUser")
	public String editAdminUser(@ModelAttribute AdminUser adminUser, Integer[] roleIds, ModelMap model) {
		try {
			AdminUser adminUserTemp = adminUserService.getAdminUserById(adminUser.getId());
			adminUserTemp.setUsername(adminUser.getUsername());
			adminUserTemp.setFlag(adminUser.getFlag());
			adminUserService.saveAdminUser(adminUserTemp, roleIds);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getAdminUsers(null, null, null, model);
	}
	
	@RequestMapping(value="/getRoles")
	public String getRoles(String name, Integer pageNo, ModelMap model) {
		Pagination pagination = new Pagination(10);
		if(pageNo != null) {
			pagination.setPageNo(pageNo);
		}
		pagination = roleService.getRoles(name, pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("name", name==null?"":name);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("subMenu", "roleManage");
		model.addAttribute("mainMenu", "adminManage");
		model.addAttribute("allAuthorities", authorityService.getAllAuthorities());
		return "/admin/admin/roleManage";
	}
	
	@RequestMapping(value="/saveRole")
	public String saveRole(@ModelAttribute Role role, Integer[] authorityIds, ModelMap model) {
		try {
			roleService.saveRole(role, authorityIds);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getRoles(null, null,model);
	}
	
	@RequestMapping(value="/toEditRole")
	public String toEditRole(Integer id, ModelMap model) {
		Role role = roleService.getRoleById(id);
		model.addAttribute("editedRole", role);
		return this.getRoles(null, null, model);
	}
	
	@RequestMapping(value="/editRole")
	public String editRole(@ModelAttribute Role role, Integer[] authorityIds, ModelMap model) {
		try {
			Role roleTemp = roleService.getRoleById(role.getId());
			roleTemp.setName(role.getName());
			roleService.saveRole(roleTemp, authorityIds);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getRoles(null, null, model);
	}
	
	@RequestMapping(value="/getAuthorities")
	public String getAuthorities(String name, Integer pageNo, ModelMap model) {
		Pagination pagination = new Pagination(10);
		if(pageNo != null) {
			pagination.setPageNo(pageNo);
		}
		pagination = authorityService.getAuthorities(name, pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("name", name==null?"":name);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("subMenu", "authorityManage");
		model.addAttribute("mainMenu", "adminManage");
		return "/admin/admin/authorityManage";
	}
	
	@RequestMapping(value="/saveAuthority")
	public String saveAuthority(@ModelAttribute Authority authority, Integer[] resourceIds, ModelMap model) {
		try {
			authorityService.saveAuthority(authority, resourceIds);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getAuthorities(null, null,model);
	}
	
	@RequestMapping(value="/toGrantResources")
	public String toGrantResources(Integer id, Integer pageNo, ModelMap model) {
		Authority authority = authorityService.getAuthorityById(id);
		Pagination pagination = new Pagination(10);
		if(pageNo != null) {
			pagination.setPageNo(pageNo);
		}
		pagination = resourceService.getResources(null, null, pagination);
		model.addAttribute("grantedAuthority", authority);
		model.addAttribute("pagination", pagination);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("subMenu", "authorityManage");
		model.addAttribute("mainMenu", "adminManage");
		return "/admin/admin/toGrantResources";
	}
	
	@RequestMapping(value="/getResources")
	public String getResources(String name, ResourceType type, Integer pageNo, ModelMap model) {
		Pagination pagination = new Pagination(10);
		if(pageNo != null) {
			pagination.setPageNo(pageNo);
		}
		pagination = resourceService.getResources(name, type, pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("name", name==null?"":name);
		model.addAttribute("type", type==null?"":type);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("subMenu", "resourceManage");
		model.addAttribute("mainMenu", "adminManage");
		model.addAttribute("resourceTypes", ResourceType.values());
		return "/admin/admin/resourceManage";
	}
	
	@RequestMapping(value="/saveResource")
	public String saveResource(@ModelAttribute com.study.dmhe.usermanage.entity.admin.Resource resource, ModelMap model) {
		try {
			resourceService.saveResource(resource);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getResources(null, null, null, model);
	}
	
	@RequestMapping(value="/toEditResource")
	public String toEditResource(Integer id, ModelMap model) {
		com.study.dmhe.usermanage.entity.admin.Resource resource = resourceService.getResourceById(id);
		model.addAttribute("editedResource", resource);
		return this.getResources(null, null, null, model);
	}
	
}
