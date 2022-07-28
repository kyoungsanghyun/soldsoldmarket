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

import com.soldsoldMarket.common.wrapper.EncryptPasswordWrapper;

@WebFilter( filterName = "encrypt",servletNames = {"login", "enroll","updatePwd"})
public class EncryptFilter implements Filter {
       
    public EncryptFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		//request 객체의 파라미터 값을 직접 변경할 수 없기 때문에 래퍼클래스를 생성해서 파라미터 값을 수정한다.
		EncryptPasswordWrapper wrapper = new EncryptPasswordWrapper((HttpServletRequest)request);
		
		
		chain.doFilter(wrapper, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
