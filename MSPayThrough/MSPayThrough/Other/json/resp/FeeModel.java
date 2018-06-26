/**
 *
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;


/**
 * @author cnyxlxw
 * 2016-10-16
 */
public class FeeModel extends BaseModel {

    /**
     *
     */
    private static final long serialVersionUID = 1937113669784319028L;

    private String fee_name;
    private String fee_value;

    public String getFee_name() {
        return fee_name;
    }

    public void setFee_name(String fee_name) {
        this.fee_name = fee_name;
    }

    public String getFee_value() {
        return fee_value;
    }

    public void setFee_value(String fee_value) {
        this.fee_value = fee_value;
    }
}
