package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req1008 extends BaseReq {

	private Body body;

	public static class Body {
		
		private String mcp_id;
		private String random_str = RandomUtils.generateString(32);

		public String getMcp_id() {
			return mcp_id;
		}

		public void setMcp_id(String mcp_id) {
			this.mcp_id = mcp_id;
		}

		public String getRandom_str() {
			return random_str;
		}

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
