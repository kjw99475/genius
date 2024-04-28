package org.fullstack4.genius.filter;


import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebFilter(urlPatterns = {"/login/login", "/member/join", "/member/complete"})
public class LogoutCheckFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession();
        String member_id = CommonUtil.parseString(session.getAttribute("member_id"));

        if (!member_id.equals("")) {

            resp.sendRedirect("/");
            return;
        }
        chain.doFilter(req, resp);
    }
}
