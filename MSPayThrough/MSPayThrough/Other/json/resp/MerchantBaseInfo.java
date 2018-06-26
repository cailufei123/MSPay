package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class MerchantBaseInfo extends BaseModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2197020901951387390L;

	private Integer mbi_id;

    private Integer abi_id;

    private String abi_code;

    private String mbi_code;

    private Integer mbi_type;

    private String mbi_industry;
    
    private String mbi_product;

    private String mbi_name;

    private String mbi_desc;

    private String mbi_phone;

    private String mbi_business_name;

    private String mbi_vip_level;

    private String mbi_email;

    private String mbi_address;

    private String mbi_area_code;

    private String mbi_area_name;

    private String mbi_business_license_code;

    private String mbi_business_licence;

    /*private Integer mbi_status;

    private Integer mbi_tran_status;

    private String mbi_remark;*/
    
    private Integer mbi_operator_id;
    
    private String mbi_operator_code;
    
    private String mbi_operator_name;

//    private Date mbi_register_time;

//    private Date mbi_update_time;

    public Integer getMbi_operator_id() {
		return mbi_operator_id;
	}

	public void setMbi_operator_id(Integer mbi_operator_id) {
		this.mbi_operator_id = mbi_operator_id;
	}

	public Integer getMbi_id() {
        return mbi_id;
    }

    public void setMbi_id(Integer mbi_id) {
        this.mbi_id = mbi_id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getAbi_id() {
        return abi_id;
    }

    public void setAbi_id(Integer abi_id) {
        this.abi_id = abi_id;
    }

    public String getAbi_code() {
        return abi_code;
    }

    public void setAbi_code(String abi_code) {
        this.abi_code = abi_code == null ? null : abi_code.trim();
    }

    public String getMbi_code() {
        return mbi_code;
    }

    public void setMbi_code(String mbi_code) {
        this.mbi_code = mbi_code == null ? null : mbi_code.trim();
    }

    public Integer getMbi_type() {
        return mbi_type;
    }

    public void setMbi_type(Integer mbi_type) {
        this.mbi_type = mbi_type;
    }

    public String getMbi_industry() {
        return mbi_industry;
    }

    public void setMbi_industry(String mbi_industry) {
        this.mbi_industry = mbi_industry == null ? null : mbi_industry.trim();
    }

    public String getMbi_name() {
        return mbi_name;
    }

    public void setMbi_name(String mbi_name) {
        this.mbi_name = mbi_name == null ? null : mbi_name.trim();
    }

    public String getMbi_desc() {
        return mbi_desc;
    }

    public void setMbi_desc(String mbi_desc) {
        this.mbi_desc = mbi_desc == null ? null : mbi_desc.trim();
    }

    public String getMbi_phone() {
        return mbi_phone;
    }

    public void setMbi_phone(String mbi_phone) {
        this.mbi_phone = mbi_phone == null ? null : mbi_phone.trim();
    }

    public String getMbi_business_name() {
        return mbi_business_name;
    }

    public void setMbi_business_name(String mbi_business_name) {
        this.mbi_business_name = mbi_business_name == null ? null : mbi_business_name.trim();
    }

    public String getMbi_vip_level() {
        return mbi_vip_level;
    }

    public void setMbi_vip_level(String mbi_vip_level) {
        this.mbi_vip_level = mbi_vip_level == null ? null : mbi_vip_level.trim();
    }

    public String getMbi_email() {
        return mbi_email;
    }

    public void setMbi_email(String mbi_email) {
        this.mbi_email = mbi_email == null ? null : mbi_email.trim();
    }

    public String getMbi_address() {
        return mbi_address;
    }

    public void setMbi_address(String mbi_address) {
        this.mbi_address = mbi_address == null ? null : mbi_address.trim();
    }

    public String getMbi_area_code() {
        return mbi_area_code;
    }

    public void setMbi_area_code(String mbi_area_code) {
        this.mbi_area_code = mbi_area_code == null ? null : mbi_area_code.trim();
    }

    public String getMbi_area_name() {
        return mbi_area_name;
    }

    public void setMbi_area_name(String mbi_area_name) {
        this.mbi_area_name = mbi_area_name == null ? null : mbi_area_name.trim();
    }

    public String getMbi_business_license_code() {
        return mbi_business_license_code;
    }

    public void setMbi_business_license_code(String mbi_business_license_code) {
        this.mbi_business_license_code = mbi_business_license_code == null ? null : mbi_business_license_code.trim();
    }

    public String getMbi_business_licence() {
        return mbi_business_licence;
    }

    public void setMbi_business_licence(String mbi_business_licence) {
        this.mbi_business_licence = mbi_business_licence == null ? null : mbi_business_licence.trim();
    }


//    public Date getMbi_register_time() {
//        return mbi_register_time;
//    }
//
//    public void setMbi_register_time(Date mbi_register_time) {
//        this.mbi_register_time = mbi_register_time;
//    }

//    public Date getMbi_update_time() {
//        return mbi_update_time;
//    }
//
//    public void setMbi_update_time(Date mbi_update_time) {
//        this.mbi_update_time = mbi_update_time;
//    }

	public String getMbi_product() {
		return mbi_product;
	}

	public void setMbi_product(String mbi_product) {
		this.mbi_product = mbi_product;
	}

	public String getMbi_operator_code() {
		return mbi_operator_code;
	}

	public void setMbi_operator_code(String mbi_operator_code) {
		this.mbi_operator_code = mbi_operator_code;
	}

	public String getMbi_operator_name() {
		return mbi_operator_name;
	}

	public void setMbi_operator_name(String mbi_operator_name) {
		this.mbi_operator_name = mbi_operator_name;
	}
    
    
}