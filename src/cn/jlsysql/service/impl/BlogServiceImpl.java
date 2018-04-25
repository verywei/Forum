package cn.jlsysql.service.impl;

import cn.jlsysql.dao.BlogDao;
import cn.jlsysql.entity.Blog;
import cn.jlsysql.pojo.AddBlog;
import cn.jlsysql.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
public class BlogServiceImpl implements BlogService {
    @Autowired
    BlogDao blogDao;
    @Override
    public List<Blog> getAllBlogs() {
        return blogDao.getAllBlogs();
    }

    @Override
    public Blog getBlogByid(String id) {
        Blog blog=blogDao.getBlogById(id);
        blogDao.addVisit(Integer.parseInt(id));
        return blog;
    }

    @Override
    public List<Blog> getBlogByAuthor(int author) {
        return blogDao.getBlogByAuthor(author);
    }

    @Override
    public List<Blog> getBlogByKind(int kind) {
        return blogDao.getBlogByKind(kind);
    }

    @Override
    public void addBlog(AddBlog addBlog) {
        blogDao.addBlog(addBlog);
    }
}
