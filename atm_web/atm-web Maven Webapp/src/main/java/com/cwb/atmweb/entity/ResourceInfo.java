package com.cwb.atmweb.entity;

/**
 * "accessPath":"",
 * "checked":false,
 * "delFlag":0,
 * "parentID":0,
 * "resourceCode":"",
 * "resourceDesc":"",
 * "resourceGrade":1,
 * "resourceID":1,
 * "resourceName":"总菜单",
 * "resourceOrder":0,
 * "resourceType":""
 * @author Administrator
 *
 */

public class ResourceInfo {

	private String accessPath;
	private String checked ="false";
	private String delFlag = "0";
	private String parentID;
	private String resourceCode;
	private String resourceDesc;
	private String resourceGrade;
	private String resourceID;
	private String resourceName;
	private String resourceOrder = "0";
	private String resourceType;
	public ResourceInfo(String accessPath, String parentID,
			String resourceGrade, String resourceID, String resourceName) {
		super();
		this.accessPath = accessPath;
		this.parentID = parentID;
		this.resourceGrade = resourceGrade;
		this.resourceID = resourceID;
		this.resourceName = resourceName;
	}
	public String getAccessPath() {
		return accessPath;
	}
	public void setAccessPath(String accessPath) {
		this.accessPath = accessPath;
	}
	public String getParentID() {
		return parentID;
	}
	public void setParentID(String parentID) {
		this.parentID = parentID;
	}
	public String getResourceGrade() {
		return resourceGrade;
	}
	public void setResourceGrade(String resourceGrade) {
		this.resourceGrade = resourceGrade;
	}
	public String getResourceID() {
		return resourceID;
	}
	public void setResourceID(String resourceID) {
		this.resourceID = resourceID;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	
	
	
}
