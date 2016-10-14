package com.cps.rom.entity;

import java.io.Serializable;
import java.util.List;

public class Protype implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -222286109669197636L;

	
	
	public int id;
	private String name;
	private String parent;
	private String typeid;
	
	private List<Protype> typelist;
	
	public Protype(){}
	
	public Protype(int id,String name,String parent,String typeid,List<Protype> typelist){
		this.id = id;
		this.name = name;
		this.parent = parent;
		this.typeid = typeid;
		this.typelist = typelist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public List<Protype> getTypelist() {
		return typelist;
	}

	public void setTypelist(List<Protype> typelist) {
		this.typelist = typelist;
	}
	
}
