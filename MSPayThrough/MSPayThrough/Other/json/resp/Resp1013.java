package com.tendpay.business.json.resp;

import com.tendpay.business.json.BaseResp;
import com.tendpay.business.util.RandomUtils;

import java.util.List;

/**
 * @author cnyxlxw
 */
public class Resp1013 extends BaseResp {

    public Body body;

    public static class Body {
        List<TerminalRecode> tm_list;
        private String random_str = RandomUtils.generateString(32);

        public List<TerminalRecode> getTm_list() {
            return tm_list;
        }

        public void setTm_list(List<TerminalRecode> tm_list) {
            this.tm_list = tm_list;
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
