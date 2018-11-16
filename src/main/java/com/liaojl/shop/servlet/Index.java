package com.liaojl.shop.servlet;

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

public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Index() {
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
		
		System.out.println(request.getContextPath());
		List<Map<String, Object>> tops = DatabaseHelper.execQuery("SELECT * FROM VW_ALL_GOODS_TOP WHERE GOOS_STATU =1 ",
				null);
		List<Map<String, Object>> goods = DatabaseHelper
				.execQuery("SELECT * FROM VW_ALL_GOODS WHERE GOOS_STATU =1 ORDER BY GOODS_INDEX ", null);
		for (Map<String, Object> map : tops) {
			if (!FileMove.IsExists(String.valueOf(map.get("GOODS_IMG")))) {
				map.replace("GOODS_IMG", "default.jpg");
			}
		}
		for (Map<String, Object> map : goods) {
			if (!FileMove.IsExists(String.valueOf(map.get("GOODS_IMG")))) {
				map.replace("GOODS_IMG", "default.jpg");
			}
		}
		request.setAttribute("tops", tops);
		request.setAttribute("goods", goods);
		request.getRequestDispatcher(UrlEnum.USERMAIN.getUrl()).forward(request, response);
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
