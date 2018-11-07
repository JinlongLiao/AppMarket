package com.liaojl.shop.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.log4j.Logger;

/**
 * @author liaojl
 *
 */
public class DatabaseHelper {
	private static final Logger logger = Logger.getLogger(DatabaseHelper.class);

	private static final String DRIVER;
	private static final String URL;
	private static final String USERNAME;
	private static final String PASSWORD;
	// 三剑客
	static Connection con = null;// 连接对象
	static PreparedStatement pstmt = null;// 语句对象
	static ResultSet rs = null;// 结果集对象

	public static String getDriver() {
		return DRIVER;
	}

	public static String getUrl() {
		return URL;
	}

	public static String getUsername() {
		return USERNAME;
	}

	public static String getPassword() {
		return PASSWORD;
	}

	public static ThreadLocal<Connection> getConnectionHolder() {
		return CONNECTION_HOLDER;
	}

	public static BasicDataSource getDataSource() {
		return DATA_SOURCE;
	}

	// 保证一个线程一个Connection，线程安全
	private static final ThreadLocal<Connection> CONNECTION_HOLDER;
	// 线程池
	private static final BasicDataSource DATA_SOURCE;
	static {
		logger.info("DATABASE Is Initing>>>>>>>>>>>>>>>>>>>>>>>>>>");
		CONNECTION_HOLDER = new ThreadLocal<Connection>();

		Properties conf = PropsUtil.loadProps("dbconfig.properties");
		DRIVER = conf.getProperty("jdbc.driver");
		URL = conf.getProperty("jdbc.url");
		USERNAME = conf.getProperty("jdbc.username");
		PASSWORD = conf.getProperty("jdbc.password");

//		String driver = conf.getProperty("jdbc.driver");
//		String url = conf.getProperty("jdbc.url");
//		String username = conf.getProperty("jdbc.username");
//		String passwrod = conf.getProperty("jdbc.password");

		DATA_SOURCE = new BasicDataSource();
		DATA_SOURCE.setDriverClassName(DRIVER);
		DATA_SOURCE.setUrl(URL);
		DATA_SOURCE.setUsername(USERNAME);
		DATA_SOURCE.setPassword(PASSWORD);
		// 数据库连接池参数配置：http://www.cnblogs.com/xdp-gacl/p/4002804.html
		// http://greemranqq.iteye.com/blog/1969273
		// http://blog.csdn.net/j903829182/article/details/50190337
		// http://blog.csdn.net/jiutianhe/article/details/39670817
		// http://bsr1983.iteye.com/blog/2092467
		// http://blog.csdn.net/kerafan/article/details/50382998
		// http://blog.csdn.net/a9529lty/article/details/43021801
		/// 设置空闲和借用的连接的最大总数量，同时可以激活。
		DATA_SOURCE.setMaxTotal(60);
		// 设置初始大小
		DATA_SOURCE.setInitialSize(10);
		// 最小空闲连接
		DATA_SOURCE.setMinIdle(8);
		// 最大空闲连接
		DATA_SOURCE.setMaxIdle(16);
		// 超时等待时间毫秒
		DATA_SOURCE.setMaxWaitMillis(2 * 10000);
		// 只会发现当前连接失效，再创建一个连接供当前查询使用
		DATA_SOURCE.setTestOnBorrow(true);
		// removeAbandonedTimeout ：超过时间限制，回收没有用(废弃)的连接（默认为 300秒，调整为180）
		DATA_SOURCE.setRemoveAbandonedTimeout(180);
		// removeAbandoned ：超过removeAbandonedTimeout时间后，是否进
		// 行没用连接（废弃）的回收（默认为false，调整为true)
		// DATA_SOURCE.setRemoveAbandonedOnMaintenance(removeAbandonedOnMaintenance);
		DATA_SOURCE.setRemoveAbandonedOnBorrow(true);
		// testWhileIdle
		DATA_SOURCE.setTestOnReturn(true);
		// testOnReturn
		DATA_SOURCE.setTestOnReturn(true);
		// setRemoveAbandonedOnMaintenance
		DATA_SOURCE.setRemoveAbandonedOnMaintenance(true);
		// 记录日志
		DATA_SOURCE.setLogAbandoned(true);

		// 设置自动提交
		DATA_SOURCE.setDefaultAutoCommit(true);
		// DATA_SOURCE.setEnableAutoCommitOnReturn(true);
		logger.info("完成设置数据库连接池DATA_SOURCE的参数！！");
		/*
		 * try { Class.forName(DRIVER); logger.info("load jdbc driver success"); } catch
		 * (ClassNotFoundException e) { // LOGGER.error("can not load jdbc driver",e);
		 * logger.info("can not load jdbc driver:" + e); }finally{
		 * 
		 * }
		 */
	}
	// private static final ThreadLocal<Connection> CONNECTION_HOLDER = new
	// ThreadLocal<Connection>();

