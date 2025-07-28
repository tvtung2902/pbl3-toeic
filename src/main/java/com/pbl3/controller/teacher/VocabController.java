package com.pbl3.controller.teacher;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.FileData;
import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.VocabListsService;
import com.pbl3.service.VocabService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig 
@WebServlet(urlPatterns = {"/teacher/vocab-lists/vocab", "/teacher/vocab-lists/vocab/create", "/teacher/vocab-lists/vocab/delete", "/teacher/vocab-lists/vocab/edit"})
public class VocabController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionString = req.getServletPath();
        System.out.println("actionString tai do get la: " + actionString);
        switch (actionString) {
//            case "/vocab-lists/vocab/review": {
//                System.out.println("goi case /vocab-lists/vocab/review - doget");
//                review(req, resp);
//                break;
//            }

            case "/teacher/vocab-lists/vocab/create": {
                System.out.println("goi case /vocab-lists/vocab/create - doget");
                show(req, resp);
                break;
            }

            case "/teacher/vocab-lists/vocab/edit": {
                System.out.println("goi case /vocab-lists/vocab/delete - doget");
                show(req, resp);
                break;
            }

            case "/teacher/vocab-lists/vocab/delete": {
                System.out.println("goi case /vocab-lists/vocab/delete - doget");
                show(req, resp);
                break;
            }

            case "/teacher/vocab-lists/vocab": {
                System.out.println("goi case /vocab-lists/vocab - doget");
                show(req, resp);
                break;
            }
        }
    }

    // show
    public void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham show");
        int listID = Integer.parseInt(req.getParameter("listID"));
        System.out.println("list id can show la: " + listID);
        LinkedList<VocabModel> vocabModels = VocabService.all(listID);
        for (VocabModel vocabModel : vocabModels) {
            System.out.println(vocabModel.getVocabID());
        }
        VocabListsModel vocabListsModel=VocabListsService.find(listID);
        int number=VocabListsService.count(listID);
        req.setAttribute("number", number);
        req.setAttribute("vocablistmodel",vocabListsModel );
        req.setAttribute("listID", listID);
        req.setAttribute("vocabModels", vocabModels);
        req.setAttribute("courseModels", CourseService.allRecent(-1)); ;
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/vocab-lists/vocab/vocab.jsp");
        requestDispatcher.forward(req, resp);
    }

    // create
    public void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham create");
        int listID = Integer.parseInt(req.getParameter("listID"));
        System.out.println("listID de them tu vung vao: " + listID);
        String vocab = req.getParameter("vocab");
        String mean = req.getParameter("mean");
        String wordType = req.getParameter("wordType");
        String example = req.getParameter("example");
        String pronunciation = req.getParameter("pronunciation");
        Part part = req.getPart("image"); 
        String image = null;
		String realPart = req.getServletContext().getRealPath("/data"); 
		image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len 
        VocabModel vocabModel = new VocabModel(listID, vocab, mean, wordType, example, pronunciation, image);
        VocabService.add(vocabModel);
        resp.sendRedirect(req.getContextPath() + "/teacher/vocab-lists/vocab?listID=" + listID);
    }

//    // review
//    public void review(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("goi ham review");
//        int listID = Integer.parseInt(req.getParameter("listID"));
//        LinkedList<VocabModel> vocabModels = VocabService.all(listID);
//        req.setAttribute("listID", listID);
//        req.setAttribute("vocabModels", vocabModels);
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/review.jsp");
//        requestDispatcher.forward(req, resp);
//    }

    // delete
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham delete");
        int vocabID = Integer.parseInt(req.getParameter("vocabID"));
        System.out.println("vocabID la: " + req.getParameter("vocabID"));
        VocabService.delete(vocabID);
        int listID = Integer.parseInt(req.getParameter("listID"));
        resp.sendRedirect(req.getContextPath() + "/teacher/vocab-lists/vocab?listID=" + listID);
    }

    // edit
    protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham edit");
        System.out.println("bug: " +  req.getParameter("imageString"));
        int vocabID = Integer.parseInt(req.getParameter("vocabID"));
        String vocab = req.getParameter("vocab");
        String mean = req.getParameter("mean");
        String wordType = req.getParameter("wordType");
        String example = req.getParameter("example");
        String pronunciation = req.getParameter("pronunciation");
        Part part = req.getPart("image"); 
        String image = null;
        System.out.println("truoc if");     
        // ko xoa => co the them or ko lam gi
        System.out.println(req.getParameter("deleteImage")); 
        System.out.println(req.getParameter("deleteImage"));	
        if (req.getParameter("deleteImage") == null){     
        	System.out.println("vao day roi do ko chon xoa anh"); 
        	String realPart = req.getServletContext().getRealPath("/data"); 
    		image = FileData.add(part, realPart);  // tra ve null neu co form-group img nhung ko tai len 
    		// neu ko lam gi thi gan image bang imageString
    		System.out.println("truoc: "+image); 
    		if (image == null) {
    			image = req.getParameter("imageString"); 
    			System.out.println("imgstring: " +  req.getParameter("imageString"));
    		}       
        } 
        // truong hop ko co imageString tuc la chua them anh truoc do   
        else if (req.getParameter("imageString") == null) {
        	String realPart = req.getServletContext().getRealPath("/data"); 
    		image = FileData.add(part, realPart); 
        } 
        VocabModel vocabModel = new VocabModel(vocabID, 0, vocab, mean, wordType, example, pronunciation, image, null);
        VocabService.edit(vocabModel);
        int listID = Integer.parseInt(req.getParameter("listID"));
        resp.sendRedirect(req.getContextPath() + "/teacher/vocab-lists/vocab?listID=" + listID);
    }
    public void vocabInCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham show");
        int listID = Integer.parseInt(req.getParameter("listID"));
        System.out.println("list id can show la: " + listID);
        LinkedList<VocabModel> vocabModels = VocabService.all(listID);
        for (VocabModel vocabModel : vocabModels) {
            System.out.println(vocabModel.getVocabID());
        }
        VocabListsModel vocabListsModel=VocabListsService.find(listID);
        //LessionModel lessionModel =LessionService.getLessionByID(vocabListsModel.getLessionID());
       // req.setAttribute("courseID", lessionModel.getCourseID());
        int number=VocabListsService.count(listID);
        req.setAttribute("number", number);
        req.setAttribute("vocablistmodel",vocabListsModel );
        req.setAttribute("listID", listID);
        req.setAttribute("vocabModels", vocabModels);
        req.setAttribute("courseModels", CourseService.allRecent(-1)); 
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/vocab-lists/vocab/vocabInCourse.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi do post vocab-lists/vocab");
        String actionString = req.getServletPath();
        System.out.println("actionString tai do post la: " + actionString);
        switch (actionString) {
            case "/teacher/vocab-lists/vocab/create": {
                System.out.println("goi case /vocab-lists/vocab/create - dopost");
                create(req, resp);
                break;
            }

            case "/teacher/vocab-lists/vocab/delete": {
                System.out.println("goi case /vocab-lists/vocab/delete - dopost");
                delete(req, resp);
                break;
            }

            case "/teacher/vocab-lists/vocab/edit": {
                System.out.println("goi case /vocab-lists/vocab/edit - dopost");
                edit(req, resp);
                break;
            }
        }
    }
}
 