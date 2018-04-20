package cn.jlsysql.controller;

import cn.jlsysql.entity.User;
import cn.jlsysql.pojo.FileUp;
import cn.jlsysql.pojo.AddResource;
import cn.jlsysql.service.ResourceService;
import cn.jlsysql.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

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
        modelAndView.addObject("resource_by_time",resourceService.getResorceByTime(""+1,""+10));
        return  modelAndView;
    }
    @RequestMapping("/filedownload/{id}")
    public  ModelAndView filedownload(@PathVariable String id, ModelAndView modelAndView){
        modelAndView.setViewName("filedownload");
        modelAndView.addObject("resource",resourceService.getResourceById(id));
        return modelAndView;
    }
    @RequestMapping("/fileupload")
    public ModelAndView fileUpload(ModelAndView modelAndView){
        modelAndView.setViewName("fileupload");
        return  modelAndView;
    }
    @RequestMapping("/submitfile")
    public ModelAndView submitFile(ModelAndView modelAndView, FileUp fileUp, HttpServletRequest request, HttpSession session) throws IOException {
        modelAndView.setViewName("filedownload");
        String url="";
        if(fileUp.getFile()!=null){
             url=FileUtil.saveFile(request, fileUp.getFile(),"/resource/");
        }
        AddResource addResource =new AddResource();
        addResource.setAuthor(Integer.parseInt(((User)session.getAttribute("user")).getId()));
        addResource.setName(fileUp.getTitle());
        addResource.setTime(new Date().toString());
        addResource.setCount(0);
        addResource.setSize((double)fileUp.getFile().getSize()/1048576+"");
        System.out.println(fileUp.getFile().getSize());
        addResource.setUrl(url);
        addResource.setContent(fileUp.getContent());
        resourceService.addResource(addResource);
        modelAndView.addObject("resources",resourceService.getAllResorce(""+1,""+10));
        return modelAndView;
    }

}
