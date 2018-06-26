package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

import java.util.ArrayList;

/**
 * @author cnyxlxw
 */
public class Resp1005 extends BaseResp {

    public Body body;

    public static class Body {
        private ArrayList<FeeModel> fee_list;

        public ArrayList<FeeModel> getFee_list() {
            return fee_list;
        }

        public void setFee_list(ArrayList<FeeModel> fee_list) {
            this.fee_list = fee_list;
        }

        private String random_str = RandomUtils.generateString(32);

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
