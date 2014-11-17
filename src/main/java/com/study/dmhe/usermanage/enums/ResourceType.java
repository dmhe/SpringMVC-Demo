package com.study.dmhe.usermanage.enums;

public enum ResourceType {
	
	CATALOG("目录"),
	
	URL("地址");
	
	private final String typeName;
	
	private ResourceType(String typeName) {
		this.typeName = typeName;
	}
	
	public String getTypeName() {
		return this.typeName;
	}

}
