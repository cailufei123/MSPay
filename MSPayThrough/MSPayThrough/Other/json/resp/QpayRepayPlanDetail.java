package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class QpayRepayPlanDetail  extends BaseModel {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 5495642976243857296L;

	private Integer qrpd_id;

    private Integer mbi_id;

    private String mbi_code;

    private Integer qrp_id;
    
    private String qrpd_team_no;

    private Integer qrpd_type;

    private Integer qrpd_status;
    
    private String qrpd_credit_card_no;

    private String qrpd_credit_bank_no;

    private String qrpd_execute_datetime;
    
    private String qrpd_finish_datetime;
    
    private Integer qrpd_money;

    private String qrpd_serial_no;
    
    private String qrpd_serial_no_bank;
    
    private String qrpd_remark;
    
    private Integer tcq_id;

//    private Date qrpd_create_time;

//    private Date qrpd_update_time;

	/**
	 * @return the qrpd_serial_no_bank
	 */
	public String getQrpd_serial_no_bank() {
		return qrpd_serial_no_bank;
	}

	/**
	 * @param qrpd_serial_no_bank the qrpd_serial_no_bank to set
	 */
	public void setQrpd_serial_no_bank(String qrpd_serial_no_bank) {
		this.qrpd_serial_no_bank = qrpd_serial_no_bank;
	}

	/**
	 * @return the qrpd_id
	 */
	public Integer getQrpd_id() {
		return qrpd_id;
	}

	/**
	 * @param qrpd_id the qrpd_id to set
	 */
	public void setQrpd_id(Integer qrpd_id) {
		this.qrpd_id = qrpd_id;
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
	 * @return the qrp_id
	 */
	public Integer getQrp_id() {
		return qrp_id;
	}

	/**
	 * @param qrp_id the qrp_id to set
	 */
	public void setQrp_id(Integer qrp_id) {
		this.qrp_id = qrp_id;
	}

	/**
	 * @return the qrpd_type
	 */
	public Integer getQrpd_type() {
		return qrpd_type;
	}

	/**
	 * @param qrpd_type the qrpd_type to set
	 */
	public void setQrpd_type(Integer qrpd_type) {
		this.qrpd_type = qrpd_type;
	}

	/**
	 * @return the qrpd_status
	 */
	public Integer getQrpd_status() {
		return qrpd_status;
	}

	/**
	 * @param qrpd_status the qrpd_status to set
	 */
	public void setQrpd_status(Integer qrpd_status) {
		this.qrpd_status = qrpd_status;
	}

	/**
	 * @return the qrpd_credit_card_no
	 */
	public String getQrpd_credit_card_no() {
		return qrpd_credit_card_no;
	}

	/**
	 * @param qrpd_credit_card_no the qrpd_credit_card_no to set
	 */
	public void setQrpd_credit_card_no(String qrpd_credit_card_no) {
		this.qrpd_credit_card_no = qrpd_credit_card_no;
	}

	/**
	 * @return the qrpd_credit_bank_no
	 */
	public String getQrpd_credit_bank_no() {
		return qrpd_credit_bank_no;
	}

	/**
	 * @param qrpd_credit_bank_no the qrpd_credit_bank_no to set
	 */
	public void setQrpd_credit_bank_no(String qrpd_credit_bank_no) {
		this.qrpd_credit_bank_no = qrpd_credit_bank_no;
	}

	/**
	 * @return the qrpd_execute_datetime
	 */
	public String getQrpd_execute_datetime() {
		return qrpd_execute_datetime;
	}

	/**
	 * @param qrpd_execute_datetime the qrpd_execute_datetime to set
	 */
	public void setQrpd_execute_datetime(String qrpd_execute_datetime) {
		this.qrpd_execute_datetime = qrpd_execute_datetime;
	}

	/**
	 * @return the qrpd_finish_datetime
	 */
	public String getQrpd_finish_datetime() {
		return qrpd_finish_datetime;
	}

	/**
	 * @param qrpd_finish_datetime the qrpd_finish_datetime to set
	 */
	public void setQrpd_finish_datetime(String qrpd_finish_datetime) {
		this.qrpd_finish_datetime = qrpd_finish_datetime;
	}

	/**
	 * @return the qrpd_money
	 */
	public Integer getQrpd_money() {
		return qrpd_money;
	}

	/**
	 * @param qrpd_money the qrpd_money to set
	 */
	public void setQrpd_money(Integer qrpd_money) {
		this.qrpd_money = qrpd_money;
	}

	
	/**
	 * @return the qrpd_serial_no
	 */
	public String getQrpd_serial_no() {
		return qrpd_serial_no;
	}

	/**
	 * @param qrpd_serial_no the qrpd_serial_no to set
	 */
	public void setQrpd_serial_no(String qrpd_serial_no) {
		this.qrpd_serial_no = qrpd_serial_no;
	}

	/**
	 * @return the qrpd_remark
	 */
	public String getQrpd_remark() {
		return qrpd_remark;
	}

	/**
	 * @param qrpd_remark the qrpd_remark to set
	 */
	public void setQrpd_remark(String qrpd_remark) {
		this.qrpd_remark = qrpd_remark;
	}

	/**
	 * @return the tcq_id
	 */
	public Integer getTcq_id() {
		return tcq_id;
	}

	/**
	 * @param tcq_id the tcq_id to set
	 */
	public void setTcq_id(Integer tcq_id) {
		this.tcq_id = tcq_id;
	}

//	/**
//	 * @return the qrpd_create_time
//	 */
//	public Date getQrpd_create_time() {
//		return qrpd_create_time;
//	}
//
//	/**
//	 * @param qrpd_create_time the qrpd_create_time to set
//	 */
//	public void setQrpd_create_time(Date qrpd_create_time) {
//		this.qrpd_create_time = qrpd_create_time;
//	}
//
//	/**
//	 * @return the qrpd_update_time
//	 */
//	public Date getQrpd_update_time() {
//		return qrpd_update_time;
//	}
//
//	/**
//	 * @param qrpd_update_time the qrpd_update_time to set
//	 */
//	public void setQrpd_update_time(Date qrpd_update_time) {
//		this.qrpd_update_time = qrpd_update_time;
//	}

	/**
	 * @return the qrpd_team_no
	 */
	public String getQrpd_team_no() {
		return qrpd_team_no;
	}

	/**
	 * @param qrpd_team_no the qrpd_team_no to set
	 */
	public void setQrpd_team_no(String qrpd_team_no) {
		this.qrpd_team_no = qrpd_team_no;
	}

}