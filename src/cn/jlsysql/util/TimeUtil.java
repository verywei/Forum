package cn.jlsysql.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
                           _ooOoo_
                          o8888888o
                          88" . "88
                          (| -_- |)
                          O\  =  /O
                       ____/`---'\____
                     .'  \\|     |//  `.
                    /  \\|||  :  |||//  \
                   /  _||||| -:- |||||-  \
                   |   | \\\  -  /// |   |
                   | \_|  ''\---/''  |   |
                   \  .-\__  `-`  ___/-. /
                 ___`. .'  /--.--\  `. . __
              ."" '<  `.___\_<|>_/___.'  >'"".
             | | :  `- \`.;`\ _ /`;.`/ - ` : | |
             \  \ `-.   \_ __\ /__ _/   .-` /  /
        ======`-.____`-.___\_____/___.-`____.-'======
                           `=---='
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                 佛祖保佑       永无BUG
*/
public class TimeUtil {
    public static Date stringToDate(String date,String formate){
        SimpleDateFormat dateFormat=new SimpleDateFormat(formate);
        ParsePosition pos = new ParsePosition(0);
        Date date1=dateFormat.parse(date,pos);
        return date1;
    }
    public static String fomatDate(String date,String formate){
        SimpleDateFormat dateFormat=new SimpleDateFormat(formate);
        ParsePosition pos = new ParsePosition(0);
        Date date1=dateFormat.parse(date,pos);
        return dateFormat.format(date1).toString();
    }
}
