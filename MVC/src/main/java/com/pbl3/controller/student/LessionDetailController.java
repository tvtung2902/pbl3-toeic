package com.pbl3.controller.student;

import java.io.IOException;
import java.util.ArrayList;

import com.pbl3.model.LessionModel;
import com.pbl3.model.PartModel;
import com.pbl3.service.LessionService;
import com.pbl3.service.PartService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/course/course-detail/learn"})
public class LessionDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		lessionDetail(req, resp);
	}
	public void lessionDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int lessionID = Integer.parseInt(req.getParameter("lessionID"));
		LessionModel lessionModel = LessionService.getLessionByID(lessionID);
		ArrayList<LessionModel> arrayList = LessionService.getLessionForSidebar(lessionModel.getCourseID(), lessionModel.getPartID());
		PartModel partModel = PartService.getPartModelByID(lessionModel.getPartID());
		req.setAttribute("lession", lessionModel);
		req.setAttribute("listLession", arrayList);
		req.setAttribute("part", partModel);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/views/student/course/lessionDetail.jsp");
		reqDispatcher.forward(req, resp); 
	}
}
