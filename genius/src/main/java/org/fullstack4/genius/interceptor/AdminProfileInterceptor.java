package org.fullstack4.genius.interceptor;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.mapper.CartMapper;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2
@Component
@RequiredArgsConstructor
public class AdminProfileInterceptor implements HandlerInterceptor {
    private final MemberServiceIf memberServiceIf;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HttpSession session = request.getSession(false);
        String member_id = "";
        if (session != null) {
            member_id =  CommonUtil.parseString(session.getAttribute("member_id"));
        }
        if (!member_id.equals("")) {
            String profile = memberServiceIf.getProfile(member_id);
            session.setAttribute("profile", profile);
        }
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
