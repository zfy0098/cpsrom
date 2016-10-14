package com.cps.rom.entity;

import java.io.Serializable;

public class Propv implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4261913550469997962L;

	
	private int id;
	private String proid;
	private String pvdate;
	private int count;
	private Product product;
	
	public Propv(){}
	
	public Propv(int id,String proid,String pvdate, int count,Product product){
		this.id = id;
		this.proid = proid;
		this.pvdate = pvdate;
		this.count = count;
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getPvdate() {
		return pvdate;
	}

	public void setPvdate(String pvdate) {
		this.pvdate = pvdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
