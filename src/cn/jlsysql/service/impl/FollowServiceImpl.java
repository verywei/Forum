package cn.jlsysql.service.impl;

import cn.jlsysql.dao.FollowDao;
import cn.jlsysql.entity.Follow;
import cn.jlsysql.pojo.GetFollow;
import cn.jlsysql.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
public class FollowServiceImpl implements FollowService {
    @Autowired
    FollowDao followDao;
    @Override
    public boolean canFollow(String followed, String follower) {
        if (followed.equals(follower)){
            return false;
        }
        GetFollow getFollow=new GetFollow();
        getFollow.setFollowed(Integer.parseInt(followed));
        getFollow.setFollower(Integer.parseInt(follower));
       List<Follow>follows= followDao.getFollow(getFollow);
      return follows.size()>0?false:true;
    }

    @Override
    public boolean addFollow(String followed, String follower) {
        GetFollow getFollow=new GetFollow();
        getFollow.setFollowed(Integer.parseInt(followed));
        getFollow.setFollower(Integer.parseInt(follower));
        System.out.println("follow");
        followDao.addFollow(getFollow);

        return true;
    }
}
