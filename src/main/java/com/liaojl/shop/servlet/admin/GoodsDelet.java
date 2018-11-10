package com.liaojl.shop.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.servlet.AdminServlet;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class GoodsDelet
 */
@WebServlet("/admin/delete")
public class GoodsDelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(GoodsDelet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoodsDelet() {
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
		String tableName = "TB_GOODS";

		String returnUrl = UrlEnum.PRODUCT.getDesc();
		if (!StringUtil.isEmptyOrEmptyStr(request.getParameter("top"))) {
			tableName = "TB_GOODS_TOP";
			returnUrl = UrlEnum.PPTCONFIG.getDesc();
		}
		String id = request.getParameter("id");
		if (StringUtil.isEmptyOrEmptyStr(id)) {
			throw new RuntimeException("未检查到有效 产品信息");
		}
		try {
			if (StringUtil.isEmptyOrEmptyStr(request.getParameter("edit"))) {
				DatabaseHelper.execUpdate("DELETE FROM " + tableName + " WHERE GOODS_ID=?", new String[] { id });
			} else {

				DatabaseHelper.execUpdate("UPDATE  " + tableName + " SET GOOS_STATU=" + request.getParameter("status")
						+ " WHERE GOODS_ID=?", new String[] { id });
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(), e);
		}
//		request.setAttribute("scritp", "<script>alert('删除成功')</script>");
		response.sendRedirect(request.getContextPath() + returnUrl);
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
