/**
 *
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;


/**
 * @author cnyxlxw
 * 2016-10-16
 */
public class CauModel extends BaseModel {

    /**
     *
     */
    private static final long serialVersionUID = 1937113669784319028L;

    private String cau_name;
    private String cau_value;
    private int cau_type;

    public int getCau_type() {
        return cau_type;
    }
    //1客服电话
    //2联系邮箱
    //3官网地址
    //4微信公众号名称
    //5qq

    public void setCau_type(int cau_type) {
        this.cau_type = cau_type;
    }

    public String getCau_name() {
        return cau_name;
    }

    public void setCau_name(String cau_name) {
        this.cau_name = cau_name;
    }

    public String getCau_value() {
        return cau_value;
    }

    public void setCau_value(String cau_value) {
        this.cau_value = cau_value;
    }
}
