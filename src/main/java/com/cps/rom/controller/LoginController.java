package com.cps.rom.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cps.rom.entity.UserInfo;
import com.cps.rom.service.UserInfoService;
import com.cps.rom.utils.KeyBean;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/")
public class LoginController extends BaseController{

	@Autowired
	private UserInfoService userInfoService;
	
	
	/**
	 *   用户登录
	 * @param request
	 * @param username
	 * @param password
	 */
	@RequestMapping(value = "login" , method = RequestMethod.POST)
	public void userLogin(HttpServletRequest request ,  HttpServletResponse response,
			@RequestParam(value = "username" , required = false) String username,
			@RequestParam(value = "password" , required = false) String password){
		
		JSONObject json = new JSONObject();
		UserInfo userInfo = userInfoService.userLogin(username);
		if(userInfo==null){
			json.put("code", "0");
			json.put("message", "用户名不存在");
		}else{
			KeyBean key = new KeyBean();
			String inpwd = key.getkeyBeanofStr(password);
			if(!inpwd.equals(userInfo.getPassWord())){
				json.put("code", "0");
				json.put("message", "输入的密码有误");
			}else{
				request.getSession().setAttribute("channel", userInfo);
				json.put("code", "1");
				json.put("message", "登录成功");
			}
		}
		
		try {
			response.getWriter().print(json.toString()); 
		} catch (IOException e) {
			log.error(e.getMessage()); 
		}
	}
	
	
	/**
	 *   用户退出系统
	 * @param request
	 * @param response
	 */
	@RequestMapping("logout")
	public void logout(HttpServletRequest request,HttpServletResponse response){
		request.getSession().invalidate();
		try {
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	
}
