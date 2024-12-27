package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;
import com.pbl3.model.UserModel;
import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;
import com.pbl3.service.LessionService;
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
@WebServlet(urlPatterns = {"/vocab-lists/vocab/review", "/vocab-lists/vocab/review/remember", "/course/course-detail/vocab-lists/vocab/review", "/course/course-detail/vocab-lists/vocab/review/remember"})
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
         case "/course/course-detail/vocab-lists/vocab/review": {
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
        int listID;
        if (req.getServletPath().startsWith("/course")) {
			listID = LessionService.getLessionByID(Integer.parseInt(req.getParameter("lessionID"))).getVocabListsModel().getListID();
		}
		else listID = Integer.parseInt(req.getParameter("listID"));
        VocabListsModel vocabListsModel=VocabListsService.find(listID);
        String actionString = req.getParameter("action");
        req.setAttribute("listID",listID);
        req.setAttribute("action", actionString);
        req.setAttribute("vocablistsModel", vocabListsModel);
        String servletPath = req.getServletPath();
        String path = req.getRequestURL().append("?").append(req.getQueryString()).toString();
		System.err.print("path: " +path);
        if(actionString.equals("learn")) {
        	LinkedList<VocabModel> vocabModels = VocabService.getVocabReview(listID, userID);
        	req.setAttribute("vocabModels", vocabModels);
        	req.setAttribute("path", path);
        	req.setAttribute("servletPath", servletPath);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/review.jsp");
            requestDispatcher.forward(req, resp);
        }
        else if(actionString.equals("learned")){
        	LinkedList<VocabModel> vocabModels = VocabService.getVocabReviewed(listID, userID);
        	req.setAttribute("vocabModels", vocabModels);
        	req.setAttribute("path", path);
        	req.setAttribute("servletPath", servletPath);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/reviewed.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String actionString = req.getServletPath();
	     System.out.println("actionString tai do get la: " + actionString);
	     switch (actionString) {
         case "/vocab-lists/vocab/review/remember": {
        	 System.out.println(actionString);
             remember(req, resp);
    		 resp.sendRedirect(req.getContextPath() + "/vocab-lists/vocab/review?action=learn&listID=" + Integer.parseInt(req.getParameter("listID")));
             break;
         }
         case "/course/course-detail/vocab-lists/vocab/review/remember": {
        	 System.out.println(actionString);
             remember(req, resp);
    		 resp.sendRedirect(req.getContextPath() + "/course/course-detail/vocab-lists/vocab/review?action=learn&lessionID=" + 
    				 LessionService.getLessionByID(Integer.parseInt(req.getParameter("lessionID"))).getLessionID());
             break;
         }
	     }
	}
	public void remember(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    	HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		int index=Integer.parseInt(req.getParameter("index"));
        int listID;
        if (req.getServletPath().startsWith("/course")) {
			listID = LessionService.getLessionByID(Integer.parseInt(req.getParameter("lessionID"))).getVocabListsModel().getListID();
		}
		else listID = Integer.parseInt(req.getParameter("listID"));
		LinkedList<VocabModel> vocabModels = VocabService.getVocabReview(listID, userID);
		VocabModel vocabModel =vocabModels.get(index);
		ReviewService.remember(userID, vocabModel.getVocabID());
	}
}
