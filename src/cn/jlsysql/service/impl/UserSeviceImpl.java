package cn.jlsysql.service.impl;

import cn.jlsysql.dao.UserDao;
import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.*;
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

    @Override
    public boolean changePassword(ChangePassword changePassword,String username) {
        User user=userDao.getUser(username);
        if (user.getPassword().equals(changePassword.getOldPass())&&changePassword.getNewPass().equals(changePassword.getConfirmPass())){
            changePassword.setOldPass(username);
            userDao.changePassword(changePassword);
            return true;
        }
        return false;
    }

    @Override
    public boolean changeInfo(String id, String nickname, String img) {
        ChangeInfo changeInfo=new ChangeInfo();
        changeInfo.setId(Integer.parseInt(id));
        changeInfo.setNickname(nickname);
        changeInfo.setImg(img);
        try {
            userDao.changeInfo(changeInfo);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean changeBlogCount(String id, int count) {
        try {
            ChangeCount changeCount=new ChangeCount();
            changeCount.setCount(count);
            changeCount.setId(Integer.parseInt(id));
            userDao.changeBlogCount(changeCount);
        }catch (Exception e){
            return  false;
        }

        return true;
    }

    @Override
    public boolean changeResourceCount(String id, int count) {
        try {
            ChangeCount changeCount=new ChangeCount();
            changeCount.setCount(count);
            changeCount.setId(Integer.parseInt(id));
            userDao.changeResourceCount(changeCount);
        }catch (Exception e){
            return  false;
        }

        return true;
    }
}
