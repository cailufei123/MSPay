package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

import java.util.List;

/**
 * @author cnyxlxw
 */
public class Resp99007 extends BaseResp {

    public Body body;

    public static class Body {
        List<Notice> cn_list;
        private String random_str = RandomUtils.generateString(32);

        public List<Notice> getCn_list() {
            return cn_list;
        }

        public void setCn_list(List<Notice> cn_list) {
            this.cn_list = cn_list;
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
