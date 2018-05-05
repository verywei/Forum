package cn.jlsysql.dao;

import cn.jlsysql.entity.Blog;
import cn.jlsysql.pojo.AddBlog;

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
public interface BlogDao {
    List<Blog> getAllBlogs();
    List<Blog> getAllBlogsByPage(int page);
    List<Blog> getBlogByPage(int page);
    List<Blog> getBlogByKind(int kind);
    List<Blog> getBlogByAuthor(int author);
    Blog getBlogById(String id);
    void addBlog(AddBlog addBlog);
    void addVisit(int id);
}
