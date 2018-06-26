package com.tendpay.business.json.resp;


import com.tendpay.business.basemodule.BaseModel;


public class MerchantCardPackage extends BaseModel {


    private Integer mcp_id;
    private Integer mbi_id;
    private String mbi_code;
    private Integer mcp_card_type;
    private String mcp_card_no;
    private String mcp_cvv;
    private String mcp_validity_date;
    private String mcp_mobile;
    private String mcp_user_name;
    private String mcp_user_id_card;
    private String mcp_bill_date;
    private String mcp_repayment_date;
    private String mcp_bank_ico;


    private String mcp_bank_name;
    private String mcp_bank_sub_name;
    private String mcp_bank_sub_no;//支行联行号
    private String mcp_bank_code;
    private String mcp_bank_abbr;
    private String mcp_province_code;
    private String mcp_province_name;
    private String mcp_city_code;
    private String mcp_city_name;
    private String mcp_area_code;
    private String mcp_area_name;
    private Integer mcp_withdraw_status;

    private String qrp_id;

    public String getQrp_id() {
        return qrp_id;
    }

    public void setQrp_id(String qrp_id) {
        this.qrp_id = qrp_id;
    }

    //这个用来显示在PickerView上面的字符串,PickerView会通过反射获取getPickerViewText方法显示出来。
    public String getPickerViewText() {
        //这里还可以判断文字超长截断再提供显示
        return mcp_card_no;
    }
//	private Date mcp_create_time;
//	private Date mcp_update_time;

    /**
     * @return the mcp_id
     */
    public Integer getMcp_id() {
        return mcp_id;
    }

    /**
     * @param mcp_id the mcp_id to set
     */
    public void setMcp_id(Integer mcp_id) {
        this.mcp_id = mcp_id;
    }

    /**
     * @return the mbi_id
     */
    public Integer getMbi_id() {
        return mbi_id;
    }

    /**
     * @param mbi_id the mbi_id to set
     */
    public void setMbi_id(Integer mbi_id) {
        this.mbi_id = mbi_id;
    }

    /**
     * @return the mbi_code
     */
    public String getMbi_code() {
        return mbi_code;
    }

    /**
     * @param mbi_code the mbi_code to set
     */
    public void setMbi_code(String mbi_code) {
        this.mbi_code = mbi_code;
    }

    /**
     * @return the mcp_card_type
     */
    public Integer getMcp_card_type() {
        return mcp_card_type;
    }

    /**
     * @param mcp_card_type the mcp_card_type to set
     */
    public void setMcp_card_type(Integer mcp_card_type) {
        this.mcp_card_type = mcp_card_type;
    }

    /**
     * @return the mcp_card_no
     */
    public String getMcp_card_no() {
        return mcp_card_no;
    }

    /**
     * @param mcp_card_no the mcp_card_no to set
     */
    public void setMcp_card_no(String mcp_card_no) {
        this.mcp_card_no = mcp_card_no;
    }

    /**
     * @return the mcp_cvv
     */
    public String getMcp_cvv() {
        return mcp_cvv;
    }

    /**
     * @param mcp_cvv the mcp_cvv to set
     */
    public void setMcp_cvv(String mcp_cvv) {
        this.mcp_cvv = mcp_cvv;
    }

    /**
     * @return the mcp_validity_date
     */
    public String getMcp_validity_date() {
        return mcp_validity_date;
    }

    /**
     * @param mcp_validity_date the mcp_validity_date to set
     */
    public void setMcp_validity_date(String mcp_validity_date) {
        this.mcp_validity_date = mcp_validity_date;
    }

    /**
     * @return the mcp_mobile
     */
    public String getMcp_mobile() {
        return mcp_mobile;
    }

    /**
     * @param mcp_mobile the mcp_mobile to set
     */
    public void setMcp_mobile(String mcp_mobile) {
        this.mcp_mobile = mcp_mobile;
    }

    /**
     * @return the mcp_user_name
     */
    public String getMcp_user_name() {
        return mcp_user_name;
    }

