package com.bean;

public class UserMaster {

	private String userId;
	private String userName;
	private String password;
	private String userRole;
	private String LTEmail;
	private String SonyEmail;
	private String userWorkLocation;
	private String teamId;
	private String firstName;
	private String lastName;
	private int isActive;


	public UserMaster() {
		super();
	}

	public UserMaster(String userId, String userName, String password, String userRole, String lTEmail, String sonyEmail, String userWorkLocation, String teamId, String firstName, String lastName, int isActive) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.userRole = userRole;
		this.LTEmail = lTEmail;
		this.SonyEmail = sonyEmail;
		this.userWorkLocation = userWorkLocation;
		this.teamId = teamId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.isActive = isActive;
	}



	@Override
	public String toString() {
		return "UserMaster [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", userRole=" + userRole
				+ ", LTEmail=" + LTEmail + ", SonyEmail=" + SonyEmail
				+ ", userWorkLocation=" + userWorkLocation + ", teamId="
				+ teamId + ", firstName=" + firstName + ", lastName="
				+ lastName + ", isActive=" + isActive + "]";
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getLTEmail() {
		return LTEmail;
	}

	public void setLTEmail(String lTEmail) {
		LTEmail = lTEmail;
	}

	public String getSonyEmail() {
		return SonyEmail;
	}

	public void setSonyEmail(String sonyEmail) {
		SonyEmail = sonyEmail;
	}

	public String getUserWorkLocation() {
		return userWorkLocation;
	}

	public void setUserWorkLocation(String userWorkLocation) {
		this.userWorkLocation = userWorkLocation;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
}