package com.liaojl.shop.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

public class ReadConfig {
	private static final Logger logger = Logger.getLogger(ReadConfig.class);

	public static Properties getPropertyByName(String configName) {
		Properties properties = new Properties();
		try {
			properties.load(new FileInputStream(FileMove.getRootPath() + File.separator + configName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(), e);
		}
		return properties;

	}
}