	/**
	 * 获取数据库连接
	 */
	public static Connection getConnection() {
		Connection conn = CONNECTION_HOLDER.get();// 1
		if (conn == null) {
			try {
				// conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				conn = DATA_SOURCE.getConnection();
				logger.info("get connection success");
			} catch (SQLException e) {
				// LOGGER.error("get connection failure", e);
				logger.error("get connection failure:" + e);
			} finally {

				logger.debug(" 最小空闲连接MinIdle=" + DATA_SOURCE.getMinIdle());
				logger.debug(" 最大空闲连接MaxIdle=" + DATA_SOURCE.getMaxIdle());
				logger.debug(" 最大连接数量MaxTotal=" + DATA_SOURCE.getMaxTotal());
				logger.debug(" 初始大小InitialSize=" + DATA_SOURCE.getInitialSize());
				logger.debug(" 超时等待时间MaxWaitMillis=" + (DATA_SOURCE.getMaxWaitMillis() / 1000));
				logger.debug(" 获取活动的连接数getNumActive()=" + DATA_SOURCE.getNumActive());
				logger.debug(" 获取连接数getNumIdle=" + DATA_SOURCE.getNumIdle());

				CONNECTION_HOLDER.set(conn);
			}
		}
		return conn;
	}

	/**
	 * 关闭数据库连接
	 */
	public static void closeConnection() {
		Connection conn = CONNECTION_HOLDER.get();// 1
		if (conn != null) {
			try {
				conn.close();
				logger.debug("close connection success");
			} catch (SQLException e) {
				// LOGGER.error("close connection failure", e);
				logger.error("close connection failure:" + e);
			} finally {
				CONNECTION_HOLDER.remove();
			}
		}
	}

	// 进行数据库操作
//	public static synchronized void update(int thlsh, String ltnr) {
//		Connection conn = getConnection();
//		if (conn == null) {
//			logger.info("update方法里面的()connection为null!!");
//		}
//		PreparedStatement pstmt = null;
//		logger.info("update开始!");
//		int ltlsh = 0;
//		try {
//			// String sql="update message set CONTENT = ? where id=?";
//			// String sql1="select ltlsh from t_zxthlsk where lsh = ?";
//			String sql = "update t_wx_ltnrk b set b.LTNR = ? where b.lsh = "
//					+ "( select a.ltlsh  from t_zxthlsk a where a.lsh = ? )";
//
//			logger.info("更新的sql语句为：sql->" + sql);
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setBlob(1, new ByteArrayInputStream(ltnr.getBytes()));
//			pstmt.setInt(2, thlsh);
//			/*
//			 * pstmt.setString(1, "this is dbcp2 test 2222"); pstmt.setInt(2, 6);
//			 */
//			if (pstmt.executeUpdate() > 0) {
//				// logger.info("更新id=1的数据成功!");
//				logger.info("更新thlsh=" + thlsh + "的聊天内容数据成功!\n聊天内容为：" + ltnr);
//			}
//			// conn.commit();
//
//			/*
//			 * while(rs1.next()){ ltlsh = rs1.getInt("ltlsh");
//			 * logger.info("查询聊天流水号成功，聊天流水号为ltlsh->"+ltlsh); }
//			 */
//
//			// pstmt.setString(1, "精彩内容update1");
//			// pstmt.setInt(2, 1);
//			// pstmt.setBlob(1, new ByteArrayInputStream("12345中国".getBytes()));
//			// pstmt.setInt(2, 76732);
//			/*
//			 * if(pstmt.executeUpdate()>0){ //logger.info("更新id=1的数据成功!");
//			 * logger.info("更新id=76732的数据成功!"); } conn.commit();
//			 */
//
//			logger.info("update t_wx_ltnrk success");
//		} catch (SQLException e) {
//			// LOGGER.error("query entity list failure", e);
//			logger.info("更新数据异常connection=" + conn);
//			logger.info("update t_wx_ltnrk failure:" + e);
//			throw new RuntimeException(e);
//		} finally {
//			// closeConnection();
//			// closeConnection();
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					logger.error("PreparedStatement失败", e);
//				}
//			}
//
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					logger.error("连接关闭失败", e);
//				}
//			}
//			// 移除线程里面的Connection，不移除会导致connection关闭以后，获取的connection是 关闭状态，不能进行数据操作
//			CONNECTION_HOLDER.remove();
//			// closeConnection();
//		}
//		// return entityList;
//	}
	public static List<Map<String, Object>> ResultSetToList(ResultSet rs) throws SQLException {
		List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
		ResultSetMetaData rsmd = rs.getMetaData();

		int colCount = rsmd.getColumnCount();
		List<String> colNameList = new ArrayList<String>();
		for (int i = 0; i < colCount; i++) {
			colNameList.add(rsmd.getColumnName(i + 1));
		}
		while (rs.next()) {
			for (int i = 0; i < colCount; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				String key = colNameList.get(i);
				Object value = rs.getString(colNameList.get(i));
				map.put(key, value);
				results.add(map);
			}
		}
		return results;
	}

