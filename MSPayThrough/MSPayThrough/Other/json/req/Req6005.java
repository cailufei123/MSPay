package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req6005 extends BaseReq {

    private Body body;

    public static class Body {
        private String mobile;
        private String validate_code;
        private String user_pwd;
        private String invited_mobile;
        private String abi_code;
        private String random_str = RandomUtils.generateString(32);


        public String getAbi_code() {
            return abi_code;
        }

        public void setAbi_code(String abi_code) {
            this.abi_code = abi_code;
        }

        /**
         * @return the mobile
         */
        public String getMobile() {
            return mobile;
        }

        /**
         * @param mobile the mobile to set
         */
        public void setMobile(String mobile) {
            this.mobile = mobile;
        }

        /**
         * @return the validate_code
         */
        public String getValidate_code() {
            return validate_code;
        }

        /**
         * @param validate_code the validate_code to set
         */
        public void setValidate_code(String validate_code) {
            this.validate_code = validate_code;
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

        public String getInvited_mobile() {
            return invited_mobile;
        }

        public void setInvited_mobile(String invited_mobile) {
            this.invited_mobile = invited_mobile;
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
