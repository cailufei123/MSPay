package com.tendpay.business.json.resp;

import java.util.List;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp1006 extends BaseResp{
	
	public Body body;

	public static class Body {
		
		private List<MerchantCardPackage> mcp;
		
		
		/**
		 * @return the mcp
		 */
		public List<MerchantCardPackage> getMcp() {
			return mcp;
		}

		/**
		 * @param mcp the mcp to set
		 */
		public void setMcp(List<MerchantCardPackage> mcp) {
			this.mcp = mcp;
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
