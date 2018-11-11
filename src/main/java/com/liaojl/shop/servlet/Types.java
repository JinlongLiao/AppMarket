package com.liaojl.shop.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.log.LogConfig;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.FileMove;

/**
 * Servlet implementation class Types
 */
public class Types extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(Types.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Types() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String basePath = "http://" +  LogConfig.homeurl + ":" + request.getLocalPort() + request.getContextPath();

		List<Map<String, Object>> tops = DatabaseHelper.execQuery("SELECT * FROM VW_ALL_GOODS_TOP WHERE GOOS_STATU =1 ",
				null);
		List<Map<String, Object>> allGoods = DatabaseHelper.execQuery("SELECT * FROM VW_ALL_GOODS WHERE GOOS_STATU =1 ",
				null);
		for (Map<String, Object> map : tops) {
			if (!FileMove.IsExists(String.valueOf(map.get("GOODS_IMG")))) {
				map.replace("GOODS_IMG", "default.jpg");
			}
		}
		Map<String, List<Map<String, Object>>> goodsByType = new HashMap<>();
		for (Map<String, Object> map : allGoods) {
			List<Map<String, Object>> temp = ((List<Map<String, Object>>) goodsByType.getOrDefault(map.get("TYPE_ID"),
					new ArrayList<Map<String, Object>>()));
			temp.add(map);
			goodsByType.put(String.valueOf(map.get("TYPE_ID")), temp);
		}
		StringBuffer html = new StringBuffer();
		for (String key : goodsByType.keySet()) {
			html.append("<dl class='dl-sort'><dt><span title='" + TypeNameAndId.VALUEMAP.get(key) + "'>"
					+ TypeNameAndId.VALUEMAP.get(key) + "</dt>");

			List<Map<String, Object>> goods = goodsByType.get(key);
			for (Map<String, Object> map : goods) {
				html.append("<dd> <img onclick=\"doUrl('" + basePath + "/index/DoLog','" + map.get("GOODS_URL") + "','"
						+ map.get("GOODS_ID") + "')\" style='height: 100%' src='" + basePath + "/upload/"
						+ map.get("GOODS_IMG") + "'>" + "</img> <a title='" + map.get("GOODS_NAME")
						+ "' href=''><span><p>" + map.get("GOODS_NAME") + "</p>	<p>" + map.get("GOODS_MIN_PRICE") + "-"
						+ map.get("GOODS_MAX_PRICE") + "</p><p><span>" + map.get("GOODS_SEE")
						+ "</span>人申请</p></span></a></dd>");
			}
			html.append("</dl>");
		}
		request.setAttribute("tops", tops);
		request.setAttribute("goodsByType", html.toString());
		request.getRequestDispatcher(UrlEnum.TYPE.getUrl()).forward(request, response);
	}

}
