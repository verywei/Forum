package cn.jlsysql.service.impl;

import cn.jlsysql.dao.ForumDao;
import cn.jlsysql.entity.Forum;
import cn.jlsysql.pojo.AddBlog;
import cn.jlsysql.pojo.ForumKindCount;
import cn.jlsysql.service.ForumService;
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
public class ForumServiceImpl implements ForumService{
    @Autowired
    ForumDao forumDao;
    @Override
    public List<Forum> getAllForum() {
        return forumDao.getAllForum();
    }

    @Override
    public Forum getForumById(int id) {
        return forumDao.getForumById(id);
    }

    @Override
    public void addForum(AddBlog addBlog) {
        forumDao.addForum(addBlog);
    }

    @Override
    public List<ForumKindCount> getForumKindCount() {
        return forumDao.getForumKindCount();
    }
}
