package com.onchange.intercepter;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 過濾器的實現 代替 Filter
 * @author lee
 *SpringMVC 中的Interceptor 拦截请求是通过HandlerInterceptor 来实现的。在SpringMVC 中定义一个Interceptor 非常简单，
 *主要有两种方式，第一种方式是要定义的Interceptor类要实现了Spring 的HandlerInterceptor 接口，
 *或者是这个类继承实现了HandlerInterceptor 接口的类，比如Spring 已经提供的实现了HandlerInterceptor 
 *接口的抽象类HandlerInterceptorAdapter ；第二种方式是实现Spring的WebRequestInterceptor接口，或者是继承实现了WebRequestInterceptor的类。
 *
 *preHandle() – 在handler执行之前，返回 boolean 值，true 表示继续执行，false 为停止执行并返回。
 postHandle() – 在handler执行之后, 可以在返回之前对返回的结果进行修改
 afterCompletion() – 在请求完全结束后调用，可以用来统计请求耗时等等
 */
public class ContextInterceptor extends HandlerInterceptorAdapter {
	
	private String bgImgIndex[] ={"1","2","3","4","5","6"};
    
    private final Log logger = LogFactory.getLog(getClass());
    /**
     * 该方法将在请求处理之前进行调用
     */
    @Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Random random = new Random();
		int index = random.nextInt(6);
		String imgIndex = bgImgIndex[index];
		//設置上下文路徑
		request.setAttribute("path", "/mybbs");
		request.setAttribute("imgUrl", "http://14.29.231.137:8089/");
		request.setAttribute("imgIndex", imgIndex);
		request.setAttribute("endType", ".jsp");
		
		String path = request.getServletPath();
		
		logger.info("路径: "+path);
		
		//這裡還能做權限 訪問路徑處理
		
		return true;
	}
/**
 * postHandle 方法，顾名思义就是在当前请求进行处理之后，也就是Controller 方法调用之后执行
 */ @Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}
/**
 * 该方法也是需要当前对应的Interceptor 的preHandle 方法的返回值为true 时才会执行
 */ @Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	

	}

	private void err(HttpServletRequest request, HttpServletResponse response) {
		
	}
}
