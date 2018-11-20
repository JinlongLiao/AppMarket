package snippet;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

class RegexExample1 {
	private static final String REGEX_URL = "^((http|https|HTTP|HTTPS|TCP|tcp)://)(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,5})?(/[a-zA-Z0-9\\&%_\\./-~-]*)?$";
	private static final String REGEX_PATH = "^[a-zA-Z]:(\\\\([a-zA-Z0-9_ ()-]+))+$|^(\\/([a-zA-Z0-9_ ()-]+))+$";
	private static final String REGEX_FILE = "^[a-zA-Z0-9_ ()-]+\\.[a-zA-Z0-9_]{1,16}$";

	public static void main(String args[]) {

//		String content = "http://bbbbbbb.com";
		String content = "id=tos time=\"2018-10-31 14:24:40\" fw=TopsecOS  pri=5 type=sv_netacc user=朱毅伟 op=connect src=101.90.124.158 session=141&154094571395833 vip=8.8.242.253 pid:6689 Login success";
		String regex = ".*((?:(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d)))\\.){3}(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d))))";
		regex = (REGEX_URL + "|" + REGEX_PATH + "|" + REGEX_FILE);
		regex = ".*?time=\"(.*?)\" fw=(.*?) pri=(.*?) type=sv_netacc user=(.*?) op=(.*?) src=(.*?) session=(.*?) vip=(.*?) pid=(.*?) log(.*?) (.*?)";
//		System.out.println(regex);
		Pattern pat = Pattern.compile(regex);

		boolean bMatched = pat.matcher(content).matches();
		doExec(content, pat);
		System.out.println("字符串中是否包含了 'runoob' 子字符串? " + bMatched);
//		Properties properties = System.getProperties();
//		for (Object key : properties.keySet()) {
//			System.out.println(key + "==>" + properties.getProperty((String) key));
//		}
//		System.err.println("======================ENV=========================");
//		Map<String, String> envs = System.getenv();
//
//		for (String key : envs.keySet()) {
//			System.out.println(key + "==>" + envs.get((String) key));
//		}
//		Calendar cla = Calendar.getInstance();
//		cla.setTime(new Date(60L * 60 * 100));
//		System.out.println(new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒").format(new Date(60L * 60 * 100)));
	}

	public static boolean doExec(String logContent, Pattern pat) {
		Matcher m = pat.matcher(logContent);
		boolean bMatched = m.matches();
		System.out.println(bMatched);
		if (bMatched) {
			for (int i = 0; i < m.groupCount(); ++i) {
				System.out.println("====》" + m.group(i + 1).trim());
			}
		} else {
			System.out.println("UnMatcher:" + logContent);
		}

		return bMatched;
	}
}