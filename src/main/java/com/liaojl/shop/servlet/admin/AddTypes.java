package com.liaojl.shop.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.utils.DatabaseHelper;

/**
 * Servlet implementation class TypesEdit
 */
@WebServlet("/admin/addTypes")
public class AddTypes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(AddTypes.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type_name");
		String json = "{\"result\":true,\"desc\":0}";
		String sql = "INSERT INTO TB_TYPE (TYPE_ID, TYPE_NAME) VALUES (?, ?)";
		try {
			DatabaseHelper.execUpdate(sql, new String[] { UUID.randomUUID().toString(), type });
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error("添加错误", e);
			json = "{\"result\":false,\"desc\":\"" + e.getMessage() + "\"}";
		}
		PrintWriter writer = response.getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
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
