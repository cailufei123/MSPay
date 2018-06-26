package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req3004 extends BaseReq {

	private Body body;

	public static class Body {
				
		private String qrp_status;
		private String start;
		private String size;
		private String random_str = RandomUtils.generateString(32);

		
		/**
		 * @return the qrp_status
		 */
		public String getQrp_status() {
			return qrp_status;
		}

		/**
		 * @param qrp_status the qrp_status to set
		 */
		public void setQrp_status(String qrp_status) {
			this.qrp_status = qrp_status;
		}

		/**
		 * @return the start
		 */
		public String getStart() {
			return start;
		}

		/**
		 * @param start the start to set
		 */
		public void setStart(String start) {
			this.start = start;
		}

		/**
		 * @return the size
		 */
		public String getSize() {
			return size;
		}

		/**
		 * @param size the size to set
		 */
		public void setSize(String size) {
			this.size = size;
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
