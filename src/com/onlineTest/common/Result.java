package com.onlineTest.common;

import com.onlineTest.enums.ErrorCodeEnum;

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

    public static <T> BaseResponse<T> requestParameterError(String msg) {
        return new BaseResponse<>(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), msg, null);
    }

    public static <T> BaseResponse<T> requestParameterError(String msg, T data) {
        return new BaseResponse<>(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), msg, data);
    }

    public static <T> BaseResponse<T> requestParameterError() {
        return new BaseResponse<>(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), ErrorCodeEnum.REQUEST_PARAMS_ERROR.getMessage(), null);
    }
}
