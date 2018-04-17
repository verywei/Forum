package cn.jlsysql.controller;

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
public class TribuneController {
    @RequestMapping("/tribune")
    public ModelAndView tribune(ModelAndView modelAndView){
        modelAndView.setViewName("tribune");
        return  modelAndView;
    }
    @RequestMapping("/tribune/classify/{id}")
    public  ModelAndView tribune(@PathVariable String id, ModelAndView modelAndView){
        System.out.println("tribune.classify.id:"+id);
        modelAndView.setViewName("tribune");
        return  modelAndView;
    }
    @RequestMapping("/topics/{id}")
    public  ModelAndView topics(@PathVariable String id,ModelAndView modelAndView){
        System.out.println("topics:"+id);
        modelAndView.setViewName("topics");
        return modelAndView;
    }
}
