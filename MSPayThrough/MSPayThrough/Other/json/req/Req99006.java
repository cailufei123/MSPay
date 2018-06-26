package com.tendpay.business.json.req;


import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req99006
        extends BaseReq {

    private Body body;

    public static class Body {
        private int mv_version_type;
        private String abi_code;

        public String getAbi_code() {
            return abi_code;
        }

        public void setAbi_code(String abi_code) {
            this.abi_code = abi_code;
        }

        private String random_str = RandomUtils.generateString(32);

        public int getMv_version_type() {
            return mv_version_type;
        }

        public void setMv_version_type(int mv_version_type) {
            this.mv_version_type = mv_version_type;
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
