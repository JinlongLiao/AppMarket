package com.liaojl.shop.servlet.admin;

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

import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class DoSort
 */
@WebServlet("/admin/dosort")
public class DoSort extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DoSort.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoSort() {
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
		String id = request.getParameter("id");
		if (StringUtil.isEmptyOrEmptyStr(id)) {
			throw new RuntimeException("未检测到有效的 产品信息");
		}
		Boolean gotos = null;
		try {
			gotos = Boolean.valueOf(request.getParameter("go"));
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("排序方向转换错误", e);
			response.sendRedirect(UrlEnum.PRODUCT.getDesc());
		} // 获取当前的产品总数
		List<Map<String, Object>> counts = (DatabaseHelper.execQuery("SELECT COUNT(1) count FROM TB_GOODS", null));
		Object count = counts.get(0).get("count");
		int result = 0;
		try {
			if (gotos) {
				result = DatabaseHelper.execUpdate(
						"UPDATE TB_GOODS SET GOODS_INDEX=GOODS_INDEX-1 WHERE GOODS_INDEX>0 AND GOODS_ID=?",
						new Object[] { id });
				if (result > 0) {
					Object index = DatabaseHelper
							.execQuery("SELECT GOODS_INDEX  FROM TB_GOODS WHERE GOODS_ID=?", new String[] { id }).get(0)
							.get("GOODS_INDEX");
					DatabaseHelper.execUpdate(
							"UPDATE TB_GOODS SET GOODS_INDEX=GOODS_INDEX+1 WHERE GOODS_INDEX =? AND GOODS_ID !=?",
							new Object[] { index, id });
				}
			} else {
				result = DatabaseHelper.execUpdate(
						"UPDATE TB_GOODS SET GOODS_INDEX=GOODS_INDEX+1 WHERE GOODS_INDEX<? AND GOODS_ID=?",
						new Object[] { count, id });
				if (result > 0) {
					Object index = DatabaseHelper
							.execQuery("SELECT GOODS_INDEX  FROM TB_GOODS WHERE GOODS_ID=?", new String[] { id }).get(0)
							.get("GOODS_INDEX");
					DatabaseHelper.execUpdate(
							"UPDATE TB_GOODS SET GOODS_INDEX=GOODS_INDEX-1 WHERE GOODS_INDEX =? AND GOODS_ID !=?",
							new Object[] { index, id });
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error("排序错误" + e.getMessage(), e);
		}
		response.sendRedirect(request.getContextPath() + UrlEnum.PRODUCT.getDesc());
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
