package com.zr.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 查看是否登录
 */
public class loginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("rememberAccount")) {
                request.getSession().setAttribute("rememberAccount", cookie.getValue());
            }
        }
        Object login = request.getSession().getAttribute("login");
        if (login != null) {
            return true;
        } else {
            response.sendRedirect("/user/login.jsp");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
