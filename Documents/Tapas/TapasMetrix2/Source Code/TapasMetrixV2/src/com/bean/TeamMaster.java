package com.bean;

public class TeamMaster {

	private String teamId;
	private String teamName;
	private String teamDesc;
	private String workLocation;
	private int isActive;

	public TeamMaster() {
		super();
	}

	public TeamMaster(String teamId, String teamName, String teamDesc, String workLocation, int isActive) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.teamDesc = teamDesc;
		this.workLocation = workLocation;
		this.isActive = isActive;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamDesc() {
		return teamDesc;
	}

	public void setTeamDesc(String teamDesc) {
		this.teamDesc = teamDesc;
	}

	public String getWorkLocation() {
		return workLocation;
	}

	public void setWorkLocation(String workLocation) {
		this.workLocation = workLocation;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "TeamMaster [teamId=" + teamId + ", teamName=" + teamName
				+ ", teamDesc=" + teamDesc + ", workLocation=" + workLocation
				+ ", isActive=" + isActive + "]";
	}
}