package cn.jlsysql.util;

import cn.jlsysql.pojo.FileUp;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
public class FileUtil {
    public static String  saveFile(HttpServletRequest request, MultipartFile file,String paths) throws IOException {
        if (file!=null){
            //"/img/userimg/"
            String type=file.getOriginalFilename().split("\\.")[1];
            String path=request.getServletContext().getRealPath(paths);
            String filename=System.currentTimeMillis()+"."+type;
            File filePath=new File(path,filename);
            if (!filePath.getParentFile().exists()){
                filePath.getParentFile().mkdirs();
            }
            file.transferTo(new File(path+filename));
            return filename;
        }
        return null;
    }
}
