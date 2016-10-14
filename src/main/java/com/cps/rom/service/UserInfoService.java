package com.cps.rom.service;

import com.cps.rom.entity.UserInfo;

public interface UserInfoService {

	public int addUser(UserInfo userInfo);
	
	
	/**
	 *  用户登录
	 * @param username
	 * @return
	 */
	public UserInfo userLogin(String username);
}
