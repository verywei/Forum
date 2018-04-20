package cn.jlsysql.util;

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
public enum Kind {
    KIND1("人工智能",1),KIND2("大数据",2),KIND3("区块链",3),KIND4("数据库",4),
    KIND5("前端",5),KIND6("移动开发",6),KIND7("物联网",7),KIND8("运维",8),KIND9("编程语言",9),
    KIND10("框架",10),KIND11("安全",11),KIND12("游戏开发",12);
    private String name;
    private int index;
    Kind(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
    public static Kind getKind1(int index){
        switch (index){
            case 1:{
                return KIND1;
            }case 2:{
                return KIND2;
            }case 3:{
                return KIND3;
            }case 4:{
                return KIND4;
            }case 5:{
                return KIND5;
            }case 6:{
                return KIND6;
            }case 7:{
                return KIND7;
            }case 8:{
                return KIND8;
            }case 9:{
                return KIND9;
            }case 10:{
                return KIND10;
            }case 11:{
                return KIND11;
            }case 12:{
                return KIND12;
            }default:return null;

        }
    }
}
