package com.liaojl.shop.servlet.admin.config;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.liaojl.shop.utils.FileMove;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class IndexInfo
 */
@WebServlet("/admin/IndexInfo")
public class IndexInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(IndexInfo.class);
	public static List<String> infos = new ArrayList<>();
	private File file = new File(FileMove.getRootPath() + "info");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!file.exists()) {
			file.createNewFile();
		}
		request.setCharacterEncoding("UTF-8");// 设置请求的数据编码格式
		response.setCharacterEncoding("UTF-8");// 设置响应的编码格式
		String info = null;
		if (StringUtil.isNotEmpty(request.getParameter("info"))) {
			info = new String(request.getParameter("info").getBytes(), "UTF-8");
			StringTokenizer st = new StringTokenizer(info);
			FileWriter fw = new FileWriter(file);
			BufferedWriter bw = new BufferedWriter(fw);
			while (st.hasMoreElements()) {
				bw.write(st.nextToken());
				bw.newLine();
			}
			bw.flush();
			bw.close();
			fw.close();
		}
		// TODO Auto-generated method stub
		StringBuilder result = new StringBuilder();
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));// 构造一个BufferedReader类来读取文件
			String s = null;
			infos.clear();
			while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
				if (StringUtil.isNotEmpty(s) && !s.equals("\n")) {
					infos.add(s.trim());
					result.append(s + "\n");
				}
			}
			br.close();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		if (StringUtil.isEmptyOrEmptyStr(request.getParameter("edit"))) {

		}

		request.setAttribute("result", new String((result.toString()).getBytes(), "UTF-8"));
		request.getRequestDispatcher("/WEB-INF/admin/config/IndexInfo.jsp").forward(request, response);

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

	public String replaceBlank(String str) {
		String dest = "";
		if (StringUtil.isEmptyOrEmptyStr(str)) {
			Pattern p = Pattern.compile("\\s*" + "|\t|\r");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;
	}

}
