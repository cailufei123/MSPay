package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp1007 extends BaseResp{
	
	public Body body;

	public static class Body {
		
		private MerchantImageData mid;
		
		/**
		 * @return the mid
		 */
		public MerchantImageData getMid() {
			return mid;
		}

		/**
		 * @param mid the mid to set
		 */
		public void setMid(MerchantImageData mid) {
			this.mid = mid;
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
