package com.study.dmhe.usermanage.util;

import org.hibernate.Criteria;

public interface CriteriaExecuteCallBack {

	Object execute(Criteria criteria);

}
