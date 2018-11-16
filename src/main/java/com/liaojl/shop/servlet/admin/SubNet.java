package com.liaojl.shop.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.liaojl.shop.log.LogConfig;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * Servlet implementation class SubNet
 */
@WebServlet("/admin/subnet")
public class SubNet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DatabaseHelper.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubNet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String json = null;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		// TODO Auto-generated method stub
		if (!StringUtil.isEmptyOrEmptyStr(request.getParameter("search"))) {
			List<Map<String, Object>> suburls = DatabaseHelper.execQuery(
					"SELECT NET_URL FROM TB_SUBNET WHERE GOODS_ID=?", new String[] { request.getParameter("gid") });
			json = JSONObject.toJSON(suburls).toString();
			response.setContentType("application/json; charset=utf-8");
			json = "{\"result\":true,\"datas\":" + json + "}";
			response.getWriter().write(json);

			return;
		}

		if (!StringUtil.isEmptyOrEmptyStr(request.getParameter("subnet"))) {
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("gid");
//			获取URL
			List<Map<String, Object>> srcUrlMap = DatabaseHelper.execQuery(
					"SELECT GOODS_ID,GOODS_NAME FROM VW_BOTH_GOODS WHERE GOODS_ID=? AND GOOS_STATU=?",
					new Object[] { id, 1 });
			if (srcUrlMap == null || srcUrlMap.isEmpty()) {
				json = "{\"result\":false,\"datas\":[\"GOODS_ID\":\"输入产品信息有误 \" }";
				response.getWriter().write(json);
				return;
			} else {
				String gid = String.valueOf(srcUrlMap.get(0).get("GOODS_ID"));
				String gName = String.valueOf(srcUrlMap.get(0).get("GOODS_NAME"));
				String basePath = "http://" + LogConfig.homeurl + ":" + request.getLocalPort()
						+ request.getContextPath() + "/";
				Connection conn = DatabaseHelper.getConnection();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				try {
					conn.setAutoCommit(false);
					PreparedStatement ps = conn.prepareStatement(
							"INSERT INTO TB_SUBNET (NET_ID, NET_URL, GOODS_ID,NET_NAME) VALUES (?, ?, ?,?)");
					for (int i = 0; i < num; i++) {
						String uid = StringUtil.getCode(5);
						ps.setString(1, uid);
						ps.setString(2, basePath + UrlEnum.SUBNETREG.getUrl() + "?uid=" + uid);
						ps.setString(3, gid);

						ps.setString(4, gName + "_" + sdf.format(new Date()) + i);
						ps.addBatch();
						if ((num % 1000) == 0) {
							ps.executeBatch();
							conn.commit();
						}
					}
					ps.executeBatch();
					conn.commit();
				} catch (SQLException e) {
					logger.error(e.getMessage(), e);
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						logger.error(e1.getMessage(), e1);
					}
				} finally {
					DatabaseHelper.closeConnection();
				}
			}

			List<Map<String, Object>> suburls = DatabaseHelper
					.execQuery("SELECT NET_URL FROM TB_SUBNET WHERE GOODS_ID=?", new String[] { id });
			json = JSONObject.toJSON(suburls).toString();
			// 这些设置必须要放在getWriter的方法之前，
			json = "{\"result\":true,\"datas\":" + json + "}";
			response.getWriter().write(json);

			return;
		}

		List<Map<String, Object>> results = DatabaseHelper
				.execQuery("SELECT GOODS_ID,GOODS_NAME FROM  VW_BOTH_GOODS WHERE GOOS_STATU=? ", new Object[] { 1 });
		request.setAttribute("results", results);
		request.getRequestDispatcher(UrlEnum.SUBNET.getUrl()).forward(request, response);
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
