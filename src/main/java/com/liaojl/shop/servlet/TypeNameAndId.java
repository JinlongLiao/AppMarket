package com.liaojl.shop.servlet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.liaojl.shop.utils.DatabaseHelper;
import com.sun.org.apache.xml.internal.security.Init;

public class TypeNameAndId {
	public static Map<String, String> VALUEMAP = new HashMap<>();
	public static Map<String, String> MAPVALUE = new HashMap<>();
	static {
		Init();
	}

	public static void Init() {
		List<Map<String, Object>> results = DatabaseHelper.execQuery("SELECT * FROM TB_TYPE", null);
		for (Map<String, Object> map : results) {
			VALUEMAP.put(String.valueOf(map.get("TYPE_ID")), String.valueOf(map.get("TYPE_NAME")));
			MAPVALUE.put(String.valueOf(map.get("TYPE_NAME")), String.valueOf(map.get("TYPE_ID")));
		}
	}

	public static void Reinit() {
		VALUEMAP.clear();
		MAPVALUE.clear();
		Init();
	}
}
