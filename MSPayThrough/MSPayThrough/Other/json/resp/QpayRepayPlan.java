package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;

import java.util.Date;

public class QpayRepayPlan extends BaseModel {

    /**
     *
     */
    private static final long serialVersionUID = 7864385008660643305L;

    private Integer qrp_id;

    private Integer mbi_id;

    private String mbi_code;

    private Integer qrp_reserve_money;

    private String qrp_plan_cycle;

    private Integer qrp_repay_count;

    private String qrp_credit_card_no;

    private Integer qrp_repay_day_count;

    private String qrp_repay_date;

    private Integer qrp_repay_money_total;

    private Integer qrp_repay_money_finished;

    private Integer qrp_repay_money_fee_total;

    private Integer qrp_repay_money_fee_pay_total;

    private String qrp_bill_day;

    private String qrp_repay_day;

    private Integer qrp_status;

    private String qrp_create_time;

    private String qrp_update_time;


    /**
     * @return the qrp_reserve_money
     */
    public double getQrp_reserve_money() {
        return qrp_reserve_money;
    }

    /**
     * @param qrp_reserve_money the qrp_reserve_money to set
     */
    public void setQrp_reserve_money(Integer qrp_reserve_money) {
        this.qrp_reserve_money = qrp_reserve_money;
    }

    /**
     * @return the qrp_repay_count
     */
    public Integer getQrp_repay_count() {
        return qrp_repay_count;
    }

    /**
     * @param qrp_repay_count the qrp_repay_count to set
     */
    public void setQrp_repay_count(Integer qrp_repay_count) {
        this.qrp_repay_count = qrp_repay_count;
    }

    /**
     * @return the qrp_id
     */
    public Integer getQrp_id() {
        return qrp_id;
    }

    /**
     * @param qrp_id the qrp_id to set
     */
    public void setQrp_id(Integer qrp_id) {
        this.qrp_id = qrp_id;
    }

    /**
     * @return the mbi_id
     */
    public Integer getMbi_id() {
        return mbi_id;
    }

    /**
     * @param mbi_id the mbi_id to set
     */
    public void setMbi_id(Integer mbi_id) {
        this.mbi_id = mbi_id;
    }

    /**
     * @return the mbi_code
     */
    public String getMbi_code() {
        return mbi_code;
    }

    /**
     * @param mbi_code the mbi_code to set
     */
    public void setMbi_code(String mbi_code) {
        this.mbi_code = mbi_code;
    }

    /**
     * @return the qrp_plan_cycle
     */
    public String getQrp_plan_cycle() {
        return qrp_plan_cycle;
    }

    /**
     * @param qrp_plan_cycle the qrp_plan_cycle to set
     */
    public void setQrp_plan_cycle(String qrp_plan_cycle) {
        this.qrp_plan_cycle = qrp_plan_cycle;
    }

    /**
     * @return the qrp_credit_card_no
     */
    public String getQrp_credit_card_no() {
        return qrp_credit_card_no;
    }

    /**
     * @param qrp_credit_card_no the qrp_credit_card_no to set
     */
    public void setQrp_credit_card_no(String qrp_credit_card_no) {
        this.qrp_credit_card_no = qrp_credit_card_no;
    }

    /**
     * @return the qrp_repay_day_count
     */
    public Integer getQrp_repay_day_count() {
        return qrp_repay_day_count;
    }

    /**
     * @param qrp_repay_day_count the qrp_repay_day_count to set
     */
    public void setQrp_repay_day_count(Integer qrp_repay_day_count) {
        this.qrp_repay_day_count = qrp_repay_day_count;
    }

    /**
     * @return the qrp_repay_date
     */
    public String getQrp_repay_date() {
        return qrp_repay_date;
    }

    /**
     * @param qrp_repay_date the qrp_repay_date to set
     */
    public void setQrp_repay_date(String qrp_repay_date) {
        this.qrp_repay_date = qrp_repay_date;
    }

    /**
     * @return the qrp_repay_money_total
     */
    public double getQrp_repay_money_total() {
        return qrp_repay_money_total;
    }

    /**
     * @param qrp_repay_money_total the qrp_repay_money_total to set
     */
    public void setQrp_repay_money_total(Integer qrp_repay_money_total) {
        this.qrp_repay_money_total = qrp_repay_money_total;
    }

    /**
     * @return the qrp_repay_money_finished
     */
    public Integer getQrp_repay_money_finished() {
        return qrp_repay_money_finished;
    }

    /**
     * @param qrp_repay_money_finished the qrp_repay_money_finished to set
     */
    public void setQrp_repay_money_finished(Integer qrp_repay_money_finished) {
        this.qrp_repay_money_finished = qrp_repay_money_finished;
    }

    /**
     * @return the qrp_repay_money_fee_total
     */
    public double getQrp_repay_money_fee_total() {
        return qrp_repay_money_fee_total;
    }

    /**
     * @param qrp_repay_money_fee_total the qrp_repay_money_fee_total to set
     */
    public void setQrp_repay_money_fee_total(Integer qrp_repay_money_fee_total) {
        this.qrp_repay_money_fee_total = qrp_repay_money_fee_total;
    }

    /**
     * @return the qrp_repay_money_fee_pay_total
     */
    public double getQrp_repay_money_fee_pay_total() {
        return qrp_repay_money_fee_pay_total;
    }

    /**
     * @param qrp_repay_money_fee_pay_total the qrp_repay_money_fee_pay_total to set
     */
    public void setQrp_repay_money_fee_pay_total(
            Integer qrp_repay_money_fee_pay_total) {
        this.qrp_repay_money_fee_pay_total = qrp_repay_money_fee_pay_total;
    }

    /**
     * @return the qrp_bill_day
     */
    public String getQrp_bill_day() {
        return qrp_bill_day;
    }

    /**
     * @param qrp_bill_day the qrp_bill_day to set
     */
    public void setQrp_bill_day(String qrp_bill_day) {
        this.qrp_bill_day = qrp_bill_day;
    }

    /**
     * @return the qrp_repay_day
     */
    public String getQrp_repay_day() {
        return qrp_repay_day;
    }

    /**
     * @param qrp_repay_day the qrp_repay_day to set
     */
    public void setQrp_repay_day(String qrp_repay_day) {
        this.qrp_repay_day = qrp_repay_day;
    }

    /**
     * @return the qrp_status
     */
    public Integer getQrp_status() {
        return qrp_status;
    }

    /**
     * @param qrp_status the qrp_status to set
     */
    public void setQrp_status(Integer qrp_status) {
        this.qrp_status = qrp_status;
    }

    public String getQrp_create_time() {
        return qrp_create_time;
    }

    public void setQrp_create_time(String qrp_create_time) {
        this.qrp_create_time = qrp_create_time;
    }

    public String getQrp_update_time() {
        return qrp_update_time;
    }

    public void setQrp_update_time(String qrp_update_time) {
        this.qrp_update_time = qrp_update_time;
    }

}