package com.liaojl.shop.servlet.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class SubNetInfo
 */
@WebServlet("/admin/subnetinfo")
public class SubNetInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubNetInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().write("{\"result\":false}");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json; charset=utf-8");
		String uid = request.getParameter("uid");
		if (StringUtil.isEmptyOrEmptyStr(uid)) {
			response.getWriter().write("{\"result\":false}");
			return;
		} else {
			List<Map<String, Object>> datas = DatabaseHelper.execQuery("SELECT * FROM TB_SUBNET WHERE GOODS_ID=?",
					new String[] { uid });
			response.getWriter().write("{\"result\":true,\"datas\":" + JSONObject.toJSONString(datas) + "}");
			return;
		}
	}

}
