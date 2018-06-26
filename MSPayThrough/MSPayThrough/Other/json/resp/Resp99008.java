package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

import java.util.ArrayList;

/**
 * @author cnyxlxw
 */
public class Resp99008 extends BaseResp {

    public Body body;

    public static class Body {
        private ArrayList<CauModel> cau_list;

        private String random_str = RandomUtils.generateString(32);


        public ArrayList<CauModel> getCau_list() {
            return cau_list;
        }

        public void setCau_list(ArrayList<CauModel> cau_list) {
            this.cau_list = cau_list;
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
