package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req1010 extends BaseReq {

	private Body body;

	public static class Body {
		
		private String mci_name;
		private String mci_id_card;
		private String mci_sign_org_name;
		private String mci_period_of_validity;
		
		private String random_str = RandomUtils.generateString(32);

		/**
		 * @return the mci_name
		 */
		public String getMci_name() {
			return mci_name;
		}

		/**
		 * @param mci_name the mci_name to set
		 */
		public void setMci_name(String mci_name) {
			this.mci_name = mci_name;
		}

		/**
		 * @return the mci_id_card
		 */
		public String getMci_id_card() {
			return mci_id_card;
		}

		/**
		 * @param mci_id_card the mci_id_card to set
		 */
		public void setMci_id_card(String mci_id_card) {
			this.mci_id_card = mci_id_card;
		}

		/**
		 * @return the mci_sign_org_name
		 */
		public String getMci_sign_org_name() {
			return mci_sign_org_name;
		}

		/**
		 * @param mci_sign_org_name the mci_sign_org_name to set
		 */
		public void setMci_sign_org_name(String mci_sign_org_name) {
			this.mci_sign_org_name = mci_sign_org_name;
		}

		/**
		 * @return the mci_period_of_validity
		 */
		public String getMci_period_of_validity() {
			return mci_period_of_validity;
		}

		/**
		 * @param mci_period_of_validity the mci_period_of_validity to set
		 */
		public void setMci_period_of_validity(String mci_period_of_validity) {
			this.mci_period_of_validity = mci_period_of_validity;
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
