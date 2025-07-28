package com.pbl3.controller.admin;
import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import com.pbl3.libs.Coupon;
import com.pbl3.model.CouponModel;
import com.pbl3.service.CouponService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig 
@WebServlet(urlPatterns = { "/admin/coupon", "/admin/coupon/create", "/admin/coupon/edit", "/admin/coupon/delete"})
public class CouponController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet Coupon - ad");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/coupon": {
			System.out.println("goi doget /admin/coupon");
			show(req, resp);
			break;
		}
		case "/admin/coupon/create": {
			System.out.println("goi doPost /admin/coupon/create");
			create(req, resp);
			break;
		}
		
		case "/admin/coupon/edit": {
			System.out.println("goi doPost /admin/coupon/edit");
			edit(req, resp);
			break;
		}
		default : { 
			resp.sendRedirect(req.getContextPath() + "/error");
		}
		}
	}
//	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("goi ham show");
//		LinkedList<CouponModel> couponModels = CouponService.all();
//		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/coupon/coupon.jsp");
//		req.setAttribute("couponModels", couponModels); 
//	    requestDispatcher.forward(req, resp);
//	}
	
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("goi ham show");
	    RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/coupon/coupon.jsp");
	    String method = req.getParameter("method");
	    String keyword = req.getParameter("keyword");
	    if (keyword == null) {
	        keyword = "";
	    }
	    if (method == null) {
	        method = "CouponID";
	    } 
	    int page = 1;
	    if (req.getParameter("page") != null && !req.getParameter("page").isEmpty()) {
	        page = Integer.parseInt(req.getParameter("page"));
	    }       
	    int limit = 8;      
	    LinkedList<CouponModel> couponModels = CouponService.all(method, keyword, limit, page);
	    int totalRecord = CouponService.countSearch(method, keyword);
	    int totalPage = (int)Math.ceil(1.0 * totalRecord / limit);
	    System.out.println("totalRecord: " + totalRecord);
	    System.out.println("totalPage: " + totalPage);
	    req.setAttribute("totalPage", totalPage);  
	    req.setAttribute("couponModels", couponModels);
	    requestDispatcher.forward(req, resp); 
	}

	
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/coupon/create-coupon.jsp");
		LinkedList<String> codes = new LinkedList<String>();
		String code = "";
		while (true) {
			code = Coupon.createCode();
			boolean check = true;
			for (String codeString : codes) {
				if(codeString.equals(code)) {
					check = false;
					break;
				}
			}
			if(check) break;
		}    
		req.setAttribute("code", code);
		requestDispatcher.forward(req, resp);  
	}
	 
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doget edit ");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/coupon/edit-coupon.jsp"); 
		int couponID = Integer.parseInt(req.getParameter("couponID"));
		CouponModel couponModel = CouponService.find(couponID);
		req.setAttribute("couponModel", couponModel);
		requestDispatcher.forward(req, resp);
	}
	
	protected void createSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String code = req.getParameter("code");
	    Date startDate = Date.valueOf(req.getParameter("startDate"));
	    Date endDate = Date.valueOf(req.getParameter("endDate"));
	    int quantity = Integer.parseInt(req.getParameter("quantity"));
	    int quantityUsed = 0;
	    int percent = Integer.parseInt(req.getParameter("percent"));
	    CouponModel couponModel = new CouponModel(code, startDate, endDate, quantity, quantityUsed, percent);
	    CouponService.add(couponModel);
	    resp.sendRedirect(req.getContextPath() + "/admin/coupon"); // Chuyển hướng sau khi thêm thành công
	} 

	 
	protected void editSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int couponID = Integer.parseInt(req.getParameter("couponID"));
	    Date startDate = Date.valueOf(req.getParameter("startDate"));
	    Date endDate = Date.valueOf(req.getParameter("endDate"));
	    int quantity = Integer.parseInt(req.getParameter("quantity"));      
	    int percent = Integer.parseInt(req.getParameter("percent")); 
	    CouponModel couponModel = new CouponModel(couponID, startDate, endDate, quantity, percent);
	    System.out.println("aaaaaaaaaaaaa" + couponModel.getCouponID());
	    CouponService.edit(couponModel);
	    resp.sendRedirect(req.getContextPath() + "/admin/coupon"); // Chuyển hướng sau khi chỉnh sửa thành công
	}
	
	
	protected void deleteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int couponID = Integer.parseInt(req.getParameter("couponID")); 
	    CouponService.delete(couponID); 
	    resp.sendRedirect(req.getContextPath() + "/admin/coupon"); // Chuyển hướng sau khi xóa thành công
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost coupon - ad");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/coupon/create": {
			System.out.println("goi doPost /admin/coupon/create");
			createSubmit(req, resp);
			break;
		}
		
		case "/admin/coupon/edit": {
			System.out.println("goi doPost /admin/coupon/edit");
			editSubmit(req, resp);
			break;
		}
		
		case "/admin/coupon/delete": {
			System.out.println("goi doPost /admin/coupon/delete");
			deleteSubmit(req, resp);
			break;
		}
		}
	}
}
