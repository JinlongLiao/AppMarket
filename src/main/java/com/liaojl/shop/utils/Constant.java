package com.liaojl.shop.utils;

public enum Constant {
	SESSION("USER", ""),URL("", ""),SEE("SEE","");

	Constant(String name, Object object) {
		this.name = name;
		this.object = object;
	}

	private String name;
	private Object object;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}
}
