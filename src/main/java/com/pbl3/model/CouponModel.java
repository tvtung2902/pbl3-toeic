package com.pbl3.model;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class CouponModel {
    private int couponID;
    private String code;
    private Date startDate;
    private Date endDate;
    private int quantity;
    private int quantityUsed;
    private int percent;
    
    public String getFormattedStartDate(String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(startDate);
    }
    
    public String getFormattedEndDate(String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(endDate);
    }
    
    public String showDate(Date date) { 
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }
    
    public CouponModel() {
    	
    }
    
    public CouponModel(int couponID, Date startDate, Date endDate, int quantity,int percent) {
		super();
		this.couponID = couponID;
		this.startDate = startDate;
		this.endDate = endDate;
		this.quantity = quantity;
		this.percent = percent;
	}

	public CouponModel(int couponID, String code, Date startDate, Date endDate, int quantity, int quantityUsed, int percent) {
        super();
        this.couponID = couponID;
        this.code = code;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
        this.quantityUsed = quantityUsed;
        this.percent = percent;
    }

    public CouponModel(String code, Date startDate, Date endDate, int quantity, int quantityUsed, int percent) {
        super();
        this.code = code;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
        this.quantityUsed = quantityUsed;
        this.percent = percent;
    }

    public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public int getCouponID() {
        return couponID;
    }

    public void setCouponID(int couponID) {
        this.couponID = couponID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantityUsed() {
        return quantityUsed;
    }

    public void setQuantityUsed(int quantityUsed) {
        this.quantityUsed = quantityUsed;
    }
}
