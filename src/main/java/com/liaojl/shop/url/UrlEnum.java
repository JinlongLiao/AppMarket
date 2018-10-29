/**
 * 
 */
package com.liaojl.shop.url;

/**
 * @author liaojl
 *
 */
public enum UrlEnum {
//	首页
	INDEX("index", "/WEB-INF/index.jsp"),
//	分类
	TYPE("types", "/WEB-INF/type.jsp"),
//	文章分类
	ARTICLE("articles", "/WEB-INF/artcleList.jsp");

	private UrlEnum(String desc, String url) {
		this.url = url;
		this.desc = desc;
	}

	private String url;
	private String desc;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
