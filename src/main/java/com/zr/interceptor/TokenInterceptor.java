package com.zr.interceptor;

import com.zr.utils.TokenProccessor;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TokenInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = TokenProccessor.getInstance().makeToken();
        System.out.println("生成的token" + token);
        request.getSession().setAttribute("token", token);
        String uri = request.getRequestURI();
        if (uri.contains("/toLogin")) {
            response.sendRedirect("/user/login.jsp");
            return false;
        }
        if (uri.contains("/toRegister")) {
            response.sendRedirect("/user/register.jsp");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
