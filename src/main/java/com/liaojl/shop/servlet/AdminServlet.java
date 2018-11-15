package com.liaojl.shop.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.servlet.admin.PptImgUpload;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.FileMove;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(AdminServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
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
		String sql = "SELECT * FROM VW_ALL_GOODS_TOP";
		List<Map<String, Object>> results = DatabaseHelper.execQuery(sql, null);
		for (Map<String, Object> map : results) {
			if (!FileMove.IsExists(String.valueOf(map.get("GOODS_IMG")))) {
				map.replace("GOODS_IMG", "default.jpg");
			}
		}
		String sql2 = "SELECT * FROM VW_ALL_GOODS";
		List<Map<String, Object>> results2 = DatabaseHelper.execQuery(sql2, null);
		for (Map<String, Object> map : results2) {
			if (!FileMove.IsExists(String.valueOf(map.get("GOODS_IMG")))) {
				map.replace("GOODS_IMG", "default.gif");
			}
		}
//		results2.addAll(results);
		request.setAttribute("results", results2);

		request.setAttribute("types", results);
		if (StringUtil.isEmptyOrEmptyStr(request.getParameter("is_login"))) {
			request.getRequestDispatcher(UrlEnum.ADMINMAIN.getUrl()).forward(request, response);
		} else {
			request.getRequestDispatcher(UrlEnum.ADMINMAIN.getUrl()).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
