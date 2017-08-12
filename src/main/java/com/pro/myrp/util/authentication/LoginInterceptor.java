package com.pro.myrp.util.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter implements MyRPInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(ROLE) != null) {
			logger.info("■■■■■■■■■■clear user login data before");
			session.removeAttribute(ROLE);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		if(userVO != null) {
			logger.info("■■■■■■■■■■new login success");
			session.setAttribute(ROLE, userVO);
			Object dest = session.getAttribute("dest");
			/*response.sendRedirect(dest != null ? (String)dest:"/");*/
			response.sendRedirect("/");
		}
	}
	
}
