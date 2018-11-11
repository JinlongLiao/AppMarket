package com.liaojl.shop.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class DoLog
 */
@WebServlet("/index/DoLog")
public class DoLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DoLog.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoLog() {
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
		String table = "TB_GOODS";
		String id = request.getParameter("goodid");
		String top = request.getParameter("top");
		if (StringUtil.isNotEmpty(top)) {
			table = "TB_GOODS_TOP";
		}
		String sql = "UPDATE  " + table + "  SET GOODS_SEE=GOODS_SEE+1 WHERE GOODS_ID=?;";
		if (StringUtil.isNotEmpty(id)) {
			try {
				DatabaseHelper.execUpdate(sql, new String[] { id });
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(), e);
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
