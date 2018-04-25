package cn.jlsysql.dao;

import cn.jlsysql.entity.Forum;
import cn.jlsysql.pojo.AddBlog;
import cn.jlsysql.pojo.ForumKindCount;

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
public interface ForumDao {
    List<Forum> getAllForum();
    Forum getForumById(int id);
    List<Forum> getForumByKind(int kind);
    void  addForum(AddBlog addBlog);
    List<ForumKindCount> getForumKindCount();
}
