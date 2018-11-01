package com.liaojl.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.liaojl.shop.utils.Constant;
import com.liaojl.shop.utils.DatabaseHelper;

/**
 * Servlet Filter implementation class UserSession
 */
public final class UserSession implements Filter {
	private static final Logger logger = Logger.getLogger(UserSession.class);

	/**
	 * Default constructor.
	 */
	public UserSession() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		logger.debug("用户会话检测");
		// TODO Auto-generated method stub
		// place your code here
		Connection conn = DatabaseHelper.getConnection();

		String user = (String) ((HttpServletRequest) request).getSession().getAttribute(Constant.SEE.getName());
		if (!Constant.SEE.getName().equalsIgnoreCase(user)) {
			try {
				((HttpServletRequest) request).getSession().setAttribute(Constant.SEE.getName(),
						Constant.SEE.getName());
				Statement state = conn.createStatement();
				state.execute("UPDATE TB_SEE SET SEE_SIZE=SEE_SIZE+1;");
			} catch (Exception e) {
				logger.error("用户检测登陆失败", e);
			} finally {
				DatabaseHelper.closeConnection();
			}
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
