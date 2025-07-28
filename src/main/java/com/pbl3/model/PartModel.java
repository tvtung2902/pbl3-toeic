package com.pbl3.model;

public class PartModel {
	int partID;
	String partName;
	int orderNumber;
	public PartModel() {
	
	}
	public PartModel(int partID, String partName) {
		super();
		this.partID = partID;
		this.partName = partName;
	}
	
	public PartModel(int partID, String partName, int orderNumber) {
		super();
		this.partID = partID;
		this.partName = partName;
		this.orderNumber = orderNumber;
	}

	public int getPartID() {
		return partID;
	}

	public void setPartID(int partID) {
		this.partID = partID;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
 
}
