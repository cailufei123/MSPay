package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req99002 extends BaseReq {

	private Body body;

	public static class Body {
		private String random_str = RandomUtils.generateString(32);
		
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
