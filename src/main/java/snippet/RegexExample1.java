package snippet;

import java.util.regex.*;

class RegexExample1 {
	private static final String REGEX_URL = "^((http|https|HTTP|HTTPS|TCP|tcp)://)(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,5})?(/[a-zA-Z0-9\\&%_\\./-~-]*)?$";
	private static final String REGEX_PATH = "^[a-zA-Z]:(\\\\([a-zA-Z0-9_ ()-]+))+$|^(\\/([a-zA-Z0-9_ ()-]+))+$";
	private static final String REGEX_FILE = "^[a-zA-Z0-9_ ()-]+\\.[a-zA-Z0-9_]{1,16}$";

	public static void main(String args[]) {

		String content = "http://bbbbbbb.com";
		String regex = ".*((?:(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d)))\\.){3}(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d))))";
		regex = (REGEX_URL + "|" + REGEX_PATH + "|" + REGEX_FILE);
		System.out.println(regex);
		Pattern pat = Pattern.compile(regex);

		boolean bMatched = pat.matcher(content).matches();
		System.out.println("字符串中是否包含了 'runoob' 子字符串? " + bMatched);
	}
}