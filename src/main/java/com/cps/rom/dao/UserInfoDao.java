package com.cps.rom.dao;

import com.cps.rom.entity.UserInfo;

public interface UserInfoDao {


	/**
	 *   添加用户
	 * @param user
	 * @return
	 */
	public int addUser(UserInfo userInfo);
	
	
	
	/**
	 *  用户登录
	 * @param username
	 * @return
	 */
	public UserInfo userLogin(String username);
	
}
