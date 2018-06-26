/**
 *
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;


/**
 * @author cnyxlxw
 *         2016-10-16
 */
public class TerminalRecode extends BaseModel {

    /**
     *
     */
    private static final long serialVersionUID = 1937113669784319028L;
    private String tm_card_no;
    private String tm_serial_no;
    private double tm_transaction_money;
    private String tm_create_time;


    public String getTm_card_no() {
        return tm_card_no;
    }

    public void setTm_card_no(String tm_card_no) {
        this.tm_card_no = tm_card_no;
    }

    public String getTm_serial_no() {
        return tm_serial_no;
    }

    public void setTm_serial_no(String tm_serial_no) {
        this.tm_serial_no = tm_serial_no;
    }

    public double getTm_transaction_money() {
        return tm_transaction_money;
    }

    public void setTm_transaction_money(double tm_transaction_money) {
        this.tm_transaction_money = tm_transaction_money;
    }

    public String getTm_create_time() {
        return tm_create_time;
    }

    public void setTm_create_time(String tm_create_time) {
        this.tm_create_time = tm_create_time;
    }
}
