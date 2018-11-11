<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" +  LogConfig.homeurl + ":" + request.getLocalPort()
			+ request.getContextPath();
	response.sendRedirect(basePath + UrlEnum.INDEX.getUrl());
%>