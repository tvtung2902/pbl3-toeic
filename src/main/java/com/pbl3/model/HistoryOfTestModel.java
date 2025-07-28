package com.pbl3.model;

import java.util.*;
import java.text.SimpleDateFormat;

public class HistoryOfTestModel {
    private int historyOfTestID;
    private int userID;
    private int testID;
    private Date date;
    
    public String showDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return simpleDateFormat.format(date);
    }
    
    public HistoryOfTestModel() {
        
    }
    
    public HistoryOfTestModel(int userID, int testID, Date date) {
        super();
        this.userID = userID;
        this.testID = testID;
        this.date = date;
    }

    public HistoryOfTestModel(int historyOfTestID, int userID, int testID, Date date) {
        super();
        this.historyOfTestID = historyOfTestID;
        this.userID = userID;
        this.testID = testID;
        this.date = date;
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
