package com.bean;

public class RoleMaster {

	private String roleId;
	private String roleName;
	private String roleDesc;
	private String teamId;
	private int isActive;

	public RoleMaster() {
		super();
	}

	public RoleMaster(String roleId, String roleName, String roleDesc, String teamId, int isActive) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.teamId = teamId;
		this.isActive = isActive;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "RoleMaster [roleId=" + roleId + ", roleName=" + roleName
				+ ", roleDesc=" + roleDesc + ", teamId=" + teamId
				+ ", isActive=" + isActive + "]";
	}
}