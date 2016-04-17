package com.cwb.atmweb.entity.param;

import com.cwb.atmweb.entity.Bank;

public class BankEmployeeInfo {
	private Bank bank;
	private int employeeNum;
	private int accountNum;
	public BankEmployeeInfo() {
		super();
	}
	public BankEmployeeInfo(Bank bank, int employeeNum, int accountNum) {
		super();
		this.bank = bank;
		this.employeeNum = employeeNum;
		this.accountNum = accountNum;
	}
	public Bank getBank() {
		return bank;
	}
	public void setBank(Bank bank) {
		this.bank = bank;
	}
	public int getEmployeeNum() {
		return employeeNum;
	}
	public void setEmployeeNum(int employeeNum) {
		this.employeeNum = employeeNum;
	}
	public int getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}
}
