package com.liaojl.shop.servlet.admin.config;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.model.Admin;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.Constant;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.MD5Utils;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class ServerConfig
 */
@WebServlet("/admin/serverconfig")
public class ServerConfig extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServerConfig() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final Logger logger = Logger.getLogger(ServerConfig.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pwd = request.getParameter("pwd");
		String msString = "修改成功请重新登录";
		if (!StringUtil.isEmptyOrEmptyStr(pwd)) {
			Admin admin = (Admin) request.getSession().getAttribute(Constant.SESSION.getName());
			try {
				DatabaseHelper.execUpdate("UPDATE TB_ADMIN SET ADMIN_PASS=? WHERE ADMIN_ID=? ;",
						new String[] { MD5Utils.byteArrayToHexString(pwd.getBytes()), admin.id });
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(), e);
				msString = "修改失败，请重新登录重试";
			}
			request.setAttribute("msg", msString);
			request.getRequestDispatcher(UrlEnum.ADMIN.getUrl()).forward(request, response);

		}
		request.getRequestDispatcher("/WEB-INF/admin/config/adminMain.jsp").forward(request, response);

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
