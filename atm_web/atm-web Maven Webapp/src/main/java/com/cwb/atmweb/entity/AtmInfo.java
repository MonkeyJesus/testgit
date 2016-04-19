package com.cwb.atmweb.entity;

import java.util.Date;

public class AtmInfo {
    private Long id;

    private Long bankid;

    private String brand;

    private String model;
    
    private int reader;
    
    private int printer;
    
    private int scanner;
    
    private int depositSys;
    
    private int drawSys;

    private Date createtime;

    private Long firstmoney;

	public AtmInfo() {
		super();
	}

	public AtmInfo(Long id, Long bankid, String brand, String model, int reader, int printer, int scanner,
			int depositSys, int drawSys, Date createtime, Long firstmoney) {
		super();
		this.id = id;
		this.bankid = bankid;
		this.brand = brand;
		this.model = model;
		this.reader = reader;
		this.printer = printer;
		this.scanner = scanner;
		this.depositSys = depositSys;
		this.drawSys = drawSys;
		this.createtime = createtime;
		this.firstmoney = firstmoney;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getBankid() {
		return bankid;
	}

	public void setBankid(Long bankid) {
		this.bankid = bankid;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getReader() {
		return reader;
	}

	public void setReader(int reader) {
		this.reader = reader;
	}

	public int getPrinter() {
		return printer;
	}

	public void setPrinter(int printer) {
		this.printer = printer;
	}

	public int getScanner() {
		return scanner;
	}

	public void setScanner(int scanner) {
		this.scanner = scanner;
	}

	public int getDepositSys() {
		return depositSys;
	}

	public void setDepositSys(int depositSys) {
		this.depositSys = depositSys;
	}

	public int getDrawSys() {
		return drawSys;
	}

	public void setDrawSys(int drawSys) {
		this.drawSys = drawSys;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Long getFirstmoney() {
		return firstmoney;
	}

	public void setFirstmoney(Long firstmoney) {
		this.firstmoney = firstmoney;
	}

}