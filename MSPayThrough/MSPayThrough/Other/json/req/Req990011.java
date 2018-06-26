package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

;

public class Req990011 extends BaseReq {

	private Body body;

	public static class Body {
		private int vc_type;
		private int vc_sign;
		private String mobile;
		private String random_str = RandomUtils.generateString(32);


		public int getVc_type() {
			return vc_type;
		}

		public void setVc_type(int vc_type) {
			this.vc_type = vc_type;
		}

		public int getVc_sign() {
			return vc_sign;
		}

		public void setVc_sign(int vc_sign) {
			this.vc_sign = vc_sign;
		}

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
