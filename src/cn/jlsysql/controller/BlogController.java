package cn.jlsysql.controller;

import cn.jlsysql.entity.Blog;
import cn.jlsysql.entity.User;
import cn.jlsysql.service.BlogService;
import cn.jlsysql.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
@Controller
public class BlogController {
    @Autowired
    BlogService blogService;
    @Autowired
    FollowService followService;
    @RequestMapping("/")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        modelAndView.addObject("blogs",blogService.getAllBlogs());
        return  modelAndView;
    }
    @RequestMapping("/details/{id}")
    public  ModelAndView details(@PathVariable("id") String id, ModelAndView modelAndView, HttpSession session){
        System.out.println("details"+id);
        modelAndView.setViewName("details");
        Blog blog=blogService.getBlogByid(id);
        modelAndView.addObject("blog",blog);
        User user=((User)session.getAttribute("user"));
        modelAndView.addObject("canfollow",followService.canFollow(blog.getAuthor().getId(), user==null?"0":user.getId()));
        return  modelAndView;
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

}
