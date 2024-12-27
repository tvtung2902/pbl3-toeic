package com.pbl3.controller.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.pbl3.libs.FileData;
import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.model.LessionModel;
import com.pbl3.model.PartModel;
import com.pbl3.model.UserModel;
import com.pbl3.model.VocabListsModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.LessionService;
import com.pbl3.service.PartService;
import com.pbl3.service.VocabListsService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig
@WebServlet(urlPatterns = {"/teacher/course/course-detail", "/teacher/course/course-detail/create", "/teacher/course/course-detail/edit", "/teacher/course/course-detail/delete"})
public class CourseDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
        switch (actionString) {
	        case "/teacher/course/course-detail": {
	        	courseDetail(req, resp);
	            break;
	        }
	        case "/teacher/course/course-detail/create": {
	        	create(req, resp);
	            break;
	        }
	        case "/teacher/course/course-detail/edit": {
	        	edit(req, resp);
	            break;
	        }
	        case "/teacher/course/course-detail/delete": {
	            break;
	        }
        }
	}
	public void courseDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int courseID = Integer.parseInt(req.getParameter("courseID"));
		CourseModel courseModel=CourseService.find(courseID);
		ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList = PartService.all(courseID);
		req.setAttribute("arraylist", arrayList);
		req.setAttribute("courseModel", courseModel);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/views/teacher/course/course-detail.jsp");
		reqDispatcher.forward(req, resp);
	}
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int part = Integer.parseInt(req.getParameter("part"));
		req.setAttribute("part", part);
		int courseID = Integer.parseInt(req.getParameter("courseID"));
		req.setAttribute("courseID", courseID);
		LinkedList<VocabListsModel> vocabListsModels = VocabListsService.all(userModel.getUserID());
		req.setAttribute("vocabListsModels", vocabListsModels);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/course/create-lession.jsp");
		requestDispatcher.forward(req, resp);    
	}
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int lessionID = Integer.parseInt(req.getParameter("lessionID"));
		LessionModel lessionModel = LessionService.getLessionByID(lessionID);
		req.setAttribute("lessionModel", lessionModel);
		int courseID = lessionModel.getCourseID();   
		req.setAttribute("courseID", courseID);
		LinkedList<VocabListsModel> vocabListsModels = VocabListsService.all(userModel.getUserID());
		req.setAttribute("vocabListsModels", vocabListsModels);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/course/edit-lession.jsp");
		requestDispatcher.forward(req, resp);    
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionString = req.getServletPath();
        switch (actionString) {
	        case "/teacher/course/course-detail/create": {
	        	createSubmit(req, resp);
	            break;
	        }
	        case "/teacher/course/course-detail/edit": {
	        	editSubmit(req, resp);
	            break;
	        }
	        case "/teacher/course/course-detail/delete": {
	        	deleteSubmit(req, resp);
	            break;
	        }
        }
	}
	protected void createSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int partID = Integer.parseInt(req.getParameter("partID"));
		int courseID =Integer.parseInt(req.getParameter("courseID"));;
		int orderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		String nameLessionString = req.getParameter("nameLession");
		Integer vocablist = null;
		if(req.getParameter("vocabList") != null && !req.getParameter("vocabList").equals("")) {
			vocablist = Integer.parseInt(req.getParameter("vocabList"));
		} 
		Part partVideo = req.getPart("video"); 
        String video = null;
		String realPartVideo = req.getServletContext().getRealPath("/course-data"); 
		video = FileData.addDataCourse(partVideo, realPartVideo); // tra ve null neu co form-group img nhung ko tai len
		Part partExercise = req.getPart("exercise"); 
        String exercise = null;
		String realPartEX = req.getServletContext().getRealPath("/course-data"); 
		exercise = FileData.addDataCourse(partExercise, realPartEX); // tra ve null neu co form-group img nhung ko tai len
		LessionModel lessionModel = new LessionModel(0, courseID, partID, nameLessionString, orderNumber, video, exercise, vocablist == null ? null : VocabListsService.find(vocablist));
		LessionService.add(lessionModel);
		resp.sendRedirect(req.getContextPath() + "/teacher/course/course-detail?courseID="+courseID); 
	}
	protected void editSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int partID = Integer.parseInt(req.getParameter("partID"));
		int lessionID = Integer.parseInt(req.getParameter("lessionID"));
		int courseID = Integer.parseInt(req.getParameter("courseID"));
		int orderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		String nameLessionString = req.getParameter("nameLession");
		VocabListsModel vocabListsModel; 
		if(req.getParameter("vocabList")!= null && ! (req.getParameter("vocabList").equals(""))) {
			int listID = Integer.parseInt(req.getParameter("vocabList"));
			vocabListsModel = new VocabListsModel();
			vocabListsModel.setListID(listID);
		}
		else {
			vocabListsModel = null;
		}
		// video
        Part partVideo = req.getPart("video"); 
        String video = null;  
        System.err.println("vvvv" +req.getParameter("deleteVideo"));
        if (req.getParameter("deleteVideo") == null){     
        	String realPartVideo = req.getServletContext().getRealPath("/course-data"); 
    		video = FileData.addDataCourse(partVideo, realPartVideo);
    		if (video == null) {
    			video = req.getParameter("videoOld"); 
    		}       
        } 
        
        else if (req.getParameter("videoOld") == null) {
        	String realPartVideo = req.getServletContext().getRealPath("/course-data"); 
    		video = FileData.addDataCourse(partVideo, realPartVideo); 
        }
        
        // ex
        Part partEx = req.getPart("exercise"); 
        String Exercise = null;    
        if (req.getParameter("deleteEx") == null){     
        	String realPartEx = req.getServletContext().getRealPath("/course-data"); 
    		Exercise = FileData.addDataCourse(partEx, realPartEx);
    		if (Exercise == null) {
    			Exercise = req.getParameter("exerciseOld"); 
    		}       
        } 
        else if (req.getParameter("exerciseOld") == null) {
        	String realPartEx = req.getServletContext().getRealPath("/course-data"); 
    		Exercise = FileData.addDataCourse(partEx, realPartEx); 
        }
        
        
		LessionModel lessionModel= new LessionModel(lessionID, courseID, partID, nameLessionString, orderNumber, video, Exercise, vocabListsModel);
		System.err.println(lessionModel.toString());
		LessionService.edit(lessionModel); 
		resp.sendRedirect(req.getContextPath() + "/teacher/course/course-detail?courseID=" + courseID); 
	} 
	protected void deleteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int lessionID = Integer.parseInt(req.getParameter("lessionID"));
		int courseID =Integer.parseInt(req.getParameter("courseID"));
		LessionService.delete(lessionID);
		resp.sendRedirect(req.getContextPath() + "/teacher/course/course-detail?courseID="+courseID); 
	}
}
