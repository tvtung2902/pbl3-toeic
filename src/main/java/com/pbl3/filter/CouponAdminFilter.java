package com.pbl3.filter;
import java.io.IOException;	
import com.pbl3.service.CouponService;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = {"/admin/coupon-course", "/admin/coupon/edit"})
public class CouponAdminFilter implements Filter{

		@Override
		public void init(FilterConfig filterConfig) throws ServletException {
			
		}

		@Override
		public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
				throws IOException, ServletException {
			System.out.println("goi filter coupon");
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			String urlString = httpRequest.getServletPath();
			System.out.println("url: " +urlString);
			switch (urlString) {
			case "/admin/coupon-course" :{
				hasAccessCoupon(servletRequest, servletResponse, filterChain);
				break;
			}
			case "/admin/coupon/edit":{
				hasAccessCoupon(servletRequest, servletResponse, filterChain);
				break;

			}
			}	
		} 

		 

		private void hasAccessCoupon(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			try {
				int couponID = Integer.parseInt(httpRequest.getParameter("couponID"));
				if (!hasAccessCourseEdit(couponID)) {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;  
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}

		private boolean hasAccessCourseEdit(int couponID) {
			return CouponService.find(couponID).getCouponID() == couponID;
		}

		@Override
		public void destroy() {
		}
	}

