package com.pro.myrp.util.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pro.myrp.domain.authentication.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter implements MyRPInterceptor{

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if(req.getMethod().equals("GET")) {
			logger.info("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri+query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(ROLE) == null) {
			logger.info("■■■■■■■■■■current user is not logined");
			saveDest(request);
			response.sendRedirect("/user/login");
			return false;
		}
		UserVO vo = (UserVO) session.getAttribute(ROLE);
		if(!vo.getAccess_role().equals(ROLE_ADMIN)) {
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}
}
