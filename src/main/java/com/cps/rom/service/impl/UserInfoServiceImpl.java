package com.cps.rom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cps.rom.dao.UserInfoDao;
import com.cps.rom.entity.UserInfo;
import com.cps.rom.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDao userInfoDao;
	
	public int addUser(UserInfo userInfo) {
		return userInfoDao.addUser(userInfo);
	}

	/**
	 *  用户登录
	 * @param username
	 * @return
	 */
	public UserInfo userLogin(String username){
		return userInfoDao.userLogin(username);
	}
	
}
