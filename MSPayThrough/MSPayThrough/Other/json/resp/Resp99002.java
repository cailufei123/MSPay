package com.tendpay.business.json.resp;

import java.util.List;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

/**
 * 
 * @author cnyxlxw
 *
 */
public class Resp99002 extends BaseResp{
	
	public Body body;

	public static class Body {
	List<DictBank> dict_bank_list;
	private String random_str = RandomUtils.generateString(32);
	
	/**
	 * @return the dict_bank_list
	 */
	public List<DictBank> getDict_bank_list() {
		return dict_bank_list;
	}
	/**
	 * @param dict_bank_list the dict_bank_list to set
	 */
	public void setDict_bank_list(List<DictBank> dict_bank_list) {
		this.dict_bank_list = dict_bank_list;
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
