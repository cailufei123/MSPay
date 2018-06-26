package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp1002 extends BaseResp {
	
	public Body body;

	public static class Body {
	private String merchant_key;
	private String merchant_id;
	private String random_str = RandomUtils.generateString(32);
	/**
	 * @return the merchant_key
	 */
	public String getMerchant_key() {
		return merchant_key;
	}
	/**
	 * @param merchant_key the merchant_key to set
	 */
	public void setMerchant_key(String merchant_key) {
		this.merchant_key = merchant_key;
	}
	/**
	 * @return the merchant_id
	 */
	public String getMerchant_id() {
		return merchant_id;
	}
	/**
	 * @param merchant_id the merchant_id to set
	 */
	public void setMerchant_id(String merchant_id) {
		this.merchant_id = merchant_id;
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
	 * @param body the body to set
	 */
	public void setBody(Body body) {
		this.body = body;
	}
	
}