	/**
	 * 执行更新
	 *
	 * @param sql    传入的预设的 sql语句
	 * @param params 问号参数列表
	 * @return 影响行数
	 * @throws SQLException
	 */
	public static int execUpdate(String sql, Object[] params) throws SQLException {
		try {
			pstmt = getConnection().prepareStatement(sql);// 获得预设语句对象

			if (params != null) {
				// 设置参数列表
				for (int i = 0; i < params.length; i++) {
					// 因为问号参数的索引是从1开始，所以是i+1，将所有值都转为字符串形式，好让setObject成功运行
					pstmt.setString(i + 1, params[i] + "");
				}
			}

			return pstmt.executeUpdate(); // 执行更新，并返回影响行数

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		} finally {
			closeConnection();
		}
	}

	/**
	 * 执行查询
	 *
	 * @param sql    传入的预设的 sql语句
	 * @param params 问号参数列表
	 * @return 查询后的结果
	 */
	public static List<Map<String, Object>> execQuery(String sql, Object[] params) {

		try {
			pstmt = getConnection().prepareStatement(sql);// 获得预设语句对象

			if (params != null) {
				// 设置参数列表
				for (int i = 0; i < params.length; i++) {
					// 因为问号参数的索引是从1开始，所以是i+1，将所有值都转为字符串形式，好让setObject成功运行
					pstmt.setObject(i + 1, params[i] + "");
				}
			}

			// 执行查询
			ResultSet rs = pstmt.executeQuery();

			List<Map<String, Object>> al = new ArrayList<Map<String, Object>>();

			// 获得结果集元数据（元数据就是描述数据的数据，比如把表的列类型列名等作为数据）
			ResultSetMetaData rsmd = rs.getMetaData();

			// 获得列的总数
			int columnCount = rsmd.getColumnCount();

			// 遍历结果集
			while (rs.next()) {
				Map<String, Object> hm = new HashMap<String, Object>();
				for (int i = 0; i < columnCount; i++) {
					// 根据列索引取得每一列的列名,索引从1开始
					String columnName = rsmd.getColumnName(i + 1);
					// 根据列名获得列值
					Object columnValue = rs.getObject(columnName);
					// 将列名作为key，列值作为值，放入 hm中，每个 hm相当于一条记录
					hm.put(columnName, columnValue);
				}
				// 将每个 hm添加到al中, al相当于是整个表，每个 hm是里面的一条记录
				al.add(hm);
			}

			return al;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error("", e);
		} finally {
			closeConnection();
		}
		return null;
	}

}