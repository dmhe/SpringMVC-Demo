package com.study.dmhe.usermanage.dao;

import org.springframework.stereotype.Repository;

import com.study.dmhe.usermanage.entity.admin.AdminUser;
import com.study.dmhe.usermanage.util.HibernateDao;

@Repository
public class AdminUserDao extends HibernateDao<AdminUser, Integer> {

}
