package com.pbl3.model;

import java.util.*;
import java.text.SimpleDateFormat;

public class HistoryOfTestModel {
    private int historyOfTestID;
    private int userID;
    private int testID;
    private Date date;
    private int score;
    
    // Lay ngay thang nam
    public String showDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss ");
        return simpleDateFormat.format(date);
    }
    
    public HistoryOfTestModel() {
        
    }
    
    public HistoryOfTestModel(int userID, int testID, Date date, int score) {
        super();
        this.userID = userID;
        this.testID = testID;
        this.date = date;
        this.score = score;
    }

    public HistoryOfTestModel(int historyOfTestID, int userID, int testID, Date date, int score) {
        super();
        this.historyOfTestID = historyOfTestID;
        this.userID = userID;
        this.testID = testID;
        this.date = date;
        this.score = score;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getHistoryOfTestID() {
        return historyOfTestID;
    }

    public void setHistoryOfTestID(int historyOfTestID) {
        this.historyOfTestID = historyOfTestID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
