package cn.jlsysql.controller;

import cn.jlsysql.entity.Blog;
import cn.jlsysql.pojo.ChangePassword;
import cn.jlsysql.pojo.LoginUser;
import cn.jlsysql.pojo.PersonInfo;
import cn.jlsysql.pojo.RegistUser;
import cn.jlsysql.service.BlogService;
import cn.jlsysql.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParsePosition;

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
public class UserController {
    @Resource
    UserService userService;
    @Resource
    BlogService blogService;
    @RequestMapping(value = {"/register"},method = {RequestMethod.GET})
    public ModelAndView registerGet(ModelAndView modelAndView, RegistUser user){
        modelAndView.setViewName("register");
        modelAndView.addObject("user",user);
        return modelAndView;
    }
    @RequestMapping(value = {"/register"},method = {RequestMethod.POST})
    public ModelAndView registerPost( @Valid @ModelAttribute("user") RegistUser user, Errors errors,ModelAndView modelAndView){
        if (errors.hasErrors()){
            modelAndView.setViewName("register");
            modelAndView.addObject("user" ,user);
        }else {
            userService.addUser(user);
            modelAndView.setViewName("createok");
        }


        return modelAndView;
    }
    @RequestMapping(value = {"/login"},method = {RequestMethod.GET})
    public ModelAndView loginGet(ModelAndView modelAndView, LoginUser user){
        modelAndView.setViewName("login");
        modelAndView.addObject("user",user);
        return modelAndView;
    }
    @RequestMapping(value = {"/login"},method = {RequestMethod.POST})
    public ModelAndView loginPost( @Validated @ModelAttribute("user") LoginUser user, Errors errors , HttpSession session,ModelAndView modelAndView){

        if (userService.checkUser(user,session)&&(!errors.hasErrors())){
            modelAndView.setViewName("index");
            modelAndView.addObject("blogs",blogService.getAllBlogs());
        }else {
            modelAndView.addObject("errors",errors);
            modelAndView.setViewName("login");
        }
        modelAndView.addObject("user",user);
        return modelAndView;
    }
    @RequestMapping(value = {"/logout"},method = {RequestMethod.GET})
    public ModelAndView logout(ModelAndView modelAndView, HttpSession session, HttpServletRequest request){
        System.out.println(request.getRequestURL());
        session.invalidate();
        modelAndView.addObject("blogs",blogService.getAllBlogs());
        modelAndView.setViewName("index");
        return modelAndView;
    }
    @RequestMapping(value = {"usersetting"})
    public ModelAndView userSetting(ModelAndView modelAndView, ChangePassword changePassword, PersonInfo personInfo){
        modelAndView.setViewName("usersetting");
        modelAndView.addObject("changePassword",changePassword);
        modelAndView.addObject("personInfo",personInfo);
        return modelAndView;
    }
    @RequestMapping("/upload")
    public  ModelAndView upload(ModelAndView modelAndView){
        modelAndView.setViewName("usersetting");
        return  modelAndView;
    }
}