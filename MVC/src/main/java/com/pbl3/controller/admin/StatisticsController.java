package com.pbl3.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
import com.pbl3.libs.ToStringBuilder;
import com.pbl3.service.StatisticsService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/statistics" })
public class StatisticsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/statistics": {
			System.out.println("goi doget /admin/statistics");
			show(req, resp);
			break;
		}
		}
	}
	
	private void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/statistics/statistics.jsp");
		Date begin;
		try {
			begin = Date.valueOf(req.getParameter("begin"));
		} catch (Exception e) {
			begin = Date.valueOf(LocalDate.now());
		}
		Date end;
		try {
			end = Date.valueOf(req.getParameter("end"));
		} catch (Exception e) {
			end = Date.valueOf(LocalDate.now());
		}
		LinkedList<Pair<Date, Double>> revenue = StatisticsService.countDaily("TotalAmount", begin, end);
		LinkedList<Pair<Date, Double>> profit = StatisticsService.countDaily("TotalAmount - TotalAmountOfTeacher", begin, end);
	    Object[] objDate = new Object[revenue.size()];
	    Object[] objRevenue = new Object[revenue.size()];
	    Object[] objProfit = new Object[profit.size()];
	    int i = 0;
	    for(Pair<Date, Double> p : revenue) {
	    	System.out.println("first: " + p.getFirst());
	    	objDate[i] = p.getFirst();
	    	System.out.println("ngay: " +objDate[i]);
	    	objRevenue[i] = p.getSecond();
	    	++i;
	    }
	    i = 0;
	    for(Pair<Date, Double> p : profit) {
	    	objProfit[i++] = p.getSecond(); 
	    }
	    
	    req.setAttribute("objDate", ToStringBuilder.arrayToJson(objDate));  
	    req.setAttribute("objRevenue", Arrays.toString(objRevenue));
	    req.setAttribute("objProfit", Arrays.toString(objProfit));
	    req.setAttribute("date", objDate);
	    req.setAttribute("revenue", objRevenue);   
	    req.setAttribute("profit", objProfit);
		requestDispatcher.forward(req, resp);
	}
}
