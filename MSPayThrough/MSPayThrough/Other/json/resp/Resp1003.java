package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp1003 extends BaseResp{
	
	public Body body;

	public static class Body {
		
		private MerchantBaseInfo mbi;
		private MerchantContactsInfo mci;
		private MerchantReviewControl mrc;
		
		

		/**
		 * @return the mbi
		 */
		public MerchantBaseInfo getMbi() {
			return mbi;
		}

		/**
		 * @param mbi the mbi to set
		 */
		public void setMbi(MerchantBaseInfo mbi) {
			this.mbi = mbi;
		}

		/**
		 * @return the mci
		 */
		public MerchantContactsInfo getMci() {
			return mci;
		}

		/**
		 * @param mci the mci to set
		 */
		public void setMci(MerchantContactsInfo mci) {
			this.mci = mci;
		}

		/**
		 * @return the mrc
		 */
		public MerchantReviewControl getMrc() {
			return mrc;
		}

		/**
		 * @param mrc the mrc to set
		 */
		public void setMrc(MerchantReviewControl mrc) {
			this.mrc = mrc;
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
