package com.study.dmhe.usermanage.web.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.entity.admin.Role;
import com.study.dmhe.usermanage.enums.ResourceType;
import com.study.dmhe.usermanage.service.AdminUserService;
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
		return "/admin/admin/roleManage";
	}
	
	@RequestMapping(value="/saveRole")
	public String saveRole(@ModelAttribute Role role, Integer[] resourceIds, ModelMap model) {
		try {
			roleService.saveRole(role, resourceIds);
			model.addAttribute("success", true);
			model.addAttribute("message", "保存成功！");
		} catch(Exception e) {
			model.addAttribute("success", false);
			model.addAttribute("message", "保存失败！");
		}
		return this.getRoles(null, null,model);
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

}
