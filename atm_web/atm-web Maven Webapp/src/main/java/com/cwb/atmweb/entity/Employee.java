package com.cwb.atmweb.entity;

import java.util.Date;

public class Employee {
    private Long id;

    private Long employeeid;

    private String password;

    private String salt;

    private String employeename;

    private String personid;

    private String mobile;

    private String address;

    private String email;

    private String roleId;

    private Long bankid;

    private Date addbanktime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Long employeeid) {
        this.employeeid = employeeid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename == null ? null : employeename.trim();
    }

    public String getPersonid() {
        return personid;
    }

    public void setPersonid(String personid) {
        this.personid = personid == null ? null : personid.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public Long getBankid() {
        return bankid;
    }

    public void setBankid(Long bankid) {
        this.bankid = bankid;
    }

    public Date getAddbanktime() {
        return addbanktime;
    }

    public void setAddbanktime(Date addbanktime) {
        this.addbanktime = addbanktime;
    }

	@Override
	public String toString() {
		return "Employee [id=" + id + ", employeeid=" + employeeid
				+ ", password=" + password + ", salt=" + salt
				+ ", employeename=" + employeename + ", personid=" + personid
				+ ", mobile=" + mobile + ", address=" + address + ", email="
				+ email + ", roleId=" + roleId + ", bankid=" + bankid
				+ ", addbanktime=" + addbanktime + "]";
	}
    
}