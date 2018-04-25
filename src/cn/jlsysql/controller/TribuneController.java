package cn.jlsysql.controller;

import cn.jlsysql.dao.ForumDao;
import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.AddBlog;
import cn.jlsysql.pojo.AddForumComment;
import cn.jlsysql.service.ForumCommentService;
import cn.jlsysql.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class TribuneController {
    @Autowired
    ForumService forumService;
    @Autowired
    ForumCommentService forumCommentService;

    @RequestMapping("/tribune")
    public ModelAndView tribune(ModelAndView modelAndView) {
        modelAndView.setViewName("tribune");
        modelAndView.addObject("forums", forumService.getAllForum());
        modelAndView.addObject("kind",forumService.getForumKindCount());
//        System.out.println();
        return modelAndView;
    }

    @RequestMapping("/tribune/classify/{id}")
    public ModelAndView tribune(@PathVariable String id, ModelAndView modelAndView) {
        System.out.println("tribune.classify.id:" + id);
        modelAndView.setViewName("tribune");
        return modelAndView;
    }

    @RequestMapping("/topics/{id}")
    public ModelAndView topics(@PathVariable String id, ModelAndView modelAndView) {
        System.out.println("topics:" + id);
        modelAndView.setViewName("topics");
        System.out.println(forumService.getForumById(Integer.parseInt(id)));
        modelAndView.addObject("forum", forumService.getForumById(Integer.parseInt(id)));
        return modelAndView;
    }
    @RequestMapping(value = {"/addforum"},method = {RequestMethod.GET})
    public ModelAndView addForum(ModelAndView modelAndView,AddBlog addBlog){

        modelAndView.addObject("blog",addBlog);
        modelAndView.setViewName("addforum");
        return modelAndView;
    }

    @RequestMapping(value = {"/addforum"},method = {RequestMethod.POST})
    public ModelAndView addForumPost(ModelAndView modelAndView,AddBlog addBlog,HttpSession session){
        addBlog.setAuthor(Integer.parseInt(((User)session.getAttribute("user")).getId()));
        modelAndView.addObject("blog",addBlog);
        modelAndView.setViewName("addforum");
        forumService.addForum(addBlog);
        return modelAndView;
    }

    @RequestMapping("/addcomment")
    public void addComment(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        AddForumComment addForumComment = new AddForumComment();
        addForumComment.setAuthor(Integer.parseInt(((User) session.getAttribute("user")).getId()));
        addForumComment.setContent(request.getParameter("data"));
        addForumComment.setForum(1);
        addForumComment.setPraise(0);
        addForumComment.setForum(Integer.parseInt(request.getParameter("id")));
        forumCommentService.addForumComment(addForumComment);
        response.getWriter().write("{status:ok}");
    }
}
