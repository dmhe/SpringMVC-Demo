package com.study.dmhe.usermanage.dao;

import org.springframework.stereotype.Repository;

import com.study.dmhe.usermanage.entity.admin.Resource;
import com.study.dmhe.usermanage.util.HibernateDao;

@Repository
public class ResourceDao extends HibernateDao<Resource, Integer> {

}
