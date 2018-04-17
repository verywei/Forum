package cn.jlsysql.controller;

import cn.jlsysql.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("/")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        modelAndView.addObject("blogs",blogService.getAllBlogs());
        return  modelAndView;
    }
    @RequestMapping("/details/{id}")
    public  ModelAndView details(@PathVariable("id") String id, ModelAndView modelAndView){
        System.out.println("details"+id);
        modelAndView.setViewName("details");
        modelAndView.addObject("blog",blogService.getBlogByid(id));
        return  modelAndView;
    }
    @RequestMapping("/classify/{id}")
    public  ModelAndView classify(@PathVariable String id,ModelAndView modelAndView){
        System.out.println("classify:"+id);
        modelAndView.setViewName("index");
        return modelAndView;
    }

}
