package com.me.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回类
 * @author HAN
 * @version 1.0
 * @create 03-01-2:47
 */
public class Message {

    // 状态码 100-成功， 200-失败
    private int code;

    // 提示信息
    private String msg;

    // 用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<>();

    public static Message success() {
        Message message = new Message();
        message.setCode(100);
        message.setMsg("处理成功");
        return message;
    }

    public static Message fail() {
        Message message = new Message();
        message.setCode(200);
        message.setMsg("处理失败");
        return message;
    }

    public Message add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
