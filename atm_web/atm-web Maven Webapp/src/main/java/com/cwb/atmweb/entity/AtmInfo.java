package com.cwb.atmweb.entity;

public class AtmInfo {
    private Long id;

    private Long bankid;

    private String equipmentinfo;

    private Integer idbreakdown;

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

    public String getEquipmentinfo() {
        return equipmentinfo;
    }

    public void setEquipmentinfo(String equipmentinfo) {
        this.equipmentinfo = equipmentinfo == null ? null : equipmentinfo.trim();
    }

    public Integer getIdbreakdown() {
        return idbreakdown;
    }

    public void setIdbreakdown(Integer idbreakdown) {
        this.idbreakdown = idbreakdown;
    }
}