package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class MerchantFee  extends BaseModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6592952836589945279L;

	private Integer mf_id;

    private Integer mbi_id;

    private String mbi_code;

    private Integer mf_type;

    private Integer mf_qpay_top;
    
    private double mf_qpay_point;
    
    private double mf_qpay_no_point;
    
    private Integer mf_qpay_point_withdraw;
    
    private Integer mf_qpay_no_point_withdraw;
    
    private double mf_zhineng;
    
    private Integer mf_zhineng_withdraw;
        
    private String mf_credit;
    
    private double mf_debit;
    
    private Integer mf_debit_top;

//    private Date mf_create_time;

//    private Date mf_update_time;

	/**
	 * @return the mf_id
	 */
	public Integer getMf_id() {
		return mf_id;
	}

	/**
	 * @param mf_id the mf_id to set
	 */
	public void setMf_id(Integer mf_id) {
		this.mf_id = mf_id;
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
	 * @return the mf_type
	 */
	public Integer getMf_type() {
		return mf_type;
	}

	/**
	 * @param mf_type the mf_type to set
	 */
	public void setMf_type(Integer mf_type) {
		this.mf_type = mf_type;
	}

	


	

	/**
	 * @return the mf_qpay_top
	 */
	public Integer getMf_qpay_top() {
		return mf_qpay_top;
	}

	/**
	 * @param mf_qpay_top the mf_qpay_top to set
	 */
	public void setMf_qpay_top(Integer mf_qpay_top) {
		this.mf_qpay_top = mf_qpay_top;
	}

	/**
	 * @return the mf_qpay_no_point
	 */
	public double getMf_qpay_no_point() {
		return mf_qpay_no_point;
	}

	/**
	 * @param mf_qpay_no_point the mf_qpay_no_point to set
	 */
	public void setMf_qpay_no_point(double mf_qpay_no_point) {
		this.mf_qpay_no_point = mf_qpay_no_point;
	}

	/**
	 * @return the mf_qpay_point_withdraw
	 */
	public Integer getMf_qpay_point_withdraw() {
		return mf_qpay_point_withdraw;
	}

	/**
	 * @param mf_qpay_point_withdraw the mf_qpay_point_withdraw to set
	 */
	public void setMf_qpay_point_withdraw(Integer mf_qpay_point_withdraw) {
		this.mf_qpay_point_withdraw = mf_qpay_point_withdraw;
	}

	/**
	 * @return the mf_qpay_no_point_withdraw
	 */
	public Integer getMf_qpay_no_point_withdraw() {
		return mf_qpay_no_point_withdraw;
	}

	/**
	 * @param mf_qpay_no_point_withdraw the mf_qpay_no_point_withdraw to set
	 */
	public void setMf_qpay_no_point_withdraw(Integer mf_qpay_no_point_withdraw) {
		this.mf_qpay_no_point_withdraw = mf_qpay_no_point_withdraw;
	}

	/**
	 * @return the mf_credit
	 */
	public String getMf_credit() {
		return mf_credit;
	}

	/**
	 * @param mf_credit the mf_credit to set
	 */
	public void setMf_credit(String mf_credit) {
		this.mf_credit = mf_credit;
	}

	/**
	 * @return the mf_debit
	 */
	public double getMf_debit() {
		return mf_debit;
	}

	/**
	 * @param mf_debit the mf_debit to set
	 */
	public void setMf_debit(double mf_debit) {
		this.mf_debit = mf_debit;
	}

	/**
	 * @return the mf_debit_top
	 */
	public Integer getMf_debit_top() {
		return mf_debit_top;
	}

	/**
	 * @param mf_debit_top the mf_debit_top to set
	 */
	public void setMf_debit_top(Integer mf_debit_top) {
		this.mf_debit_top = mf_debit_top;
	}

//	/**
//	 * @return the mf_create_time
//	 */
//	public Date getMf_create_time() {
//		return mf_create_time;
//	}
//
//	/**
//	 * @param mf_create_time the mf_create_time to set
//	 */
//	public void setMf_create_time(Date mf_create_time) {
//		this.mf_create_time = mf_create_time;
//	}
//
//	/**
//	 * @return the mf_update_time
//	 */
//	public Date getMf_update_time() {
//		return mf_update_time;
//	}
//
//	/**
//	 * @param mf_update_time the mf_update_time to set
//	 */
//	public void setMf_update_time(Date mf_update_time) {
//		this.mf_update_time = mf_update_time;
//	}

	/**
	 * @return the mf_qpay_point
	 */
	public double getMf_qpay_point() {
		return mf_qpay_point;
	}

	/**
	 * @param mf_qpay_point the mf_qpay_point to set
	 */
	public void setMf_qpay_point(double mf_qpay_point) {
		this.mf_qpay_point = mf_qpay_point;
	}

	/**
	 * @return the mf_zhineng
	 */
	public double getMf_zhineng() {
		return mf_zhineng;
	}

	/**
	 * @param mf_zhineng the mf_zhineng to set
	 */
	public void setMf_zhineng(double mf_zhineng) {
		this.mf_zhineng = mf_zhineng;
	}

	/**
	 * @return the mf_zhineng_withdraw
	 */
	public Integer getMf_zhineng_withdraw() {
		return mf_zhineng_withdraw;
	}

	/**
	 * @param mf_zhineng_withdraw the mf_zhineng_withdraw to set
	 */
	public void setMf_zhineng_withdraw(Integer mf_zhineng_withdraw) {
		this.mf_zhineng_withdraw = mf_zhineng_withdraw;
	}

    
    
}