package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;
import com.pbl3.service.VocabListsService;
import com.pbl3.service.VocabService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/vocab-lists/vocab", "/vocab-lists/vocab/create", "/vocab-lists/vocab/review", "/vocab-lists/vocab/delete", "/vocab-lists/vocab/edit"})
public class VocabController extends HttpServlet {

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

            case "/vocab-lists/vocab/create": {
                System.out.println("goi case /vocab-lists/vocab/create - doget");
                show(req, resp);
                break;
            }

            case "/vocab-lists/vocab/edit": {
                System.out.println("goi case /vocab-lists/vocab/delete - doget");
                show(req, resp);
                break;
            }

            case "/vocab-lists/vocab/delete": {
                System.out.println("goi case /vocab-lists/vocab/delete - doget");
                show(req, resp);
                break;
            }

            case "/vocab-lists/vocab": {
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
        req.setAttribute("listID", listID);
        req.setAttribute("vocabModels", vocabModels);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/vocab.jsp");
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
        VocabModel vocabModel = new VocabModel(listID, vocab, mean, wordType, example);
        VocabService.add(vocabModel);
        resp.sendRedirect(req.getContextPath() + "/vocab-lists/vocab?listID=" + listID);
    }

    // review
    public void review(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham review");
        int listID = Integer.parseInt(req.getParameter("listID"));
        LinkedList<VocabModel> vocabModels = VocabService.all(listID);
        req.setAttribute("listID", listID);
        req.setAttribute("vocabModels", vocabModels);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/vocab-lists/vocab/review.jsp");
        requestDispatcher.forward(req, resp);
    }

    // delete
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham delete");
        int vocabID = Integer.parseInt(req.getParameter("vocabID"));
        System.out.println("vocabID la: " + req.getParameter("vocabID"));
        VocabService.delete(vocabID);
        int listID = Integer.parseInt(req.getParameter("listID"));
        resp.sendRedirect(req.getContextPath() + "/vocab-lists/vocab?listID=" + listID);
    }

    // edit
    protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi ham edit");
        int vocabID = Integer.parseInt(req.getParameter("vocabID"));
        String vocab = req.getParameter("vocab");
        String mean = req.getParameter("mean");
        String wordType = req.getParameter("wordType");
        String example = req.getParameter("example");
        VocabModel vocabModel = new VocabModel(vocabID, 0, vocab, mean, wordType, example);
        VocabService.edit(vocabModel);
        int listID = Integer.parseInt(req.getParameter("listID"));
        resp.sendRedirect(req.getContextPath() + "/vocab-lists/vocab?listID=" + listID);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("goi do post vocab-lists/vocab");
        String actionString = req.getServletPath();
        System.out.println("actionString tai do post la: " + actionString);
        switch (actionString) {
            case "/vocab-lists/vocab/create": {
                System.out.println("goi case /vocab-lists/vocab/create - dopost");
                create(req, resp);
                break;
            }

            case "/vocab-lists/vocab/delete": {
                System.out.println("goi case /vocab-lists/vocab/delete - dopost");
                delete(req, resp);
                break;
            }

            case "/vocab-lists/vocab/edit": {
                System.out.println("goi case /vocab-lists/vocab/edit - dopost");
                edit(req, resp);
                break;
            }
        }
    }
}
