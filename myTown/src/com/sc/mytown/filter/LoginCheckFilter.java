package com.sc.mytown.filter;


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

public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) arg0;

		HttpSession session = request.getSession();

		Object obj = session.getAttribute("loginUser");

		if (obj == null) {
			((HttpServletResponse) arg1).sendRedirect("index.jsp");
			
		} else {
			chain.doFilter(arg0, arg1);
		} // if~else end
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
