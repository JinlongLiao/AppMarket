<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* response.sendRedirect("./index.jsp");*/
	request.getRequestDispatcher(UrlEnum.INDEX.getUrl()).forward(request, response);
%>