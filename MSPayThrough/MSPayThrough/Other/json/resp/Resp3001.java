package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp3001 extends BaseResp{
	
	public Body body;

	public static class Body {
		
		private String qrp_plan_cycle;
		private String random_str = RandomUtils.generateString(32);

		
		/**
		 * @return the qrp_plan_cycle
		 */
		public String getQrp_plan_cycle() {
			return qrp_plan_cycle;
		}

		/**
		 * @param qrp_plan_cycle the qrp_plan_cycle to set
		 */
		public void setQrp_plan_cycle(String qrp_plan_cycle) {
			this.qrp_plan_cycle = qrp_plan_cycle;
		}

		/**
		 * @return the random_str
		 */
		public String getRandom_str() {
			return random_str;
		}

		/**
		 * @param random_str
		 *            the random_str to set
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
	 * @param body the body to set
	 */
	public void setBody(Body body) {
		this.body = body;
	}
	
}
