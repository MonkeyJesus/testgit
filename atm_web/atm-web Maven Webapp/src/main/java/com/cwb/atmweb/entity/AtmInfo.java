package com.cwb.atmweb.entity;

import java.util.Date;

public class AtmInfo {
    private Long id;

    private Long bankid;

    private String brand;

    private String model;

    private Date createtime;

    private Long firstmoney;

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
        this.brand = brand == null ? null : brand.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
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