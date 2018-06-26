package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class MerchantContactsInfo extends BaseModel {
    /**
     *
     */
    private static final long serialVersionUID = -6025649506554176302L;

    private Integer mci_id;

    private Integer mbi_id;

    private String mbi_code;

    private String mci_name;

    private String mci_icon;

    private String mci_id_card;

    private String mci_sign_org_name;

    private String mci_period_of_validity;

    private String mci_email;

    private String mci_mobile_phone;

    private String mci_login_pwd;

    private String mci_salt;

    private String mci_phone;

//    private Date mci_create_time;
//
//    private Date mci_update_time;

    public Integer getMci_id() {
        return mci_id;
    }

    public void setMci_id(Integer mci_id) {
        this.mci_id = mci_id;
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

    public String getMci_name() {
        return mci_name;
    }

    public void setMci_name(String mci_name) {
        this.mci_name = mci_name == null ? null : mci_name.trim();
    }

    public String getMci_icon() {
        return mci_icon;
    }

    public void setMci_icon(String mci_icon) {
        this.mci_icon = mci_icon;
    }

    public String getMci_id_card() {
        return mci_id_card;
    }

    public void setMci_id_card(String mci_id_card) {
        this.mci_id_card = mci_id_card == null ? null : mci_id_card.trim();
    }

    public String getMci_sign_org_name() {
        return mci_sign_org_name;
    }

    public void setMci_sign_org_name(String mci_sign_org_name) {
        this.mci_sign_org_name = mci_sign_org_name == null ? null : mci_sign_org_name.trim();
    }

    public String getMci_email() {
        return mci_email;
    }

    public void setMci_email(String mci_email) {
        this.mci_email = mci_email == null ? null : mci_email.trim();
    }

    public String getMci_mobile_phone() {
        return mci_mobile_phone;
    }

    public void setMci_mobile_phone(String mci_mobile_phone) {
        this.mci_mobile_phone = mci_mobile_phone == null ? null : mci_mobile_phone.trim();
    }

    public String getMci_phone() {
        return mci_phone;
    }

    public void setMci_phone(String mci_phone) {
        this.mci_phone = mci_phone == null ? null : mci_phone.trim();
    }
//
//    public Date getMci_create_time() {
//        return mci_create_time;
//    }
//
//    public void setMci_create_time(Date mci_create_time) {
//        this.mci_create_time = mci_create_time;
//    }
//
//    public Date getMci_update_time() {
//        return mci_update_time;
//    }
//
//    public void setMci_update_time(Date mci_update_time) {
//        this.mci_update_time = mci_update_time;
//    }

    public String getMci_period_of_validity() {
        return mci_period_of_validity;
    }

    public void setMci_period_of_validity(String mci_period_of_validity) {
        this.mci_period_of_validity = mci_period_of_validity;
    }

    public String getMci_login_pwd() {
        return mci_login_pwd;
    }

    public void setMci_login_pwd(String mci_login_pwd) {
        this.mci_login_pwd = mci_login_pwd;
    }

    public String getMci_salt() {
        return mci_salt;
    }

    public void setMci_salt(String mci_salt) {
        this.mci_salt = mci_salt;
    }


}