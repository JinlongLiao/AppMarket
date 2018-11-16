package com.liaojl.shop.utils;

import java.util.Random;

/**
 * Created by jack on 2015/12/26. 字符串工具类
 */
public class StringUtil {
	/*
	 * 判断字符串是否为空
	 */
	public static boolean isEmpty(String str) {
		if (str != null) {
			str = str.trim();
		}
		// return StringUtils.isEmpty(str);
		return "".equals(str);
	}

	public static boolean isEmptyOrEmptyStr(String str) {
		str = String.valueOf(str).trim();
		return str.equals("") || str.equalsIgnoreCase("null");
	}

	/*
	 * 判断字符串是否非空
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmptyOrEmptyStr(str);
	}

	public static String getCode(int length) {
		StringBuffer sb = new StringBuffer();
		String codes = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		Random random = new Random();
		for (int i = 0; i < codes.length(); i++) {
			char c = codes.charAt(random.nextInt(codes.length()));
			System.out.println(c);
			if (sb.length() == length)
				break;
			if (!sb.toString().contains(c + ""))
				sb.append(c);
		}
		return sb.toString();
	}
}
