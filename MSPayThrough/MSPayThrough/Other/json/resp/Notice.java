/**
 *
 */
package com.tendpay.business.json.resp;

import com.tendpay.business.basemodule.BaseModel;


/**
 * @author cnyxlxw
 *         2016-10-16
 */
public class Notice extends BaseModel {

    /**
     *
     */
    private static final long serialVersionUID = 1937113669784319028L;

    private String cn_title;
    private String cn_content;
    private String cn_create_time;

    public String getCn_title() {
        return cn_title;
    }

    public void setCn_title(String cn_title) {
        this.cn_title = cn_title;
    }

    public String getCn_content() {
        return cn_content;
    }

    public void setCn_content(String cn_content) {
        this.cn_content = cn_content;
    }

    public String getCn_create_time() {
        return cn_create_time;
    }

    public void setCn_create_time(String cn_create_time) {
        this.cn_create_time = cn_create_time;
    }
}
