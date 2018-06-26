/**
 *
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;


/**
 * @author cnyxlxw
 *         2016-10-16
 */
public class RateChannel extends BaseModel {

    /**
     *
     */
    private static final long serialVersionUID = 1937113669784319028L;
    private int channel_type;
    private String channel_type_desc;

    public int getChannel_type() {
        return channel_type;
    }

    public void setChannel_type(int channel_type) {
        this.channel_type = channel_type;
    }

    public String getChannel_type_desc() {
        return channel_type_desc;
    }

    public void setChannel_type_desc(String channel_type_desc) {
        this.channel_type_desc = channel_type_desc;
    }
}
