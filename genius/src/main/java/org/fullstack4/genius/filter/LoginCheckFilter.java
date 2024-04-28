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
@WebFilter(urlPatterns = {"/login/logout", "/mypage/*", "/order/*", "/bbs/qnaViewQ", "/bbs/qnaViewA", "/bbs/qnaRegistQ", "/bbs/qnaModifyQ", "/bbs/boardRegist", "/bbs/boardModify", "/admin/*"})
public class LoginCheckFilter implements Filter {
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
       log.info("Login Check Filter");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession(false);
        String member_id = "";
        if(session != null) {
            member_id = CommonUtil.parseString(session.getAttribute("member_id"));
        }

        if (member_id.equals("")) {
            log.info("---------------------");
            log.info("로그인 정보 없음");
            log.info("---------------------");
            resp.sendRedirect("/login/login");
            return;
        }
        chain.doFilter(req, resp);
    }
}
