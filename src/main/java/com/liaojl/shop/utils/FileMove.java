package com.liaojl.shop.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

public class FileMove {
	private static final Logger logger = Logger.getLogger(FileMove.class);
	private static final String PATH = "../../../../../../upload";

	public static void move(File file) {
		String parentPath = FileMove.class.getResource(PATH).getFile();
		logger.debug("上传路径=》" + parentPath);
		try {
			FileUtils.copyFileToDirectory(file, new File(parentPath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error("复制失败", e);
		}
	}

	public static String getPath() {
		return FileMove.class.getResource(PATH).getFile();
	}

	public static boolean IsExists(String name) {
		return new File(getPath() + name).exists();
	}
}
