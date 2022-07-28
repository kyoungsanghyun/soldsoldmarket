package com.soldsoldMarket.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/*
 * 서블릿 필터
 *  - request, response가 서블릿이나 JSP 등에 도달하기 전에 필요한 전/후 처리 작업을 실행한다.
 *  - Filterchain을 통해서 여러 개의 필터를 연속적으로 사용이 가능하다.
 * 
 * 
 * 필터를 등록하는 방법
 *  - WEB-INF/web.xml 파일에 필터를 등록해서 사용한다.
 *  - @WebFilter 어노테이션으로 필터를 등록해서 사용한다.
 * 
 */

@WebFilter(filterName = "encoding", urlPatterns = "/*")
public class EncodingFilter implements Filter {
       
    public EncodingFilter() {
    }

    
    public void init(FilterConfig fConfig) throws ServletException {
    	//컨테이너가 필터를 생성 후 초기화를 위해서 호출한다.
    	System.out.println("필터가 생성되어 init");
    	
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	//컨테이너가 현재 요청에 필터를 적용하겠다고 판단하면 호출된다.
    	System.out.println("필터 doFilter()메소드");
    	
    	HttpServletRequest hr = (HttpServletRequest) request;
    	
    	if(hr.getMethod().equals("POST")) {
    		hr.setCharacterEncoding("UTF-8");
    		System.out.println(hr.getCharacterEncoding()+"인코딩 완료");
    	}
    	
    	//다음 필터를 호출하거나, 마지막 필터라면 서블릿/JSP를 호출한다.
    	chain.doFilter(request, response);
    }

    public void destroy() {
    	//컨테이너가 필터를 제거할 때 호출한다.
    	System.out.println("필터가 소멸됨");
	}



}
