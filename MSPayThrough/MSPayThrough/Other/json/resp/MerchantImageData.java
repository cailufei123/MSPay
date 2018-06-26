package com.tendpay.business.json.resp;

import java.util.Date;

import com.tendpay.business.basemodule.BaseModel;


public class MerchantImageData extends BaseModel {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -619457099904077497L;
	private Integer mid_id;
	private Integer mbi_id;
	private String mbi_code;
	private String mid_id_card_positive;
	private String mid_id_card_opposite;
	private String mid_id_card_hold;
	private String mid_business_licence;
	private String mid_account_licence;
	private String mid_door_head;
	private String mid_account;
//	private Date mid_create_time;
//	private Date mid_update_time;
	public Integer getMid_id() {
		return mid_id;
	}
	public void setMid_id(Integer mid_id) {
		this.mid_id = mid_id;
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
	public String getMid_id_card_positive() {
		return mid_id_card_positive;
	}
	public void setMid_id_card_positive(String mid_id_card_positive) {
		this.mid_id_card_positive = mid_id_card_positive;
	}
	public String getMid_id_card_opposite() {
		return mid_id_card_opposite;
	}
	public void setMid_id_card_opposite(String mid_id_card_opposite) {
		this.mid_id_card_opposite = mid_id_card_opposite;
	}
	public String getMid_id_card_hold() {
		return mid_id_card_hold;
	}
	public void setMid_id_card_hold(String mid_id_card_hold) {
		this.mid_id_card_hold = mid_id_card_hold;
	}
	public String getMid_business_licence() {
		return mid_business_licence;
	}
	public void setMid_business_licence(String mid_business_licence) {
		this.mid_business_licence = mid_business_licence;
	}
	public String getMid_account_licence() {
		return mid_account_licence;
	}
	public void setMid_account_licence(String mid_account_licence) {
		this.mid_account_licence = mid_account_licence;
	}
	public String getMid_door_head() {
		return mid_door_head;
	}
	public void setMid_door_head(String mid_door_head) {
		this.mid_door_head = mid_door_head;
	}
	public String getMid_account() {
		return mid_account;
	}
	public void setMid_account(String mid_account) {
		this.mid_account = mid_account;
	}
//	public Date getMid_create_time() {
//		return mid_create_time;
//	}
//	public void setMid_create_time(Date mid_create_time) {
//		this.mid_create_time = mid_create_time;
//	}
//	public Date getMid_update_time() {
//		return mid_update_time;
//	}
//	public void setMid_update_time(Date mid_update_time) {
//		this.mid_update_time = mid_update_time;
//	}

}
