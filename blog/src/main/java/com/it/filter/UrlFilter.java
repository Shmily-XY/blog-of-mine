package com.it.filter;


import com.it.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;
@WebFilter(filterName = "MyFilter")
public class UrlFilter implements Filter {
    public FilterConfig config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
        //System.out.println("----------------------->过滤器被创建");
    }

    public static boolean isContains(String container, String[] regx) {
        boolean result = false;

        for (int i = 0; i < regx.length; i++) {
            if (container.indexOf(regx[i]) != -1) {
                return true;
            }
        }
        return result;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(
                (HttpServletResponse) res);

        String requestURI = req.getRequestURI();
        //System.out.println("--------------------->过滤器：请求地址"+requestURI);

        String logonStrings = config.getInitParameter("logonStrings");// -登录登陆页面
        String[] logonList = logonStrings.split(";");
        User admin = (User) req.getSession().getAttribute("admin");

        //仅仅对指定过滤參数后缀进行过滤

        if (!this.isContains(req.getRequestURI(),logonList)) {

            if(requestURI.contains("memberCenter")){
                req.getSession().setAttribute("active", "memberCenter");
            }else if(requestURI.contains("memberSet")){
                req.getSession().setAttribute("active", "memberSet");
            }else if(requestURI.contains("bzApply")){
                req.getSession().setAttribute("active", "bzApply");
            }else if(requestURI.contains("myFollow")){
                req.getSession().setAttribute("active", "myFollow");
            }else if(requestURI.contains("myPingbi")){
                req.getSession().setAttribute("active", "myPingbi");
            }else if(requestURI.contains("mysendSx")){
                req.getSession().setAttribute("active", "mysendSx");
            }else if(requestURI.contains("favMsg")){
                req.getSession().setAttribute("active", "favMsg");
            }else if(requestURI.contains("photoList")){
                req.getSession().setAttribute("active", "photoList");
            }else if(requestURI.contains("articleList")){
                req.getSession().setAttribute("active", "articleList");
            }else if(requestURI.contains("articleList")){
                req.getSession().setAttribute("active", "articleList");
            }

            if(requestURI.contains("admin")&&admin==null){
                res.sendRedirect("/blog/admin/login.jsp");
                return;
            }



        }
        filterChain.doFilter(req, res);
    }

    @Override
    public void destroy() {

       // System.out.println("----------------------->过滤器被销毁");
    }


}