    /**
     * @param mcp_user_name the mcp_user_name to set
     */
    public void setMcp_user_name(String mcp_user_name) {
        this.mcp_user_name = mcp_user_name;
    }

    /**
     * @return the mcp_user_id_card
     */
    public String getMcp_user_id_card() {
        return mcp_user_id_card;
    }

    /**
     * @param mcp_user_id_card the mcp_user_id_card to set
     */
    public void setMcp_user_id_card(String mcp_user_id_card) {
        this.mcp_user_id_card = mcp_user_id_card;
    }

    /**
     * @return the mcp_bill_date
     */
    public String getMcp_bill_date() {
        return mcp_bill_date;
    }

    /**
     * @param mcp_bill_date the mcp_bill_date to set
     */
    public void setMcp_bill_date(String mcp_bill_date) {
        this.mcp_bill_date = mcp_bill_date;
    }

    /**
     * @return the mcp_repayment_date
     */
    public String getMcp_repayment_date() {
        return mcp_repayment_date;
    }

    /**
     * @param mcp_repayment_date the mcp_repayment_date to set
     */
    public void setMcp_repayment_date(String mcp_repayment_date) {
        this.mcp_repayment_date = mcp_repayment_date;
    }

    public String getMcp_bank_ico() {
        return mcp_bank_ico;
    }

    public void setMcp_bank_ico(String mcp_bank_ico) {
        this.mcp_bank_ico = mcp_bank_ico;
    }

    /**
     * @return the mcp_create_time
     */
//	public Date getMcp_create_time() {
//		return mcp_create_time;
//	}
//	/**
//	 * @param mcp_create_time the mcp_create_time to set
//	 */
//	public void setMcp_create_time(Date mcp_create_time) {
//		this.mcp_create_time = mcp_create_time;
//	}
//	/**
//	 * @return the mcp_update_time
//	 */
//	public Date getMcp_update_time() {
//		return mcp_update_time;
//	}
//	/**
//	 * @param mcp_update_time the mcp_update_time to set
//	 */
//	public void setMcp_update_time(Date mcp_update_time) {
//		this.mcp_update_time = mcp_update_time;
//	}

    /**
     * @return the mcp_bank_name
     */
    public String getMcp_bank_name() {
        return mcp_bank_name;
    }

    /**
     * @param mcp_bank_name the mcp_bank_name to set
     */
    public void setMcp_bank_name(String mcp_bank_name) {
        this.mcp_bank_name = mcp_bank_name;
    }

    /**
     * @return the mcp_bank_sub_name
     */
    public String getMcp_bank_sub_name() {
        return mcp_bank_sub_name;
    }

    /**
     * @param mcp_bank_sub_name the mcp_bank_sub_name to set
     */
    public void setMcp_bank_sub_name(String mcp_bank_sub_name) {
        this.mcp_bank_sub_name = mcp_bank_sub_name;
    }

    /**
     * @return the mcp_bank_sub_no
     */
    public String getMcp_bank_sub_no() {
        return mcp_bank_sub_no;
    }

    /**
     * @param mcp_bank_sub_no the mcp_bank_sub_no to set
     */
    public void setMcp_bank_sub_no(String mcp_bank_sub_no) {
        this.mcp_bank_sub_no = mcp_bank_sub_no;
    }

    /**
     * @return the mcp_bank_code
     */
    public String getMcp_bank_code() {
        return mcp_bank_code;
    }

    /**
     * @param mcp_bank_code the mcp_bank_code to set
     */
    public void setMcp_bank_code(String mcp_bank_code) {
        this.mcp_bank_code = mcp_bank_code;
    }

    /**
     * @return the mcp_bank_abbr
     */
    public String getMcp_bank_abbr() {
        return mcp_bank_abbr;
    }

    /**
     * @param mcp_bank_abbr the mcp_bank_abbr to set
     */
    public void setMcp_bank_abbr(String mcp_bank_abbr) {
        this.mcp_bank_abbr = mcp_bank_abbr;
    }

