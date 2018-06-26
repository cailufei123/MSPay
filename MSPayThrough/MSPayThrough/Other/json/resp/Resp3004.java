package com.tendpay.business.json.resp;

import java.util.List;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp3004 extends BaseResp{
	
	public Body body;

	public static class Body {
		
		List<QpayRepayPlan> qrp_list;
		
		
		/**
		 * @return the qrp_list
		 */
		public List<QpayRepayPlan> getQrp_list() {
			return qrp_list;
		}

		/**
		 * @param qrp_list the qrp_list to set
		 */
		public void setQrp_list(List<QpayRepayPlan> qrp_list) {
			this.qrp_list = qrp_list;
		}

		private String random_str = RandomUtils.generateString(32);

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
