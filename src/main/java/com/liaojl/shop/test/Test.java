package com.liaojl.shop.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.utils.DatabaseHelper;

/**
 * Servlet implementation class Test
 */
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int log = 0;
	private static final Logger logger = Logger.getLogger(DatabaseHelper.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		new DatabaseHelper();
		// TODO Auto-generated method stub
		Connection conn = DatabaseHelper.getConnection();
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = conn.prepareStatement("show tables");
			ResultSet result = preparedStatement.executeQuery();
			int i = 1;
			while (result.next()) {
				logger.info(String.valueOf(result.getObject(i)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error("查询有误", e);
		} finally {
			DatabaseHelper.closeConnection();
		}
		response.getWriter().append("Served at: " + log++).append(request.getContextPath());
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
