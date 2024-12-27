package com.pbl3.controller.teacher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.pbl3.libs.FileData;
import com.pbl3.libs.Pair;
import com.pbl3.model.DataQuestionModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TypeOneQuestionModel;
import com.pbl3.model.TypeTwoQuestionModel;
import com.pbl3.service.DataQuestionService;
import com.pbl3.service.QuestionService;
import com.pbl3.service.TypeOneQuestionService;
import com.pbl3.service.TypeQuestionService;
import com.pbl3.service.TypeTwoQuestionService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet(urlPatterns = { "/teacher/tests/part", "/teacher/tests/part/create", "/teacher/tests/part/edit",
		"/teacher/tests/part/delete","/teacher/tests/part/format"})
public class QuestionInTestsController	 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do get la: " + actionString);
		switch (actionString) {
		case "/teacher/tests/part": {
			show(req, resp);
			break;
		}
		case "/teacher/tests/part/format": {
			format(req, resp);
			break;
		}
		}
	}
	
	private boolean full(int total, QuestionModel[] questionModels) {
		int cnt = 0;
		for (QuestionModel q : questionModels) {
			if(q.getQuestionID() != 0) {
				cnt ++;
			}
		}
		if (cnt == total) {
			return false;
		}
		else {
			return true;
		}
	}

	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println("testsID can truy van cac cau hoi la: " + testsID);
		int partID = Integer.parseInt(req.getParameter("partID"));
		int begin = 0, end = 0, total = 0;
		String str = "";
		switch (partID) {
		case 1: {
			str = "/views/teacher/tests/question/question-part1.jsp";
			begin = 1;
			end = 6;
			total = 6;
			break;
		}
		case 2: {
			str = "/views/teacher/tests/question/question-part1.jsp";
			begin = 7;
			end = 31;
			total = 25;
			break;
		}
		case 3: {
			str = "/views/teacher/tests/question/question-part3.jsp";
			begin = 32;
			end = 70;
			total = 39;
			break;
		}
		case 4: {
			str = "/views/teacher/tests/question/question-part3.jsp";
			begin = 71;
			end = 100;
			total = 30;
			break;
		}
		case 5: {
			str = "/views/teacher/tests/question/question-part1.jsp";
			begin = 101;
			end = 130;
			total = 30; 
			break;
		}
		case 6: {
			str = "/views/teacher/tests/question/question-part3.jsp";
			begin = 131;
			end = 146;
			total = 16;
			break;
		}
		case 7: {
			str = "/views/teacher/tests/question/question-part7.jsp";
			begin = 147;
			end = 200;
			total = 54;
			break; 
		}
		}
		
		QuestionModel[] questionModels = new QuestionModel[total + 1];
		System.out.println(questionModels.length + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		for (int i = 0; i < total + 1; i++) {
			if(i <= 31) {
				questionModels[i] = new TypeOneQuestionModel();
			}
			else {
				questionModels[i] = new TypeTwoQuestionModel();
			}
		}
		if (partID==1 || partID==2) {
			TypeOneQuestionService.allTypeOneQuestion(testsID, begin, end, questionModels);
			req.setAttribute("questionModels", questionModels);
			System.err.println(full(total, questionModels));
			req.setAttribute("isFull", full(total, questionModels));
			System.out.println("total:"+ total +", đang có:"+questionModels.length +","+full(total, questionModels));
		} 
		else if (partID==5) {
			TypeTwoQuestionService.allTypeTwoQuestion(testsID, begin, end, questionModels);
			req.setAttribute("questionModels", questionModels);
			req.setAttribute("isFull", full(total, questionModels));
			System.out.println("total:"+ total +", đang có:"+questionModels.length +","+full(total, questionModels));
		}
		else{
			System.err.println("đây là show quession part 3 4 6");
			TypeTwoQuestionService.allTypeTwoQuestion(testsID, begin, end, questionModels);
			LinkedList<DataQuestionModel> dataQuestionModels =  DataQuestionService.all(testsID, partID);
			ArrayList<Pair<DataQuestionModel, LinkedList<QuestionModel>>> arrayList = new ArrayList<Pair<DataQuestionModel, LinkedList<QuestionModel>>>();
			
			for(DataQuestionModel dataQuestionModel : dataQuestionModels) {  
				LinkedList<QuestionModel> list = new LinkedList<QuestionModel>();
				for (QuestionModel questionModel : questionModels) {
					if(questionModel.getDataQuestionID()== dataQuestionModel.getDataQuestionID()) {
						list.add(questionModel);
					}
				}		
				Pair<DataQuestionModel, LinkedList<QuestionModel>> pair = new Pair<DataQuestionModel, LinkedList<QuestionModel>>(dataQuestionModel, list);
				arrayList.add(pair);
			}
			int questionCount = 0;
			if (partID == 3 || partID == 4) questionCount = 3;
			else if (partID == 6) questionCount = 4;
			else questionCount=total;			
			req.setAttribute("questionCount", questionCount);
			req.setAttribute("questionModels", arrayList);
			System.out.println("total:"+ total +", đang có:"+questionModels.length +","+full(total, questionModels));
			req.setAttribute("isFull", full(total, questionModels)); 
			
		}
		RequestDispatcher requestDispatcher = req.getRequestDispatcher(str);
		req.setAttribute("typeQuestionModels", TypeQuestionService.all(partID));
		requestDispatcher.forward(req, resp);
		for(int i = 1; i < questionModels.length; i++) {
			System.err.println(questionModels[i].getQuestionID() + " " + questionModels[i].getOrderNumber());
		} 
		}

	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.err.println("goi ham create");
		Integer typeQuestionID = Integer.parseInt(req.getParameter("typeQuestionID"));
		int partID = Integer.parseInt(req.getParameter("partID"));
		Integer testsID = Integer.parseInt(req.getParameter("testsID"));
		String answerCorrect = req.getParameter("answerCorrect");
		String answerExplain = req.getParameter("answerExplain");
		int orderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		Integer dataQuestionID = null;
		if (req.getParameter("dataQuestionID") != null) {
			dataQuestionID = Integer.parseInt(req.getParameter("dataQuestionID")); 
		}  
		// lay part anh ve 
		Part part = req.getPart("image"); 
		String image = null;
		// neu co form-group img (kh phai part 2, 5) 
		if (part != null) { 
			System.out.println("part != null vi ko phai them o part 2 va 5");
			String realPart = req.getServletContext().getRealPath("/data");
			image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len  
	 	}
		
		if (orderNumber >= 1 && orderNumber <= 31) {
			// lay part audio ve 
			Part partAudio = req.getPart("audio"); 
			String audio = null;
			// neu co form-group audio (kh phai phan doc) 
			if (partAudio != null) { 
			System.out.println("partAudio != null");
			String realPart = req.getServletContext().getRealPath("/data");
			audio = FileData.add(partAudio, realPart); // tra ve null neu co form-group audio nhung ko tai len  
	 		}
			String transcript = req.getParameter("transcript");
			TypeOneQuestionModel typeOneQuestionModel = new TypeOneQuestionModel(0, typeQuestionID, testsID, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, null, audio, transcript) ;
			int questionID = QuestionService.add(typeOneQuestionModel);
			typeOneQuestionModel.setQuestionID(questionID);
			TypeOneQuestionService.add(typeOneQuestionModel);
		} 
		else {  
			String questionContent = req.getParameter("questionContent");
			String contentAnswerA = req.getParameter("contentAnswerA");
			String contentAnswerB = req.getParameter("contentAnswerB");
			String contentAnswerC = req.getParameter("contentAnswerC");
			String ContentAnswerD = req.getParameter("contentAnswerD");
			TypeTwoQuestionModel typeTwoQuestionModel = new TypeTwoQuestionModel(0, typeQuestionID, testsID, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, null, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, questionContent);
			System.err.println("âa" +typeTwoQuestionModel.getDataQuestionID());
			int questionID = QuestionService.add(typeTwoQuestionModel); 
			typeTwoQuestionModel.setQuestionID(questionID);     
			TypeTwoQuestionService.add(typeTwoQuestionModel);  
		}   
		resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID=" + partID +"&testsID=" + testsID);
	}

	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int questionID = Integer.parseInt(req.getParameter("questionID"));
		Integer typeQuestionID = Integer.parseInt(req.getParameter("typeQuestionID"));
		int partID = Integer.parseInt(req.getParameter("partID"));
		Integer testsID = Integer.parseInt(req.getParameter("testsID"));
		String answerCorrect = req.getParameter("answerCorrect"); 
		String answerExplain = req.getParameter("answerExplain");
		int orderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		Integer dataQuestionID = null;
		if (req.getParameter("dataQuestionID") != null) {
			dataQuestionID = Integer.parseInt(req.getParameter("dataQuestionID")); 
		} 
		// lay part anh ve 
		Part part = req.getPart("image"); 
		String image = null;
		// neu co form-group img (kh phai part 2, 5)  
		if (part != null) { 
			System.out.println("part != null vi ko phai them o part 2 va 5");
			String realPart = req.getServletContext().getRealPath("/data");
			image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len  
			// lay lai anh cu neu ko them gi
			if(image == null) {
				image = req.getParameter("imageString");
			} 
		}

		if (orderNumber >= 1 && orderNumber <= 31) {  
			// lay part audio ve 
			Part partAudio = req.getPart("audio"); 
			String audio = null;
			// neu co form-group audio (kh phai phan doc) 
			if (partAudio != null) { 
			System.out.println("partAudio != null");
			String realPart = req.getServletContext().getRealPath("/data");
			audio = FileData.add(partAudio, realPart); // tra ve null neu co form-group audio nhung ko tai len  
			if(audio == null) {
				audio = req.getParameter("audioString");
			}
			}     
			String transcript = req.getParameter("transcript");
			TypeOneQuestionModel typeOneQuestionModel = new TypeOneQuestionModel(questionID, typeQuestionID, testsID, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, null, audio, transcript);
			QuestionService.edit(typeOneQuestionModel);  
			TypeOneQuestionService.edit(typeOneQuestionModel); 
		} 
		
		else {
			String questionContent = req.getParameter("questionContent");
			String contentAnswerA = req.getParameter("contentAnswerA");
			String contentAnswerB = req.getParameter("contentAnswerB");
			String contentAnswerC = req.getParameter("contentAnswerC");
			String ContentAnswerD = req.getParameter("contentAnswerD");
			TypeTwoQuestionModel typeTwoQuestionModel = new TypeTwoQuestionModel(questionID, typeQuestionID, testsID, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, null, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, questionContent);
			QuestionService.edit(typeTwoQuestionModel);  
			TypeTwoQuestionService.edit(typeTwoQuestionModel);  
		}
		 
		resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID="+ partID + "&testsID=" + testsID);
	} 
     
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Gọi hàm delete");
		// xóa ảnh củ đi cu ơi....
		
		int questionID = Integer.parseInt(req.getParameter("questionID"));
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		int partID = Integer.parseInt(req.getParameter("partID"));
		System.out.println("questionID cần xóa là: " + req.getParameter("questionID"));
		QuestionService.delete(questionID);
		resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID="+ partID + "&testsID=" + testsID);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do post la: " + actionString);
		switch (actionString) {
		case "/teacher/tests/part/create": {
			System.out.println("goi case /teacher/question/create - do post");
			create(req, resp);
			break;
		}
		case "/teacher/tests/part/edit": {
			System.out.println("goi case /teacher/question/create - dogest");
			edit(req, resp);
			break;
		}
		case "/teacher/tests/part/delete": {
			System.out.println("goi case /teacher/question/create - dogest");
			delete(req, resp);
			break;
		}
		}
	}
	protected void format(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.err.println(testsID);
		TypeTwoQuestionService.format(testsID);
		
		
		resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID="+ 7 + "&testsID=" + testsID);
	}
}
