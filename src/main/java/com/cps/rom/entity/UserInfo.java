package com.cps.rom.entity;

import java.io.Serializable;

public class UserInfo implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -984091133247798165L;
	
	
	
	private int id;
	private String userName;
	private String passWord;
	private int uSex;
	private String uPhone;
	private String uAddress;
	private int level;
	
	public UserInfo(){}
	
	public UserInfo(int id,String userName,String passWord,int uSex,String uPhone,
			String uAddress,int level){
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.uSex = uSex;
		this.uPhone = uPhone;
		this.uAddress = uAddress;
		this.level = level;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public int getuSex() {
		return uSex;
	}

	public void setuSex(int uSex) {
		this.uSex = uSex;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	
}

