package com.liaojl.shop.utils;

import java.io.File;

import org.apache.log4j.Logger;

public class FileMove {
	private static final Logger logger = Logger.getLogger(FileMove.class);
	private static final String PATH = "../../../../../../upload";

	public static String move(File file) {
		String parentPath = FileMove.class.getResource(PATH).getFile();
		logger.debug("上传路径=》" + parentPath);
		ImageUtils.scale2(file, parentPath + file.getName(), 400, 250, false);
//			FileUtils.copyFileToDirectory(file, new File(parentPath));
		return file.getName();
	}

	public static String move2(File file) {
		String parentPath = FileMove.class.getResource(PATH).getFile();
		logger.debug("上传路径=》" + parentPath);
		ImageUtils.scale2(file, parentPath + file.getName(), 400, 400, true);
//			FileUtils.copyFileToDirectory(file, new File(parentPath));
		return file.getName();
	}

	public static String getPath() {
		return FileMove.class.getResource(PATH).getFile();
	}

	public static boolean IsExists(String name) {
		return new File(getPath() + name).exists();
	}
}
