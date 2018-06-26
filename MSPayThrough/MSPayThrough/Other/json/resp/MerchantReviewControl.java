/**
 * 
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

/**
 * @author Administrator
 *
 */
public class MerchantReviewControl extends BaseModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8940674491640811723L;
	private Integer mrc_id;
	private Integer mbi_id;
	private String mbi_code;
	private Integer mrc_review_status;
	private String mrc_review_remark;
	private Integer mrc_trade_status;
	private String mrc_inner_remark;
	private Integer mrc_risk_level;
	private Integer mrc_is_manual_review;
//	private Date mrc_create_time;
//	private Date mrc_update_time;
	public Integer getMrc_id() {
		return mrc_id;
	}
	public void setMrc_id(Integer mrc_id) {
		this.mrc_id = mrc_id;
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
		this.mbi_code = mbi_code;
	}
	public Integer getMrc_review_status() {
		return mrc_review_status;
	}
	public void setMrc_review_status(Integer mrc_review_status) {
		this.mrc_review_status = mrc_review_status;
	}
	public String getMrc_review_remark() {
		return mrc_review_remark;
	}
	public void setMrc_review_remark(String mrc_review_remark) {
		this.mrc_review_remark = mrc_review_remark;
	}
	public Integer getMrc_trade_status() {
		return mrc_trade_status;
	}
	public void setMrc_trade_status(Integer mrc_trade_status) {
		this.mrc_trade_status = mrc_trade_status;
	}
	public String getMrc_inner_remark() {
		return mrc_inner_remark;
	}
	public void setMrc_inner_remark(String mrc_inner_remark) {
		this.mrc_inner_remark = mrc_inner_remark;
	}
	public Integer getMrc_risk_level() {
		return mrc_risk_level;
	}
	public void setMrc_risk_level(Integer mrc_risk_level) {
		this.mrc_risk_level = mrc_risk_level;
	}
	public Integer getMrc_is_manual_review() {
		return mrc_is_manual_review;
	}
	public void setMrc_is_manual_review(Integer mrc_is_manual_review) {
		this.mrc_is_manual_review = mrc_is_manual_review;
	}
//	public Date getMrc_create_time() {
//		return mrc_create_time;
//	}
//	public void setMrc_create_time(Date mrc_create_time) {
//		this.mrc_create_time = mrc_create_time;
//	}
//	public Date getMrc_update_time() {
//		return mrc_update_time;
//	}
//	public void setMrc_update_time(Date mrc_update_time) {
//		this.mrc_update_time = mrc_update_time;
//	}
//
	

}
