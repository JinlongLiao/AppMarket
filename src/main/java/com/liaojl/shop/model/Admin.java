package com.liaojl.shop.model;

import java.util.Date;

public class Admin {
	public String admin;
	public String pwd;
	public Date date;
	public String ip;
	public String id;

	public String getId() {
		return id;
	}

	public void setId(Object object) {
		this.id = (String) object;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(String admin, String pwd, Date date, String ip) {
		super();
		this.admin = admin;
		this.pwd = pwd;
		this.date = date;
		this.ip = ip;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
