package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import com.pbl3.model.UserModel;
import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;
import com.pbl3.service.ReviewService;
import com.pbl3.service.VocabListsService;
import com.pbl3.service.VocabService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/vocab-lists/vocab/review", "/vocab-lists/vocab/review/remember"})
public class ReviewController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String actionString = req.getServletPath();
	     System.out.println("actionString tai do get la: " + actionString);
	     switch (actionString) {
         case "/vocab-lists/vocab/review": {
             System.out.println("goi case /vocab-lists/vocab/review - doget");
             review(req, resp);
             break;
         }
	     }
	}
    // review
    public void review(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
        System.out.println("goi ham review");
        int listID = Integer.parseInt(req.getParameter("listID"));
        VocabListsModel vocabListsModel=VocabListsService.find(listID);
        String actionString = req.getParameter("action");
        req.setAttribute("listID",listID);
        req.setAttribute("action", actionString);
        req.setAttribute("vocablistsModel", vocabListsModel);
        if(actionString.equals("learn")) {
        	LinkedList<VocabModel> vocabModels = VocabService.getVocabReview(listID, userID);
        	req.setAttribute("vocabModels", vocabModels);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/review.jsp");
            requestDispatcher.forward(req, resp);
        }
        else if(actionString.equals("learned")){
        	LinkedList<VocabModel> vocabModels = VocabService.getVocabReviewed(listID, userID);
        	req.setAttribute("vocabModels", vocabModels);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/reviewed.jsp");
            requestDispatcher.forward(req, resp);
        }

    }
//    public void review(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("goi ham review");
//        int listID = Integer.parseInt(req.getParameter("listID"));
//        LinkedList<VocabModel> vocabModels = VocabService.all(listID);
//        req.setAttribute("listID", listID);
//        req.setAttribute("vocabModels", vocabModels);
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/review.jsp");
//        requestDispatcher.forward(req, resp);
//    }
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String actionString = req.getServletPath();
	     System.out.println("actionString tai do get la: " + actionString);
	     switch (actionString) {
         case "/vocab-lists/vocab/review/remember": {
             remember(req, resp);
             break;
         }
	     }
	}
	public void remember(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    	HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		int index=Integer.parseInt(req.getParameter("index"));
        int listID = Integer.parseInt(req.getParameter("listID"));
		 LinkedList<VocabModel> vocabModels = VocabService.getVocabReview(listID, userID);
		 VocabModel vocabModel =vocabModels.get(index);
		 ReviewService.remember(userID, vocabModel.getVocabID());
		 resp.sendRedirect(req.getContextPath() + "/vocab-lists/vocab/review?action=learn&listID=" + listID);
	}
}
