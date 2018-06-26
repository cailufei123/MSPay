package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req2001 extends BaseReq {

	private Body body;

	public static class Body {
		private String credit_card_id;
		private String debit_card_id;
		private String amount;
		private String channel_type;
		private String random_str = RandomUtils.generateString(32);


		public String getCredit_card_id() {
			return credit_card_id;
		}

		public void setCredit_card_id(String credit_card_id) {
			this.credit_card_id = credit_card_id;
		}

		public String getDebit_card_id() {
			return debit_card_id;
		}

		public void setDebit_card_id(String debit_card_id) {
			this.debit_card_id = debit_card_id;
		}

		public String getAmount() {
			return amount;
		}

		public void setAmount(String amount) {
			this.amount = amount;
		}

		public String getChannel_type() {
			return channel_type;
		}

		public void setChannel_type(String channel_type) {
			this.channel_type = channel_type;
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
