package cn.jlsysql.controller;

import cn.jlsysql.entity.Blog;
import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.AddBlog;
import cn.jlsysql.pojo.AddComment;
import cn.jlsysql.service.BlogService;
import cn.jlsysql.service.CommentService;
import cn.jlsysql.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
@Controller
public class BlogController {
    @Autowired
    BlogService blogService;
    @Autowired
    FollowService followService;
    @Autowired
    CommentService commentService;

    @RequestMapping("/")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        modelAndView.addObject("blogs",blogService.getAllBlogs());
        return  modelAndView;
    }
    @RequestMapping("/details/{id}")
    public  ModelAndView details(@PathVariable("id") String id, ModelAndView modelAndView, HttpSession session){
        modelAndView.setViewName("details");
        Blog blog=blogService.getBlogByid(id);
        modelAndView.addObject("blog",blog);
//        System.out.println();
        modelAndView.addObject("authorblog",blogService.getBlogByAuthor(Integer.parseInt(blog.getAuthor().getId())));
        User user=((User)session.getAttribute("user"));
        modelAndView.addObject("canfollow",followService.canFollow(blog.getAuthor().getId(), user==null?"0":user.getId()));
        return  modelAndView;
    }
    @RequestMapping(value = {"/addblog"},method = {RequestMethod.GET})
    public ModelAndView addBlog(ModelAndView modelAndView, AddBlog addBlog){
        modelAndView.setViewName("addblog");
        modelAndView.addObject("blog",addBlog);

        return modelAndView;
    }
    @RequestMapping(value = {"/addblog"},method = {RequestMethod.POST})
    public ModelAndView addBlogPost(ModelAndView modelAndView, AddBlog addBlog,HttpSession session){
        modelAndView.setViewName("addblog");
        modelAndView.addObject("blog",addBlog);
        addBlog.setAuthor(Integer.parseInt(((User)session.getAttribute("user")).getId()));
        addBlog.setContent(addBlog.getContent().replaceAll("\\r\\n","<br>"));
        System.out.println();
        blogService.addBlog(addBlog);
        return modelAndView;
    }
    @RequestMapping("/classify/{id}")
    public  ModelAndView classify(@PathVariable String id,ModelAndView modelAndView){
        if (id.equals("0")){
            modelAndView.addObject("blogs",blogService.getAllBlogs());
        }else {
            modelAndView.addObject("blogs",blogService.getBlogByKind(Integer.parseInt(id)));
        }
        modelAndView.setViewName("index");
        return modelAndView;
    }
    @RequestMapping("/addcomment/{id}")
    public void addComment(@PathVariable String id,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        AddComment addComment=new AddComment();
        addComment.setAuthor(Integer.parseInt((((User)session.getAttribute("user")).getId())));
        addComment.setBlog_id(Integer.parseInt(id));
        addComment.setContent(request.getParameter("data"));
        commentService.addComment(addComment);
        response.getWriter().write("ok");
    }
}
