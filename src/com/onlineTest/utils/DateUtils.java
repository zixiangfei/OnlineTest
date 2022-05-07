package com.onlineTest.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.util.Date;

public class DateUtils {

    public static Timestamp stringToTimestamp(String str, DateFormat format) {
        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        assert date != null;
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        return new Timestamp(date.getTime());
    }
}
