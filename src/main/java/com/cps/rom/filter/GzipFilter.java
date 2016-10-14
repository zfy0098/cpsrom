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

import com.cps.rom.utils.GZipResponseWrapper;

public class GzipFilter implements Filter{
	/**
     * Default constructor.
     */
    public GzipFilter() {
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see Filter#destroy()
     */
    public void destroy() {
    	
    }
 
    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) {
        // place your code here
 
        System.out.println("压缩的");
 
        HttpServletRequest request = (HttpServletRequest)req; 
        HttpServletResponse response =(HttpServletResponse)res; 
 
        String acceptEncoding = request.getHeader("Accept-Encoding"); 
        //支持的编码方式 
        try {
            if(acceptEncoding != null && acceptEncoding.toLowerCase().indexOf("gzip") != -1){ 
 
                System.out.println("执行压缩的方法");
 
                //如果客户浏览器支持GZIP格式，则使用GZIP压缩数据 
                GZipResponseWrapper gzipRes = new GZipResponseWrapper(response); 
 
                chain.doFilter(request, gzipRes);//doFilter,使用自定义的response 
                gzipRes.finishResponse();//输出压缩数据 
 
            }else{ 
                System.out.println("没有压缩");
 
                chain.doFilter(request, response);//否则不压缩 
            } 
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
 
    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
    	
    }
}
