package com.en.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.en.member.model.vo.Member;

/**
 * Servlet Filter implementation class AdminCheckFilter2
 */
@WebFilter("/view/admin/*")
public class AdminCheckFilter2 implements Filter {

    /**
     * Default constructor. 
     */
    public AdminCheckFilter2() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpSession session = rq.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		if(m==null || !m.getMangerYn().equals("Y")) {
			rq.setAttribute("msg", "잘못된 접근입니다.");
			rq.setAttribute("loc", "/");
			rq.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
