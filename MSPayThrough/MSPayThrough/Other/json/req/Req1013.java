package com.tendpay.business.json.req;

import com.tendpay.business.json.BaseReq;
import com.tendpay.business.util.RandomUtils;

public class Req1013 extends BaseReq {

    private Body body;

    public static class Body {
        private String mcp_id;
        private String mcp_card_no;
        private String start_time;
        private String end_time;
        private int start;
        private int size;
        private String random_str = RandomUtils.generateString(32);

        public String getMcp_id() {
            return mcp_id;
        }

        public void setMcp_id(String mcp_id) {
            this.mcp_id = mcp_id;
        }

        public String getMcp_card_no() {
            return mcp_card_no;
        }

        public void setMcp_card_no(String mcp_card_no) {
            this.mcp_card_no = mcp_card_no;
        }

        public String getStart_time() {
            return start_time;
        }

        public void setStart_time(String start_time) {
            this.start_time = start_time;
        }

        public String getEnd_time() {
            return end_time;
        }

        public void setEnd_time(String end_time) {
            this.end_time = end_time;
        }

        public int getStart() {
            return start;
        }

        public void setStart(int start) {
            this.start = start;
        }

        public int getSize() {
            return size;
        }

        public void setSize(int size) {
            this.size = size;
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
