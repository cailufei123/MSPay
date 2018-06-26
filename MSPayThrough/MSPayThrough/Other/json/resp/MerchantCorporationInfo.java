package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class MerchantCorporationInfo extends BaseModel {
    private Integer mcorpi_id;

    private Integer mbi_id;

    private String mbi_code;

    private String mcorpi_name;

    private String mcorpi_ic_type;

    private String mcorpi_ic_num;

    private String mcorpi_mobile;

    private String mcorpi_email;

    private String mcorpi_ic_front;

    private String mcorpi_ic_back;

    private String mcorpi_ic_group;

    private Date mcorpi_create_time;

    private Date mcorpi_update_time;

    private String mcorpi_remark;

    public Integer getMcorpi_id() {
        return mcorpi_id;
    }

    public void setMcorpi_id(Integer mcorpi_id) {
        this.mcorpi_id = mcorpi_id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getMbi_id() {
        return mbi_id;
    }

    public void setMbi_id(Integer mbi_id) {
        this.mbi_id = mbi_id;
    }

    public String getMbi_code() {
        return mbi_code;
    }

    public void setMbi_code(String mbi_code) {
        this.mbi_code = mbi_code == null ? null : mbi_code.trim();
    }

    public String getMcorpi_name() {
        return mcorpi_name;
    }

    public void setMcorpi_name(String mcorpi_name) {
        this.mcorpi_name = mcorpi_name == null ? null : mcorpi_name.trim();
    }

    public String getMcorpi_ic_type() {
        return mcorpi_ic_type;
    }

    public void setMcorpi_ic_type(String mcorpi_ic_type) {
        this.mcorpi_ic_type = mcorpi_ic_type == null ? null : mcorpi_ic_type.trim();
    }

    public String getMcorpi_ic_num() {
        return mcorpi_ic_num;
    }

    public void setMcorpi_ic_num(String mcorpi_ic_num) {
        this.mcorpi_ic_num = mcorpi_ic_num == null ? null : mcorpi_ic_num.trim();
    }

    public String getMcorpi_mobile() {
        return mcorpi_mobile;
    }

    public void setMcorpi_mobile(String mcorpi_mobile) {
        this.mcorpi_mobile = mcorpi_mobile == null ? null : mcorpi_mobile.trim();
    }

    public String getMcorpi_email() {
        return mcorpi_email;
    }

    public void setMcorpi_email(String mcorpi_email) {
        this.mcorpi_email = mcorpi_email == null ? null : mcorpi_email.trim();
    }

    public String getMcorpi_ic_front() {
        return mcorpi_ic_front;
    }

    public void setMcorpi_ic_front(String mcorpi_ic_front) {
        this.mcorpi_ic_front = mcorpi_ic_front == null ? null : mcorpi_ic_front.trim();
    }

    public String getMcorpi_ic_back() {
        return mcorpi_ic_back;
    }

    public void setMcorpi_ic_back(String mcorpi_ic_back) {
        this.mcorpi_ic_back = mcorpi_ic_back == null ? null : mcorpi_ic_back.trim();
    }

    public String getMcorpi_ic_group() {
        return mcorpi_ic_group;
    }

    public void setMcorpi_ic_group(String mcorpi_ic_group) {
        this.mcorpi_ic_group = mcorpi_ic_group == null ? null : mcorpi_ic_group.trim();
    }

    public Date getMcorpi_create_time() {
        return mcorpi_create_time;
    }

    public void setMcorpi_create_time(Date mcorpi_create_time) {
        this.mcorpi_create_time = mcorpi_create_time;
    }

    public Date getMcorpi_update_time() {
        return mcorpi_update_time;
    }

    public void setMcorpi_update_time(Date mcorpi_update_time) {
        this.mcorpi_update_time = mcorpi_update_time;
    }

    public String getMcorpi_remark() {
        return mcorpi_remark;
    }

    public void setMcorpi_remark(String mcorpi_remark) {
        this.mcorpi_remark = mcorpi_remark == null ? null : mcorpi_remark.trim();
    }
}