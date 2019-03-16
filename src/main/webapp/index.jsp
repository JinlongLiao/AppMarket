<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + LogConfig.homeurl ;
	String reqString = (request.getRequestURL().toString());
	if (reqString.contains("jrqba.xyz")) {
		session.setAttribute("sysname", "聚睿钱包");
	} else {
		session.setAttribute("sysname", "聚睿钱包2");
	}
	response.sendRedirect(basePath + UrlEnum.INDEX.getUrl());
%>