package com.onlineTest.common;

public class Result {
    public static <T> BaseResponse<T> success(T data) {
        return new BaseResponse<>(0, "操作成功", data);
    }

    public static <T> BaseResponse<T> error(Integer code, String msg) {
        return new BaseResponse<>(code, msg, null);
    }

    public static <T> BaseResponse<T> error(Integer code, String msg, T data) {
        return new BaseResponse<>(code, msg, data);
    }
}
