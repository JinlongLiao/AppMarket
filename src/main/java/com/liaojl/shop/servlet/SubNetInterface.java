package com.liaojl.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class SubNetInterface
 */
@WebServlet("/index/s")
public class SubNetInterface extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UserSession.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubNetInterface() {
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
		String uid = request.getParameter("u");
		if (StringUtil.isEmptyOrEmptyStr(uid)) {
			response.getWriter().write("{\"error\":false}");
			return;
		}

		List<Map<String, Object>> goods = DatabaseHelper.execQuery(
				"SELECT GOOS_STATU,GOODS_ID,GOODS_URL FROM VW_ALL_SUBNET WHERE NET_ID=?", new String[] { uid });
		if (goods != null && !goods.isEmpty()) {
			Map<String, Object> map = goods.get(0);
			if (String.valueOf(map.get("GOOS_STATU")).equals("1")) {
				String gid = String.valueOf(map.get("GOODS_ID"));
				try {
					DatabaseHelper.execUpdate("UPDATE TB_SUBNET SET NET_SEE=NET_SEE+1 WHERE NET_ID=?",
							new String[] { uid });
					DatabaseHelper.execUpdate("UPDATE TB_GOODS SET GOODS_SEE=GOODS_SEE+1 WHERE GOODS_ID=?",
							new String[] { gid });
					DatabaseHelper.execUpdate("UPDATE TB_GOODS_TOP SET GOODS_SEE=GOODS_SEE+1 WHERE GOODS_ID=?",
							new String[] { gid });

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.error(e.getMessage(), e);
				}
				response.sendRedirect(String.valueOf(map.get("GOODS_URL")));
			} else {
				response.getWriter().write("{\"error\":\"产品无效\"}");
				return;
			}
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
