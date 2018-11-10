package com.liaojl.shop.servlet.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.FileMove;

/**
 * Servlet implementation class PptConfig
 */
public class PptConfig extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PptConfig() {
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
		List<Map<String, Object>> types = DatabaseHelper.execQuery("SELECT * FROM TB_TYPE", null);
		request.setAttribute("types", types);
		request.setAttribute("results", results);
		request.getRequestDispatcher(UrlEnum.PPTCONFIG.getUrl()).forward(request, response);
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
