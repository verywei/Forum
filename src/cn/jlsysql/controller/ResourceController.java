package cn.jlsysql.controller;

import cn.jlsysql.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
public class ResourceController {
    @Autowired
    ResourceService resourceService;
    @RequestMapping("/resource")
    public ModelAndView resource(ModelAndView modelAndView){
        modelAndView.setViewName("resource");
        modelAndView.addObject("resources",resourceService.getAllResorce(""+1,""+10));
        return  modelAndView;
    }
    @RequestMapping("/filedownload/{id}")
    public  ModelAndView filedownload(@PathVariable String id, ModelAndView modelAndView){
        modelAndView.setViewName("filedownload");
        modelAndView.addObject("resource",resourceService.getResourceById(id));
        return modelAndView;
    }
}
