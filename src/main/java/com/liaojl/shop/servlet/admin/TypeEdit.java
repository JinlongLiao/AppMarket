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

import com.liaojl.shop.servlet.TypeNameAndId;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class TypeEdit
 */
@WebServlet("/admin/typedit")
public class TypeEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(TypeEdit.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TypeEdit() {
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
		String tableName = "TB_TYPE";

		String returnUrl = UrlEnum.TYPES.getDesc();
		String[] ids = request.getParameterValues("id");
		String id = request.getParameter("id");
		String edit = request.getParameter("edit");
		if (StringUtil.isEmptyOrEmptyStr(id)) {
			throw new RuntimeException("未检查到有效 产品信息");
		}

		if (StringUtil.isEmptyOrEmptyStr(edit)) {
//			删除
			List<Map<String, Object>> results = DatabaseHelper
					.execQuery("SELECT COUNT(1) count FROM VW_BOTH_GOODS WHERE TYPE_ID=?", new String[] { id });
			if (Integer.parseInt(results.get(0).get("count").toString()) > 0) {
//				存在内容绑定
				request.setAttribute("scritp", "<script>alert('存在产品归属与此类型，不允许删除！')</script>");
				request.getRequestDispatcher(returnUrl).forward(request, response);
				return;
			} else {
				request.setAttribute("scritp", "<script>alert('删除成功！');</script>");
				try {
					DatabaseHelper.execUpdate("DELETE FROM " + tableName + " WHERE TYPE_ID=?", new String[] { id });
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.error(e.getMessage(), e);
				}
				request.getRequestDispatcher(returnUrl).forward(request, response);
				return;
			}

		} else {
//			修改
			String typeName = request.getParameter("typename");
			try {
				DatabaseHelper.execUpdate("UPDATE " + tableName + " SET TYPE_NAME=? WHERE TYPE_ID=?",
						new String[] { String.valueOf(typeName), id });
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(), e);
			}
			TypeNameAndId.Reinit();
			response.getWriter().write("{\"result\":true}");
			return;
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
