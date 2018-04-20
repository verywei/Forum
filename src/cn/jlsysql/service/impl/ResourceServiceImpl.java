package cn.jlsysql.service.impl;

import cn.jlsysql.dao.ResourceDao;
import cn.jlsysql.entity.Resource;
import cn.jlsysql.pojo.AddResource;
import cn.jlsysql.pojo.Page;
import cn.jlsysql.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    ResourceDao resourceDao;
    @Override
    public List<Resource> getAllResorce(String page, String limit) {
        Page page1=new Page();
        page1.setLimit(Integer.parseInt(limit));
        page1.setPage(((Integer.parseInt(page)-1)*Integer.parseInt(limit)));
        return resourceDao.getAllResource(page1);
    }

    @Override
    public List<Resource> getResorceByTime(String page, String limit) {
        Page page1=new Page();
        page1.setLimit(Integer.parseInt(limit));
        page1.setPage(((Integer.parseInt(page)-1)*Integer.parseInt(limit)));
        return resourceDao.getResourceByTime(page1);
    }

    @Override
    public Resource getResourceById(String id) {
        return resourceDao.getResourceById(id);
    }

    @Override
    public void addResource(AddResource addResource) {
        resourceDao.addResource(addResource);
    }
}
