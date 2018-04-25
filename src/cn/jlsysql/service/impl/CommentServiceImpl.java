package cn.jlsysql.service.impl;

import cn.jlsysql.dao.CommentDao;
import cn.jlsysql.dao.ResourceCommentDao;
import cn.jlsysql.pojo.AddComment;
import cn.jlsysql.pojo.AddResourceComment;
import cn.jlsysql.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;
    @Autowired
    ResourceCommentDao resourceCommentDao;
    @Override
    public void addComment(AddComment addComment) {
        commentDao.addComment(addComment);
    }

    @Override
    public void addResourceComment(AddResourceComment addResourceComment) {
        resourceCommentDao.addResourceComment(addResourceComment);
    }
}
