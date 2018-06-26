package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req1009 extends BaseReq {

	private Body body;

	public static class Body {
		
		private String mcp_card_type;
		private String mcp_main;
		private String mcp_card_no;
		private String mcp_cvv;
		private String mcp_validity_date;
		private String mcp_mobile;
		private String mcp_user_name;
		private String mcp_user_id_card;
		private String mcp_bill_date;
		private String mcp_repayment_date;
		private String mcp_bank_name;
		private String mcp_bank_code;
		private String mcp_bank_abbr;
		private String mcp_bank_sub_name;
		private String mcp_bank_sub_no;
		
		private String mcp_province_code;
		private String mcp_city_code;
		
		private String random_str = RandomUtils.generateString(32);

		/**
		 * @return the mcp_card_type
		 */
		public String getMcp_card_type() {
			return mcp_card_type;
		}

		/**
		 * @param mcp_card_type the mcp_card_type to set
		 */
		public void setMcp_card_type(String mcp_card_type) {
			this.mcp_card_type = mcp_card_type;
		}

		public String getMcp_main() {
			return mcp_main;
		}

		public void setMcp_main(String mcp_main) {
			this.mcp_main = mcp_main;
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
		 * @return the random_str
		 */
		public String getRandom_str() {
			return random_str;
		}

		/**
		 * @param random_str the random_str to set
		 */
		public void setRandom_str(String random_str) {
			this.random_str = random_str;
		}
		
		

	}

	/**
	 * @return the body
	 */
	public Body getBody() {
		return body;
	}

	/**
	 * @param body
	 *            the body to set
	 */
	public void setBody(Body body) {
		this.body = body;
	}

}