    /**
     * @return the mcp_province_code
     */
    public String getMcp_province_code() {
        return mcp_province_code;
    }

    /**
     * @param mcp_province_code the mcp_province_code to set
     */
    public void setMcp_province_code(String mcp_province_code) {
        this.mcp_province_code = mcp_province_code;
    }

    /**
     * @return the mcp_province_name
     */
    public String getMcp_province_name() {
        return mcp_province_name;
    }

    /**
     * @param mcp_province_name the mcp_province_name to set
     */
    public void setMcp_province_name(String mcp_province_name) {
        this.mcp_province_name = mcp_province_name;
    }

    /**
     * @return the mcp_city_code
     */
    public String getMcp_city_code() {
        return mcp_city_code;
    }

    /**
     * @param mcp_city_code the mcp_city_code to set
     */
    public void setMcp_city_code(String mcp_city_code) {
        this.mcp_city_code = mcp_city_code;
    }

    /**
     * @return the mcp_city_name
     */
    public String getMcp_city_name() {
        return mcp_city_name;
    }

    /**
     * @param mcp_city_name the mcp_city_name to set
     */
    public void setMcp_city_name(String mcp_city_name) {
        this.mcp_city_name = mcp_city_name;
    }

    /**
     * @return the mcp_area_code
     */
    public String getMcp_area_code() {
        return mcp_area_code;
    }

    /**
     * @param mcp_area_code the mcp_area_code to set
     */
    public void setMcp_area_code(String mcp_area_code) {
        this.mcp_area_code = mcp_area_code;
    }

    /**
     * @return the mcp_area_name
     */
    public String getMcp_area_name() {
        return mcp_area_name;
    }

    /**
     * @param mcp_area_name the mcp_area_name to set
     */
    public void setMcp_area_name(String mcp_area_name) {
        this.mcp_area_name = mcp_area_name;
    }

    /**
     * @return the mcp_withdraw_status
     */
    public Integer getMcp_withdraw_status() {
        return mcp_withdraw_status;
    }

    /**
     * @param mcp_withdraw_status the mcp_withdraw_status to set
     */
    public void setMcp_withdraw_status(Integer mcp_withdraw_status) {
        this.mcp_withdraw_status = mcp_withdraw_status;
    }


    @Override
    public String toString() {
        return "MerchantCardPackage{" +
                "mcp_id=" + mcp_id +
                ", mbi_id=" + mbi_id +
                ", mbi_code='" + mbi_code + '\'' +
                ", mcp_card_type=" + mcp_card_type +
                ", mcp_card_no='" + mcp_card_no + '\'' +
                ", mcp_cvv='" + mcp_cvv + '\'' +
                ", mcp_validity_date='" + mcp_validity_date + '\'' +
                ", mcp_mobile='" + mcp_mobile + '\'' +
                ", mcp_user_name='" + mcp_user_name + '\'' +
                ", mcp_user_id_card='" + mcp_user_id_card + '\'' +
                ", mcp_bill_date='" + mcp_bill_date + '\'' +
                ", mcp_repayment_date='" + mcp_repayment_date + '\'' +
                ", mcp_bank_name='" + mcp_bank_name + '\'' +
                ", mcp_bank_sub_name='" + mcp_bank_sub_name + '\'' +
                ", mcp_bank_sub_no='" + mcp_bank_sub_no + '\'' +
                ", mcp_bank_code='" + mcp_bank_code + '\'' +
                ", mcp_bank_abbr='" + mcp_bank_abbr + '\'' +
                ", mcp_province_code='" + mcp_province_code + '\'' +
                ", mcp_province_name='" + mcp_province_name + '\'' +
                ", mcp_city_code='" + mcp_city_code + '\'' +
                ", mcp_city_name='" + mcp_city_name + '\'' +
                ", mcp_area_code='" + mcp_area_code + '\'' +
                ", mcp_area_name='" + mcp_area_name + '\'' +
                ", mcp_withdraw_status=" + mcp_withdraw_status +
                '}';
    }
}
