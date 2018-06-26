/**
 * 
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;


/**
 * @author cnyxlxw
 * 2016-10-16
 *
 */
public class DictBank extends BaseModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1937113669784319028L;
	
	private long db_id;
	private String db_code;
	private String db_code_en;
	private String db_name;
	private String db_num;
	public long getDb_id() {
		return db_id;
	}
	public void setDb_id(long db_id) {
		this.db_id = db_id;
	}
	public String getDb_code() {
		return db_code;
	}
	public void setDb_code(String db_code) {
		this.db_code = db_code;
	}
	public String getDb_name() {
		return db_name;
	}
	public void setDb_name(String db_name) {
		this.db_name = db_name;
	}
	public String getDb_num() {
		return db_num;
	}
	public void setDb_num(String db_num) {
		this.db_num = db_num;
	}
	/**
	 * @return the db_code_en
	 */
	public String getDb_code_en() {
		return db_code_en;
	}
	/**
	 * @param db_code_en the db_code_en to set
	 */
	public void setDb_code_en(String db_code_en) {
		this.db_code_en = db_code_en;
	}

	//这个用来显示在PickerView上面的字符串,PickerView会通过反射获取getPickerViewText方法显示出来。
	public String getPickerViewText() {
		//这里还可以判断文字超长截断再提供显示
		return db_name;
	}


}
