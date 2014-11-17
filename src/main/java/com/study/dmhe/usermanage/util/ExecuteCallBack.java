package com.study.dmhe.usermanage.util;

import org.hibernate.Session;

public interface ExecuteCallBack {

	Object execute(Session session);
}
