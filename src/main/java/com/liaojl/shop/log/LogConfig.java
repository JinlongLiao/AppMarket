package com.liaojl.shop.log;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Serializable;
import java.io.Writer;
import java.util.Properties;

import com.liaojl.shop.utils.FileMove;
import com.liaojl.shop.utils.ReadConfig;

public class LogConfig implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static boolean localname;
	public static boolean userlog;
	public static String homeurl;
	public static int  basesize;
	private static Properties properties;
	static {
		init();
	}

	private static void init() {
		// TODO Auto-generated method stub
		properties = ReadConfig.getPropertyByName("sysconf.properties");
		localname = Boolean.parseBoolean(properties.getProperty("localname"));
		userlog = Boolean.parseBoolean(properties.getProperty("userlog"));
		basesize = Integer.parseInt(properties.getProperty("basesize"));
		homeurl = (properties.getProperty("homeurl"));
	}

	private static void save() {
		// TODO Auto-generated method stub
		properties.setProperty("localname", String.valueOf(localname));
		properties.setProperty("userlog", String.valueOf(userlog));
		properties.setProperty("homeurl", String.valueOf(userlog));
		Writer writer = null;
		try {
			writer = new OutputStreamWriter(new FileOutputStream(FileMove.getRootPath()));
			properties.store(writer, "");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				writer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
