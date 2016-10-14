package com.cps.rom.entity;

import java.io.Serializable; 


public class Product implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2662520806819017658L;

	
	private Integer id;  		// 主键编号
	private String proid;  		// 推广商品编号
	private String proname; 	// 推广商品名称
	private String proimg;  	// 推广商品图片
	private String proprice; 	// 推广商品价格
	private String prourl;		// 商品详情地址
	private String prospread;	// 推广地址
	private Integer prostatus;	// 推广状态 0：推广 1：暂停推广
	private double commissionrate;// 佣金率
	private String commission;	// 佣金
	private Integer levels;		//优先级 数值越小优先级越高 
	private String indate;		// 添加时间
	
	
	
	
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProimg() {
		return proimg;
	}
	public void setProimg(String proimg) {
		this.proimg = proimg;
	}
	public String getProprice() {
		return proprice;
	}
	public void setProprice(String proprice) {
		this.proprice = proprice;
	}
	public String getProurl() {
		return prourl;
	}
	public void setProurl(String prourl) {
		this.prourl = prourl;
	}
	public Integer getProstatus() {
		return prostatus;
	}
	public void setProstatus(Integer prostatus) {
		this.prostatus = prostatus;
	}
	public Integer getLevels() {
		return levels;
	}
	public void setLevels(Integer levels) {
		this.levels = levels;
	}
	public String getProspread() {
		return prospread;
	}
	public void setProspread(String prospread) {
		this.prospread = prospread;
	}
	public double getCommissionrate() {
		return commissionrate;
	}
	public void setCommissionrate(double commissionrate) {
		this.commissionrate = commissionrate;
	}
	public String getCommission() {
		return commission;
	}
	public void setCommission(String commission) {
		this.commission = commission;
	}
}
