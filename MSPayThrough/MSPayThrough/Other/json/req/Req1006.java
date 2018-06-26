package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req1006 extends BaseReq {

	private Body body;

	public static class Body {
		private int mcp_card_type;
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

		public int getType() {
			return mcp_card_type;
		}

		public void setType(int type) {
			this.mcp_card_type = type;
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
