package cn.jlsysql.controller;

import cn.jlsysql.entity.Blog;
import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.AddBlog;
import cn.jlsysql.pojo.AddComment;
import cn.jlsysql.service.*;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
@Controller
public class BlogController {
    @Autowired
    BlogService blogService;
    @Autowired
    FollowService followService;
    @Autowired
    CommentService commentService;
    @Autowired
    ResourceService resourceService;
    @Autowired
    UserService userService;

    @RequestMapping("/")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        modelAndView.addObject("blogs",blogService.getAllBlogs());
        return  modelAndView;
    }
    @RequestMapping("/test")
    public ModelAndView test(ModelAndView modelAndView){
        modelAndView.setViewName("test");
        return  modelAndView;
    }




    @RequestMapping("/details/{id}")
    public  ModelAndView details(@PathVariable("id") String id, ModelAndView modelAndView, HttpSession session){
        modelAndView.setViewName("details");
        Blog blog=blogService.getBlogByid(id);
        modelAndView.addObject("blog",blog);
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
        int count=Integer.parseInt(((User) session.getAttribute("user")).getBook_amount());
        count++;
        ((User) session.getAttribute("user")).setBook_amount(count+"");
        userService.changeBlogCount(((User) session.getAttribute("user")).getId(),count);
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
    @RequestMapping("/myblog")
    public ModelAndView getMyBlog(ModelAndView modelAndView,HttpSession session){
        modelAndView.setViewName("myblog");
        modelAndView.addObject("resource",resourceService.getAllResorce("1","10"));
        modelAndView.addObject("blog",blogService.getBlogByAuthor(Integer.parseInt(((User)session.getAttribute("user")).getId())));
        return modelAndView;
    }
    @RequestMapping("/getblogbypage")
    public void getBlogByPage(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf8");
        List<Blog> blogs=blogService.getAllBlogsByPage(request.getParameter("page"));
        System.out.println(JSON.toJSONString(blogs));
        response.getWriter().write(JSON.toJSONString(blogs));
    }
}
