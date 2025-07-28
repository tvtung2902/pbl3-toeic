package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;
import com.pbl3.model.UserModel;
import com.pbl3.model.VocabListsModel;
import com.pbl3.service.VocabListsService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet (urlPatterns = {"/vocab-lists", "/vocab-lists/create", "/vocab-lists/edit", "/vocab-lists/delete"})
public class VocabListsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doget ListsVocab-user");
		String actionString = req.getServletPath();
		System.out.println("actionString tai do get la: " + actionString);
		switch(actionString) {
			
			case "/vocab-lists" :{
				System.out.println("goi case vocab-lists doget");
				show(req, resp);
				break;
			}
			
			case "/vocab-lists/delete" :{
				System.out.println("goi delete-vocab-lists doget");
				delete(req, resp);
				break;
			}
            
		}
	}
	
	// show
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		System.out.println("goi ham show");
		UserModel userModel = (UserModel)session.getAttribute("user");
		if(userModel ==null) {
			resp.sendRedirect(req.getContextPath()+"/login");
		}else {
		int userID = userModel.getUserID();
		System.out.println("user vao chuc nang nay co id la: " +userID);
		LinkedList<VocabListsModel> vocabListsModels = VocabListsService.all(userID);
		req.setAttribute("vocabListsModels", vocabListsModels);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("views/student/vocab-lists/vocab-lists.jsp");
		reqDispatcher.forward(req, resp);
		}
	}
	
	// create
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String nameList = req.getParameter("name");
		String description = req.getParameter("desc");
		UserModel userModel = (UserModel)session.getAttribute("user");
		int userID = userModel.getUserID();
		VocabListsModel vocabListsModel = new VocabListsModel(userID, nameList, description);
		VocabListsService.add(vocabListsModel);
		resp.sendRedirect(req.getContextPath()+"/vocab-lists");
	}
	 
	// edit
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("gọi hàm edit");
		int listID = Integer.parseInt(req.getParameter("listID"));
		String nameList = req.getParameter("nameList");
		String description = req.getParameter("description");
		System.out.println("listID cua list vua chinh sua: " +listID);
		System.out.println("namelist sau khi chinh sua: " +nameList);
		System.out.println("desc sau khi chinh sua: " + description);
		VocabListsModel vocabListsModel = new VocabListsModel(listID, 0, nameList, description);
		VocabListsService.edit(vocabListsModel);
		resp.sendRedirect(req.getContextPath() + "/vocab-lists/vocab?listID="+Integer.toString(listID));
	}
	
	// delete
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham delete");
		int listID = Integer.parseInt(req.getParameter("listID"));
		System.out.println("listID can xoa la: " + req.getParameter("listID"));
		VocabListsService.delete(listID);
		resp.sendRedirect(req.getContextPath() + "/vocab-lists");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost ListsVocab-user");
		String actionString = req.getServletPath();
		switch(actionString) {
		
			case "/vocab-lists/create" : {
				System.out.println("goi case /vocab-lists/create - dopost");
				create(req, resp);
				break;
			}
			
			case "/vocab-lists/edit" : {
				System.out.println("goi case /vocab-lists/edit - dopost");
				edit(req,resp);
				break;
			}
		}
	}
	
}
