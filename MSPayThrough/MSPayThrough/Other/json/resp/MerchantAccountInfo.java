package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class MerchantAccountInfo extends BaseModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = 8980182142485860248L;

	private Integer mai_id;

    private Integer mbi_id;

    private String mbi_code = "";

    private Integer mai_type;

    private String mai_account_num = "";

    private String mai_account_name = "";

    private String mai_bank_province_code = "";

    private String mai_bank_province_name = "";

    private String mai_bank_city_code = "";

    private String mai_bank_city_name = "";

    private String mai_bank_code = "";

    private String mai_bank_name = "";

    private Integer mai_status;

    private String mai_remark = "";

    private Date mai_create_time;

    private Date mai_update_time;

    public Integer getMai_id() {
        return mai_id;
    }

    public void setMai_id(Integer mai_id) {
        this.mai_id = mai_id;
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

    public Integer getMai_type() {
        return mai_type;
    }

    public void setMai_type(Integer mai_type) {
        this.mai_type = mai_type;
    }

    public String getMai_account_num() {
        return mai_account_num;
    }

    public void setMai_account_num(String mai_account_num) {
        this.mai_account_num = mai_account_num == null ? null : mai_account_num.trim();
    }

    public String getMai_account_name() {
        return mai_account_name;
    }

    public void setMai_account_name(String mai_account_name) {
        this.mai_account_name = mai_account_name == null ? null : mai_account_name.trim();
    }

    public String getMai_bank_province_code() {
        return mai_bank_province_code;
    }

    public void setMai_bank_province_code(String mai_bank_province_code) {
        this.mai_bank_province_code = mai_bank_province_code == null ? null : mai_bank_province_code.trim();
    }

    public String getMai_bank_province_name() {
        return mai_bank_province_name;
    }

    public void setMai_bank_province_name(String mai_bank_province_name) {
        this.mai_bank_province_name = mai_bank_province_name == null ? null : mai_bank_province_name.trim();
    }

    public String getMai_bank_city_code() {
        return mai_bank_city_code;
    }

    public void setMai_bank_city_code(String mai_bank_city_code) {
        this.mai_bank_city_code = mai_bank_city_code == null ? null : mai_bank_city_code.trim();
    }

    public String getMai_bank_city_name() {
        return mai_bank_city_name;
    }

    public void setMai_bank_city_name(String mai_bank_city_name) {
        this.mai_bank_city_name = mai_bank_city_name == null ? null : mai_bank_city_name.trim();
    }

    public String getMai_bank_code() {
        return mai_bank_code;
    }

    public void setMai_bank_code(String mai_bank_code) {
        this.mai_bank_code = mai_bank_code == null ? null : mai_bank_code.trim();
    }

    public String getMai_bank_name() {
        return mai_bank_name;
    }

    public void setMai_bank_name(String mai_bank_name) {
        this.mai_bank_name = mai_bank_name == null ? null : mai_bank_name.trim();
    }

    public Integer getMai_status() {
        return mai_status;
    }

    public void setMai_status(Integer mai_status) {
        this.mai_status = mai_status;
    }

    public String getMai_remark() {
        return mai_remark;
    }

    public void setMai_remark(String mai_remark) {
        this.mai_remark = mai_remark == null ? null : mai_remark.trim();
    }

    public Date getMai_create_time() {
        return mai_create_time;
    }

    public void setMai_create_time(Date mai_create_time) {
        this.mai_create_time = mai_create_time;
    }

    public Date getMai_update_time() {
        return mai_update_time;
    }

    public void setMai_update_time(Date mai_update_time) {
        this.mai_update_time = mai_update_time;
    }
}