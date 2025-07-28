package com.pbl3.model;

public class UserModel {
	private int userID;
	private String name;
	private String phone;
	private String email;
	private Boolean gender;
	private String image;
	private String userName;
	private String password;
	private boolean status;
	private RoleModel roleModel;
	private String description;
	
	public UserModel() {
		
	}
	
	public UserModel(String email, String userName, String password, RoleModel roleModel, boolean status, String name) {
		super();
		this.email = email;
		this.userName = userName;
		this.password = password;
		this.roleModel = roleModel;
		this.status = status;
		this.name = name;
	}
	public UserModel(String name, String phone, String email, Boolean gender, String image, String userName,
			String password, RoleModel roleModel, boolean status, String description) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.image = image;
		this.userName = userName;
		this.password = password;
		this.roleModel = roleModel;
		this.status = status;
		this.description = description;
	}
	public UserModel(int userID, String name, String phone, String email, Boolean gender, String image, String userName,
			String password, RoleModel roleModel, boolean status, String description) {
		super();
		this.userID = userID;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.image = image;
		this.userName = userName;
		this.password = password;
		this.roleModel = roleModel;
		this.status = status;
		this.description = description;
	}
	public RoleModel getRoleModel() {
		return roleModel;
	}

	public void setRoleModel(RoleModel roleModel) {
		this.roleModel = roleModel;
	}

	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Boolean getGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
