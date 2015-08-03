package com.bean;

public class ActivityMaster {

	private String activityId;
	private String activityName;
	private String activityDesc;
	private String parentActivity;
	private int isActive;

	public ActivityMaster() {
		super();
	}

	public ActivityMaster(String activityId, String activityName, String activityDesc, String parentActivity, int isActive) {

		super();
		this.activityId = activityId;
		this.activityName = activityName;
		this.activityDesc = activityDesc;
		this.parentActivity = parentActivity;
		this.isActive = isActive;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getActivityDesc() {
		return activityDesc;
	}

	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}

	public String getParentActivity() {
		return parentActivity;
	}

	public void setParentActivity(String parentActivity) {
		this.parentActivity = parentActivity;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "ActivityMaster [activityId=" + activityId + ", activityName="
				+ activityName + ", activityDesc=" + activityDesc
				+ ", parentActivity=" + parentActivity + ", isActive="
				+ isActive + "]";
	}
}