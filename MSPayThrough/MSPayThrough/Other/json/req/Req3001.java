package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req3001 extends BaseReq {

	private Body body;

	public static class Body {
		
		private String bank_acc_name;
		private String bank_acc_no;

		private String random_str = RandomUtils.generateString(32);

		/**
		 * @return the bank_acc_name
		 */
		public String getBank_acc_name() {
			return bank_acc_name;
		}

		/**
		 * @param bank_acc_name the bank_acc_name to set
		 */
		public void setBank_acc_name(String bank_acc_name) {
			this.bank_acc_name = bank_acc_name;
		}

		/**
		 * @return the bank_acc_no
		 */
		public String getBank_acc_no() {
			return bank_acc_no;
		}

		/**
		 * @param bank_acc_no the bank_acc_no to set
		 */
		public void setBank_acc_no(String bank_acc_no) {
			this.bank_acc_no = bank_acc_no;
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
