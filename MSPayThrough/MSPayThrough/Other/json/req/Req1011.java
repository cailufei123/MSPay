package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req1011 extends BaseReq {

	private Body body;

	public static class Body {
		private String mobile;
		private String validate_code;
		private String password;
		private String random_str = RandomUtils.generateString(32);

		/**
		 * @return the mobile
		 */
		public String getMobile() {
			return mobile;
		}
		/**
		 * @param mobile the mobile to set
		 */
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		/**
		 * @return the validate_code
		 */
		public String getValidate_code() {
			return validate_code;
		}
		/**
		 * @param validate_code the validate_code to set
		 */
		public void setValidate_code(String validate_code) {
			this.validate_code = validate_code;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
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
