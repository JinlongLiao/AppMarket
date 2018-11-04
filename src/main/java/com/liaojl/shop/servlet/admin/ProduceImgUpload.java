package com.liaojl.shop.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.liaojl.shop.url.UrlEnum;
import com.liaojl.shop.utils.DatabaseHelper;
import com.liaojl.shop.utils.FileMove;

/**
 * Servlet implementation class ProduceImgUpload
 */
@WebServlet("/admin/proupload")
public class ProduceImgUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(PptImgUpload.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProduceImgUpload() {
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
		PreparedStatement pre = null;
		// 判断上传表单是否为multipart/form-data类型
		HttpSession session = request.getSession();
		// User user = (User) session.getAttribute("user"); // 在登录时将 User 对象放入了 会话
		// 中
		Connection con = DatabaseHelper.getConnection();
		try {
			pre = con.prepareStatement(
					"INSERT INTO TB_GOODS (GOODS_ID, GOODS_NAME, GOODS_TYPE, GOODS_MIN_PRICE, GOODS_MAX_PRICE, GOODS_DESC, GOODS_URL, GOODS_IMG) VALUES (?,?,?,?,?,?,?,?)");
			pre.setString(1, UUID.randomUUID().toString());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			logger.error("", e1);
		}
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
							pre.setString(2, fileItem.getString("utf-8"));
						} else if (name.equals("pdesc")) {
							pre.setString(6, fileItem.getString("utf-8"));
						} else if (name.equals("pmax")) {
							pre.setString(5, fileItem.getString("utf-8"));
						} else if (name.equals("pmin")) {
							pre.setString(4, fileItem.getString("utf-8"));
						} else if (name.equals("purl")) {
							pre.setString(7, fileItem.getString("utf-8"));
						} else if (name.equals("ptype")) {
							pre.setString(3, fileItem.getString("utf-8"));
						}
						String value = fileItem.getString("utf-8");// name对应的value值
						logger.debug(name + " = " + value);
					}
					// <input type="file">的上传文件的元素
					else {
						String fileName = fileItem.getName();// 文件名称
						logger.debug("原文件名：" + fileName);// Koala.jpg
						String suffix = fileName.substring(fileName.lastIndexOf('.'));
						logger.debug("扩展名：" + suffix);// .jpg
						// 新文件名（唯一）
						String newFileName = new Date().getTime() + suffix;
						logger.debug("新文件名：" + newFileName);// image\1478509873038.jpg
						// 5. 调用FileItem的write()方法，写入文件
						File file = new File(newFileName);
						logger.debug("临时文件：" + file.getAbsolutePath());
						fileItem.write(file);
						FileMove.move(file);
						file.delete();
						// 6. 调用FileItem的delete()方法，删除临时文件
						fileItem.delete();
						pre.setString(8, newFileName);
						/*
						 * 存储到数据库时注意 1.保存源文件名称 Koala.jpg 2.保存相对路径 image/1478509873038.jpg
						 * 
						 */
						response.sendRedirect(request.getContextPath() + UrlEnum.PROIMGUPLOAD.getDesc());

					}
				}
			} catch (FileUploadException e) {
				logger.error(e);
			} catch (Exception e) {
				logger.error(e);
			}
		}
		try {
			pre.execute();
			DatabaseHelper.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error(e);
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
