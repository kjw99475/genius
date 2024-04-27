//package org.fullstack4.genius.filter;
//
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.log4j.Log4j2;
//import org.fullstack4.genius.Common.CommonUtil;
//import org.fullstack4.genius.Common.CookieUtil;
//import org.fullstack4.genius.dto.MemberDTO;
//import org.fullstack4.genius.service.MemberServiceIf;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.annotation.Order;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@Order(1)
//@Log4j2
//@RequiredArgsConstructor
//@Component
//@WebFilter(urlPatterns = {"*"})
//public class AutoLoginFilter implements Filter {
//    private final MemberServiceIf memberServiceIf;
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        Filter.super.init(filterConfig);
//
//    }
//
//    @Override
//    public void destroy() {
//        Filter.super.destroy();
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
//       log.info("Auto Login Filter");
//        HttpServletRequest req = (HttpServletRequest) servletRequest;
//        HttpServletResponse resp = (HttpServletResponse) servletResponse;
//
//        HttpSession session = req.getSession(false);
//        String member_id = "";
//        if (session != null) {
//            member_id =  CommonUtil.parseString(session.getAttribute("member_id"));
//        }
//        if (!member_id.equals("")) {
//            log.info("---------------------");
//            log.info("로그인 정보 있음");
//            log.info("---------------------");
//        } else {
//            String auto_login = CookieUtil.getCookieValue(req, "auto_login");
//            if (!auto_login.equals("")) {
//                System.out.println("====================== memberServiceIf1111 : " + memberServiceIf);
//                MemberDTO memberDTO = memberServiceIf.AutoLogin(auto_login);
//                System.out.println("====================== memberServiceIf2222 : " + memberServiceIf);
//                System.out.println("autoLogin memberDTO : " + memberDTO);
//                if (memberDTO != null) {
//                    session.setAttribute("member_id", memberDTO.getMember_id());
//                    session.setAttribute("admin_YN", memberDTO.getAdmin_YN());
//                }
//            }
//        }
//        chain.doFilter(req, resp);
//    }
//}
