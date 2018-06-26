package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;;
import com.tendpay.business.util.RandomUtils;

public class Req3002 extends BaseReq {

    private Body body;

    public static class Body {

        private String bank_acc_name;
        private String bank_acc_no;
        private String repay_money_total;
        private String qrp_plan_cycle;
        private String qrp_repay_count;

        private String random_str = RandomUtils.generateString(32);

        /**
         * @return the bank_acc_name
         */
        public String getBank_acc_name() {
            return bank_acc_name;
        }

        /**
         * @param bank_acc_name the bank_acc_name to set
         */
        public void setBank_acc_name(String bank_acc_name) {
            this.bank_acc_name = bank_acc_name;
        }

        /**
         * @return the bank_acc_no
         */
        public String getBank_acc_no() {
            return bank_acc_no;
        }

        /**
         * @param bank_acc_no the bank_acc_no to set
         */
        public void setBank_acc_no(String bank_acc_no) {
            this.bank_acc_no = bank_acc_no;
        }

        /**
         * @return the repay_money_total
         */
        public String getRepay_money_total() {
            return repay_money_total;
        }

        /**
         * @param repay_money_total the repay_money_total to set
         */
        public void setRepay_money_total(String repay_money_total) {
            this.repay_money_total = repay_money_total;
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
         * @return the qrp_repay_count
         */
        public String getQrp_repay_count() {
            return qrp_repay_count;
        }

        /**
         * @param qrp_repay_count the qrp_repay_count to set
         */
        public void setQrp_repay_count(String qrp_repay_count) {
            this.qrp_repay_count = qrp_repay_count;
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


        @Override
        public String toString() {
            return "Body{" +
                    "bank_acc_name='" + bank_acc_name + '\'' +
                    ", bank_acc_no='" + bank_acc_no + '\'' +
                    ", repay_money_total='" + repay_money_total + '\'' +
                    ", qrp_plan_cycle='" + qrp_plan_cycle + '\'' +
                    ", qrp_repay_count='" + qrp_repay_count + '\'' +
                    ", random_str='" + random_str + '\'' +
                    '}';
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
