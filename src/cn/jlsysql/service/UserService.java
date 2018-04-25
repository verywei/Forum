package cn.jlsysql.service;

import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.ChangePassword;
import cn.jlsysql.pojo.LoginUser;
import cn.jlsysql.pojo.RegistUser;

import javax.servlet.http.HttpSession;

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
public interface UserService {
    boolean checkUser(LoginUser user, HttpSession session);
    boolean addUser(RegistUser user);
    boolean changePassword(ChangePassword changePassword,String username);
}
