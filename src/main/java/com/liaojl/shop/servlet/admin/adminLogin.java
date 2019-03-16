package com.liaojl.shop.servlet.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liaojl.shop.log.LogConfig;
import com.liaojl.shop.model.Admin;
import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.Constant;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.MD5Utils;
import com.liaojl.shop.utils.MapCache;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/admin/login")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MapCache<String, Integer> illegalCache = new MapCache(1000, 60 * 30);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminLogin() {
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
		String ip = request.getRemoteHost();
		int iptmp = (illegalCache.get(ip) == null) ? 1 : illegalCache.get(ip) + 1;
		illegalCache.cache(ip, iptmp);
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		Integer iptimes = illegalCache.get(ip);
		if (iptimes != null && iptimes > 60) {
			request.setAttribute("msg", "<script>alert('此IP “" + ip + "”访问短时间内过于频繁！')</script>");
			request.getRequestDispatcher(UrlEnum.ADMIN.getUrl()).forward(request, response);
			return;
		}

		if (StringUtil.isNotEmpty(name) || StringUtil.isNotEmpty(pwd)) {
			Integer times = illegalCache.get(name);
			if (times != null && times >= 3) {
				request.setAttribute("msg", "<script>alert('登录失败次数超过3次,半小时后重试')</script>");
				request.getRequestDispatcher(UrlEnum.ADMIN.getUrl()).forward(request, response);
				return;
			}
			List<Map<String, Object>> lists = DatabaseHelper.execQuery(
					"SELECT * FROM TB_ADMIN  WHERE ADMIN_NAME=? AND ADMIN_PASS=?",
					new String[] { name, MD5Utils.byteArrayToHexString(pwd.getBytes()) });
			if (lists != null && lists.isEmpty()) {
				int tmp = (illegalCache.get(name) == null) ? 1 : illegalCache.get(name) + 1;
				illegalCache.cache(name, tmp);
				request.setAttribute("msg", "<script>alert('登录失败检查用户名密码是否正确')</script>");
				request.getRequestDispatcher(UrlEnum.ADMIN.getUrl()).forward(request, response);
			} else {
				Admin admin = new Admin(name, pwd, new Timestamp(System.currentTimeMillis()), request.getRemoteHost());
				admin.setId(lists.get(0).get("ADMIN_ID"));
				request.getSession().setAttribute(Constant.SESSION.getName(), admin);
//				request.getRequestDispatcher(UrlEnum.ADMINMAIN.getDesc()).forward(request, response);
				response.sendRedirect("http://" + LogConfig.homeurl + UrlEnum.ADMIN.getDesc());
				return;
			}

			request.setAttribute("msg", "<script>alert('登录失败检查用户名密码是否正确')</script>");
			request.getRequestDispatcher(UrlEnum.ADMIN.getUrl()).forward(request, response);
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
