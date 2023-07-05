CREATE DATABASE ebooks;
USE ebooks;
-- 创建电子书信息表
CREATE TABLE EbooksInfo(
	id INT(11) NOT NULL AUTO_INCREMENT,
	bookname VARCHAR(30) DEFAULT NULL,
	author VARCHAR(20) DEFAULT NULL,
	isbn VARCHAR(13) DEFAULT NULL,
	press VARCHAR(20) DEFAULT NULL,
	introduction VARCHAR(300) DEFAULT NULL,
	image VARCHAR(20) DEFAULT NULL,
	file VARCHAR(20) DEFAULT NULL,
	download INT(11) DEFAULT NULL,
	PRIMARY KEY(id)
);
-- 向电子书信息表中插入记录
INSERT INTO EbooksInfo VALUES
(1,"响应式Web设计：HTML5和CSS3实战（第2版）","本·弗莱恩 (Ben Frain)","9787115446558","人民邮电出版社"," 本书将当前Web设计中热门的响应式设计技术与HTML5 和CSS3 结合起来，为读者全面深入地讲解了针对各种屏幕大小设计和开发现代网站的各种技术。书中不仅讨论了媒体查询、弹性布局、响应式图片，更将最新和最有用的HTML5 和CSS3 技术一并讲解，是学习最新Web 设计技术不可多得的佳作。","/picture/1.jpg","/file/1.txt",0),
(2,"数据结构(C语言版)","严蔚敏","9787302147510","清华大学出版社"," 数据结构课本","/picture/2.jpg","/file/2.txt",0),
(3,"西游记","吴承恩","9787020008735","现代文学出版社","《西游记》以唐朝高僧玄藏西去拜佛取经这一历史事实的基础，经过作者极具想象力的构思及描写，塑造了神勇忠心的孙悟空，迁腐的唐三藏，好吃懒惰的猪八戒以及勤恳的沙和尚的形象，通过西去取经的磨难与艰辛，从中反映出作者对现实的不满，深刻揭露批判了封建社会的黑暗，腐朽和统治阶级的昏庸凶暴。","/picture/3.jpg","/file/3.txt",0),
(4,"战胜强迫症","李宏夫","9787218140124","广东人民出版社","《战胜强迫症》是一本关注人身心健康成长的著作，摆脱了一般心理学书籍重理论、轻实践的模式，摒弃了长篇大论的说理讲道，着重从心灵自救的角度出发，提出了具体的、可行的疗愈方法——亦止法和观息法。并通过让患者持续不断地练习，达到净化心灵、保持平等心的状态，进而逐渐摆脱强迫症的困扰。可以说，这是一本实用性非常强的身心灵疗愈之书，可以真正帮助强迫症者走出强迫的泥淖，拥有幸福美满的生活。","/picture/4.jpg","/file/4.txt",0),
(5,"ChatGPT: 读懂人工智能新纪元","陈根","9787121451942","电子工业出版社","ChatGPT爆火，标志着人工智能从量变到质变的飞跃，一场新的人工智能革命已经到来。本书共6章，介绍了ChatGPT的诞生和发展，以及ChatGPT背后的技术路线；分析了ChatGPT及大模型训练对全球商业格局的冲击与影响，涉及OpenAI、微软、谷歌、百度、腾讯、阿里巴巴等广受关注的互联网科技公司；选取了具有代表性的行业，解读ChatGPT狂潮引发的产业颠覆与模式创新。同时，本书对未来的强人工智能与人类社会的关系进行了深度研讨。","/picture/5.jpg","/file/5.txt",0),
(6,"Java Web开发系统项目教程","杨文、吴奇英","9787115476531","人民邮电出版社","本书是依据高职高专软件技术专业人才培养目标和定位要求，围绕掌握JavaWeb开发的学习宗旨，以开发电子购物系统项目为主线，设计了四个子项目及一个拓展项目：构建电子购物系统的基础框架、构建电子购物系统的数据库、用JavaBean和Servlet技术开发电子购物系统、部署MVC模式的电子购物系统、阶段项目、短消息系统。","/picture/6.jpg","/file/6.txt",0),
(7,"山海经","（西汉）刘向、（西汉）刘歆","9787547015766","万卷出版公司","《山海经》全书共18卷，包括《山经》5卷、《海经》8卷、《大荒经》4卷、《海内经》1卷。其中14卷是战国时作品，4卷为西汉初年作品。 内容主要为民间传说中的地理知识，包括山川、地理、民族、物产、药物、祭祀、巫医等，保存了不少远古时代的神话传说。","/picture/7.jpg","/file/7.txt",0),
(8,"三体前传：球状闪电","刘慈欣","9787536484276","四川科学技术出版社","一个从未有人想像过的未来，在宇宙观察者的注视下，悄然降临在人类面前……","/picture/8.jpg","/file/8.txt",0);

-- 创建用户表
CREATE TABLE UserInfo(
	id INT(11) NOT NULL AUTO_INCREMENT,	
	username VARCHAR(45) DEFAULT NULL,
	userpassword VARCHAR(45) DEFAULT NULL,
	PRIMARY KEY(id)
);
-- 为用户id设置初始值
ALTER TABLE UserInfo Auto_Increment=1000 
-- 向用户表插入数据
INSERT INTO UserInfo(username,userpassword) VALUES("GGBond","ggbond666.");
INSERT INTO UserInfo(username,userpassword) VALUES("user","user");

-- 创建管理员表
CREATE TABLE AdminInfo(
	id INT(11) NOT NULL AUTO_INCREMENT,	
	adname VARCHAR(45) DEFAULT NULL,
	adpassword VARCHAR(45) DEFAULT NULL,
	PRIMARY KEY(id)
);
-- 为管理员id设置初始值
ALTER TABLE AdminInfo Auto_Increment=1;
-- 向管理员表插入数据
INSERT INTO AdminInfo(adname,adpassword) VALUES("迷糊老师","mihu");