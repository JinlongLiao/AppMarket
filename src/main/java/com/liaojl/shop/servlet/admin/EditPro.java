package com.liaojl.shop.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.FileMove;
import com.liaojl.shop.utils.StringUtil;

/**
 * Servlet implementation class EditPro
 */
@WebServlet("/admin/editPro")
public class EditPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(EditPro.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPro() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String top = "TB_GOODS";
		String returnUrl = UrlEnum.PROIMGUPLOAD.getDesc();

		// TODO Auto-generated method stub
		if (StringUtil.isEmptyOrEmptyStr(request.getParameter("edit"))) {
			String id = request.getParameter("id");
			if (!StringUtil.isEmptyOrEmptyStr(request.getParameter("top"))) {
				request.setAttribute("top", "&top=true");
				returnUrl = UrlEnum.PRODUCT.getDesc();
			}
			top = StringUtil.isEmptyOrEmptyStr(request.getParameter("top")) ? "TB_GOODS" : "TB_GOODS_TOP";
			List<Map<String, Object>> lists = DatabaseHelper.execQuery("SELECT * FROM " + top + " WHERE GOODS_ID=?",
					new Object[] { id });
			if (lists.isEmpty()) {
				throw new RuntimeException("未检查到有效 产品信息");
			}
			request.setAttribute("user", lists.get(0));
			List<Map<String, Object>> types = DatabaseHelper.execQuery("SELECT * FROM TB_TYPE", null);
			request.setAttribute("types", types);
			request.getRequestDispatcher(UrlEnum.EDITPRO.getUrl()).forward(request, response);
		} else {
			if (!StringUtil.isEmptyOrEmptyStr(request.getParameter("top"))) {
				returnUrl = UrlEnum.PPTCONFIG.getDesc();
			}
			top = StringUtil.isEmptyOrEmptyStr(request.getParameter("top")) ? "TB_GOODS" : "TB_GOODS_TOP";
			String sql = "UPDATE " + top + " SET  "
					+ "GOODS_NAME=?, GOODS_TYPE=?, GOODS_MIN_PRICE=?, GOODS_MAX_PRICE=?, "
					+ "GOODS_DESC=?, GOODS_URL=?, GOODS_IMG=?" + " WHERE (GOODS_ID=?)";
			String pname = null, pdesc = null, pmax = null, pmin = null, purl = null, ptype = null, pid = null,
					pimg = null;

			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					// 1. 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
					DiskFileItemFactory factory = new DiskFileItemFactory();
					// logger.debug(System.getProperty("java.io.tmpdir"));//默认临时文件夹
					// 2. 创建ServletFileUpload对象，并设置上传文件的大小限制。
					ServletFileUpload sfu = new ServletFileUpload(factory);
					sfu.setSizeMax(10 * 1024 * 1024);// 以byte为单位 不能超过10M 1024byte =
					// 1kb 1024kb=1M 1024M = 1G
					sfu.setHeaderEncoding("utf-8");
					// 3.
					// 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
					List<FileItem> fileItemList = sfu.parseRequest(request);
					Iterator<FileItem> fileItems = fileItemList.iterator();
					// 4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
					while (fileItems.hasNext()) {
						FileItem fileItem = fileItems.next();
						// 普通表单元素
						if (fileItem.isFormField()) {
							String name = fileItem.getFieldName();// name属性值
							if (name.equals("pname")) {
								pname = fileItem.getString("utf-8");
							} else if (name.equals("pmax")) {
								pmax = fileItem.getString("utf-8");
							} else if (name.equals("pmin")) {
								pmin = fileItem.getString("utf-8");
							} else if (name.equals("pdesc")) {
								pdesc = fileItem.getString("utf-8");
							} else if (name.equals("purl")) {
								purl = fileItem.getString("utf-8");
							} else if (name.equals("ptype")) {
								ptype = fileItem.getString("utf-8");
							} else if (name.equals("pid")) {
								pid = fileItem.getString("utf-8");
							}
							String value = fileItem.getString("utf-8");// name对应的value值
							logger.debug(name + " = " + value);
						}
						// <input type="file">的上传文件的元素
						else {
							String fileName = fileItem.getName();// 文件名称
							logger.debug("原文件名：" + fileName);// Koala.jpg
							if (!StringUtil.isEmptyOrEmptyStr(fileName)) {
								String suffix = fileName.substring(fileName.lastIndexOf('.'));
								logger.debug("扩展名：" + suffix);// .jpg
								// 新文件名（唯一）
								String newFileName = new Date().getTime() + suffix;
								logger.debug("新文件名：" + newFileName);// image\1478509873038.jpg
								// 5. 调用FileItem的write()方法，写入文件
								File file = new File(newFileName);
								logger.debug("临时文件：" + file.getAbsolutePath());
								fileItem.write(file);
								if (StringUtil.isEmptyOrEmptyStr(request.getParameter("top"))) {
									FileMove.move2(file);
								} else {
									FileMove.move(file);
								}
								;
								file.delete();
								// 6. 调用FileItem的delete()方法，删除临时文件
								fileItem.delete();
								pimg = newFileName;
							}

							/*
							 * 存储到数据库时注意 1.保存源文件名称 Koala.jpg 2.保存相对路径 image/1478509873038.jpg
							 * 
							 */
						}
					}
				} catch (FileUploadException e) {
					logger.error(e.getMessage(), e);
				} catch (Exception e) {
					e.printStackTrace();
					logger.error(e.getMessage(), e);
				}
			}
			if (StringUtil.isEmptyOrEmptyStr(pimg)) {
				sql = "UPDATE " + top + " SET  " + "GOODS_NAME=?, GOODS_TYPE=?, GOODS_MIN_PRICE=?, GOODS_MAX_PRICE=?, "
						+ "GOODS_DESC=?, GOODS_URL=? WHERE (GOODS_ID=?)";
				try {
					DatabaseHelper.execUpdate(sql, new Object[] { pname, ptype, pmin, pmax, pdesc, purl, pid });
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.error("更新错误", e);
				}
				response.sendRedirect(request.getContextPath() + returnUrl);
				return;
			}
			try {
				DatabaseHelper.execUpdate(sql, new Object[] { pname, ptype, pmin, pmax, pdesc, purl, pimg, pid });
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.error("更新错误", e);
			}
			response.sendRedirect(request.getContextPath() + returnUrl);
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
