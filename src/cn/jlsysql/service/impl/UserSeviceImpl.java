package cn.jlsysql.service.impl;

import cn.jlsysql.dao.UserDao;
import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.LoginUser;
import cn.jlsysql.pojo.RegistUser;
import cn.jlsysql.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
@Service
public class UserSeviceImpl implements UserService {
    @Resource
    UserDao userDao;
    @Override
    public boolean checkUser(LoginUser user, HttpSession session) {
        User user1=userDao.getUser(user.getUsername());
        if (user1!=null&&user1.getPassword().equals(user.getPassword())){
            session.setAttribute("user",user1);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean addUser(RegistUser user) {
        User user1=new User();
        user1.setUsername(user.getUsername());
        user1.setPassword(user.getPassword());
        userDao.addUser(user1);
        return true;
    }
}
