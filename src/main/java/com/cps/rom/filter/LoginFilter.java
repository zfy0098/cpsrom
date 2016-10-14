package com.cps.rom.filter;

import java.io.IOException; 

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	private static final String[] loginUrl = new String[] { "/login.jsp" , "/login.html"};
	
    /**
     * Default constructor. 
     */
    public LoginFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		HttpSession session = httpServletRequest.getSession();// 获取session
		String requestUrl = httpServletRequest.getRequestURI();
		String contextPath = httpServletRequest.getContextPath();// 基本地址(请求路径1)
		Object sessionChannel = session.getAttribute("channel");// 获取到session中的Channel
		// 若是登录页面就不用检查
		for (String s : loginUrl) {
			if ((contextPath + s).equals(requestUrl)) {
				chain.doFilter(request, response);
				return;
			}
		}
		// 非登录页面，则检查session里的渠道为null，若null则跳到登陆页面
		if (sessionChannel == null) {
			
			httpServletResponse.sendRedirect(contextPath + loginUrl[0]);// 返回登录页面
			return;
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
