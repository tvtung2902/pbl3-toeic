package com.pbl3.filter;
import java.io.IOException;
import com.pbl3.model.UserModel;
import com.pbl3.service.LessionService;
import com.pbl3.service.VocabListsService;
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

@WebFilter(urlPatterns = { "/vocab-lists/*", "/course/course-detail/vocab-lists/vocab/review", "/teacher/vocab-lists/vocab" })
public class VocabFilter implements Filter {  

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("goi filter vocab");
		HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
		System.err.println(httpRequest.getServletPath());
		System.err.println(httpRequest.getServletPath().equals("/vocab-lists"));
		if (httpRequest.getServletPath().equals("/vocab-lists")
				|| httpRequest.getServletPath().equals("/vocab-lists/create")
				|| httpRequest.getServletPath().equals("/vocab-lists/edit")
				|| httpRequest.getServletPath().equals("/vocab-lists/delete")) {
			System.out.println("vao day ne");
			filterChain.doFilter(servletRequest, servletResponse);
		} else
			vocab(servletRequest, servletResponse, filterChain);
	}

	private void vocab(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("goi ham vocab");
		HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
		HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
		HttpSession session = httpRequest.getSession();
		UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
		try {
			int listID;
			if (httpRequest.getServletPath().startsWith("/course")) {
				listID = LessionService.getLessionByID(Integer.parseInt(httpRequest.getParameter("lessionID"))).getVocabListsModel().getListID();
			}
			else listID = Integer.parseInt(httpRequest.getParameter("listID"));
			if (httpRequest.getServletPath().contains("/vocab-lists/vocab/review")) {
				System.err.println("vao if 1");
				if (isListEmpty(listID)) {
					System.err.println("rong roi");
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;
				}
				String action = httpRequest.getParameter("action");
				System.err.println("ac la: " + action);
				if (action != null && (!action.equals("learn") && !action.equals("learned"))) {
					System.err.println("action sai");
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;
				}
			} 
			else if (!hasAccess(userModel.getUserID(), listID)) {
				System.err.println("vao if 2");
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;
			}
			filterChain.doFilter(servletRequest, servletResponse);
		} catch (Exception e) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
			return;
		}
	}

	private boolean hasAccess(int userID, int listID) {
		if (VocabListsService.find(listID).getListID() == 0)
			return false;
		if (VocabListsService.find(listID).getUserID() != userID)
			return false;
		return true;
	}

	private boolean isListEmpty(int listID) {
		if (VocabListsService.count(listID) == 0) {
			return true;
		}
		return false;
	}

	@Override
	public void destroy() {
	}
}
