package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req6004 extends BaseReq {

    private Body body;

    public static class Body {
        private String user_name;
        private String user_pwd;
        private String abi_code;

        public String getAbi_code() {
            return abi_code;
        }

        public void setAbi_code(String abi_code) {
            this.abi_code = abi_code;
        }

        private String random_str = RandomUtils.generateString(32);

        /**
         * @return the user_name
         */
        public String getUser_name() {
            return user_name;
        }

        /**
         * @param user_name the user_name to set
         */
        public void setUser_name(String user_name) {
            this.user_name = user_name;
        }

        /**
         * @return the user_pwd
         */
        public String getUser_pwd() {
            return user_pwd;
        }

        /**
         * @param user_pwd the user_pwd to set
         */
        public void setUser_pwd(String user_pwd) {
            this.user_pwd = user_pwd;
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
