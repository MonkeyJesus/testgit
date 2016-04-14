package com.cwb.atmweb.entity;

public class Bank {
    private Long id;

    private String bankname;
    
    private int areaId;

    private Long parentid;

    private String parentIds;

    private Integer level;

    private Double totalfunds;

    private Double totaldeposit;

    private Double totalwithdraw;

    private Double totaloverdraft;

    private Double totalloan;

	public Bank() {
		super();
	}

	public Bank(Long id, String bankname, int areaId, Long parentid,
			String parentIds, Integer level, Double totalfunds,
			Double totaldeposit, Double totalwithdraw, Double totaloverdraft,
			Double totalloan) {
		super();
		this.id = id;
		this.bankname = bankname;
		this.areaId = areaId;
		this.parentid = parentid;
		this.parentIds = parentIds;
		this.level = level;
		this.totalfunds = totalfunds;
		this.totaldeposit = totaldeposit;
		this.totalwithdraw = totalwithdraw;
		this.totaloverdraft = totaloverdraft;
		this.totalloan = totalloan;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public Long getParentid() {
		return parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Double getTotalfunds() {
		return totalfunds;
	}

	public void setTotalfunds(Double totalfunds) {
		this.totalfunds = totalfunds;
	}

	public Double getTotaldeposit() {
		return totaldeposit;
	}

	public void setTotaldeposit(Double totaldeposit) {
		this.totaldeposit = totaldeposit;
	}

	public Double getTotalwithdraw() {
		return totalwithdraw;
	}

	public void setTotalwithdraw(Double totalwithdraw) {
		this.totalwithdraw = totalwithdraw;
	}

	public Double getTotaloverdraft() {
		return totaloverdraft;
	}

	public void setTotaloverdraft(Double totaloverdraft) {
		this.totaloverdraft = totaloverdraft;
	}

	public Double getTotalloan() {
		return totalloan;
	}

	public void setTotalloan(Double totalloan) {
		this.totalloan = totalloan;
	}

}