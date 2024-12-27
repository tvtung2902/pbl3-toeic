package com.pbl3.filter;

import java.io.IOException;

import com.pbl3.model.TestsModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.HistoryOfTestService;
import com.pbl3.service.TestsService;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/tests/guide", "/tests/start", "/tests/result", "/tests/result-detail" })
public class TestsFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("goi filter tests");
		HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
		String urlString = httpRequest.getServletPath();
		System.out.println("url: " +urlString);
		switch (urlString) {
		case "/tests/result": {
			result_resultDetail(servletRequest, servletResponse, filterChain);
			break;
		}
		case "/tests/guide": {
			System.out.println("goi filter tests guide");
			guide_start(servletRequest, servletResponse, filterChain);
			break;
		}
		case "/tests/start": {
			guide_start(servletRequest, servletResponse, filterChain);
			break; 
		}
		case "/tests/result-detail":{
			result_resultDetail(servletRequest, servletResponse, filterChain);
			break;
		}
		}
	}

	private void guide_start(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
		HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
		try {
			int testsID = Integer.parseInt(httpRequest.getParameter("testsID"));
			if (!hasAccessToGuideAndStart(testsID)) {
				System.err.println("iffffff");
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
			else {
				System.err.println("else");
				filterChain.doFilter(servletRequest, servletResponse);
			}
		} catch (Exception e) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
			return;  
		}
	}

	private void result_resultDetail(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
		HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
		HttpSession session = httpRequest.getSession();
		UserModel currentUser = (UserModel) session.getAttribute("user");
		String historyOfTest = httpRequest.getParameter("history-of-test");
		if (historyOfTest == null) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
			return;
		}
		else {
			int historyOfTestID = 0;
			try {
				historyOfTestID = Integer.parseInt(historyOfTest);
				System.out.println(historyOfTestID);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;
			}
			if (!hasAccessToHistory(currentUser.getUserID(), historyOfTestID)) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;
			}
		}
		filterChain.doFilter(servletRequest, servletResponse);
	}
	
	private boolean hasAccessToHistory(int userID, int historyOfTestID) {
		if (HistoryOfTestService.findUserID(historyOfTestID) == 0)
			return false;
		if (HistoryOfTestService.findUserID(historyOfTestID) != userID)
			return false;
		return true;
	}
	
	private boolean hasAccessToGuideAndStart(int testsID) {
		for (TestsModel testsModel : TestsService.all()) {
			if (testsID == testsModel.getTestsID()) return true;
		}
		return false;
	}

	@Override
	public void destroy() {
	}
}
