package com.onlineTest.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

public class DateUtils {
    static final Log log = LogFactory.getLog(DateUtils.class);

    public static Timestamp stringToTimestamp(String str, DateFormat format) {
        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            log.error(e.getMessage());
        }
        assert date != null;
        return new Timestamp(date.getTime());
    }
}
