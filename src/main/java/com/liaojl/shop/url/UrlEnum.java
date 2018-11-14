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
	INDEX("/index", "/index"),
//	分类
	TYPE("/index/types", "/WEB-INF/type.jsp"),
//	文章分类
	ARTICLE("/articles", "/WEB-INF/artcleList.jsp"),
//	管理员
	ADMIN("/admin", "/WEB-INF/admin/login.jsp"),
//	管理员主界面
	ADMINMAIN("/admin", "/WEB-INF/admin/adminMain.jsp"),
//	用户主界面
	USERMAIN("/index", "/WEB-INF/index.jsp"),
//	ppt
	PPTCONFIG("/admin/pptconfig", "/WEB-INF/admin/pptConfig.jsp"),
	// product
	PRODUCT("/admin/product", "/WEB-INF/admin/allProduct.jsp"),
	// TYPES
	TYPES("/admin/alltypes", "/WEB-INF/admin/allTypes.jsp"),
//	PPT 上传
	PPTIMGUPLOAD("/WEB-INF/admin/pptConfig.jsp", "/admin/pptupload"),
	// PRO 上传
	PROIMGUPLOAD("/admin/product", "/admin/proupload"),
	// PRO 上传
	SUBNET("/admin/subnet", "/WEB-INF/admin/subnet.jsp"),	
	// PRO 上传
	SUBNETREG("/index/subnet", "index/subnet"),
//	
	EDITPRO("/admin/editPro", "/WEB-INF/admin/EditlProduct.jsp");

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
