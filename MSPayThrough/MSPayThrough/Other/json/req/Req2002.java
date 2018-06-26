package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req2002 extends BaseReq {

    private Body body;

    public static class Body {
        private String order_id;
        private String check_code;

        public String getOrder_id() {
            return order_id;
        }

        public void setOrder_id(String order_id) {
            this.order_id = order_id;
        }

        public String getCheck_code() {
            return check_code;
        }

        public void setCheck_code(String check_code) {
            this.check_code = check_code;
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
