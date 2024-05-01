package org.fullstack4.genius.interceptor;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.CookieUtil;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2
@Component
@RequiredArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {
    private final MemberServiceIf memberServiceIf;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("AutoLoginInterceptor   >>>>>>> preHandle");
        HttpSession session = request.getSession(false);
        String member_id = "";
        if (session != null) {
            member_id =  CommonUtil.parseString(session.getAttribute("member_id"));
        }
        if (!member_id.equals("")) {
        } else {
            String auto_login = CookieUtil.getCookieValue(request, "auto_login");
            if (!auto_login.equals("")) {
                MemberDTO memberDTO = memberServiceIf.AutoLogin(auto_login);
                if (memberDTO != null) {
                    session = request.getSession();
                    session.setAttribute("member_id", memberDTO.getMember_id());
                    session.setAttribute("admin_YN", memberDTO.getAdmin_YN());
                }
            }
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("AutoLoginInterceptor   >>>>>>> postHandle");
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
