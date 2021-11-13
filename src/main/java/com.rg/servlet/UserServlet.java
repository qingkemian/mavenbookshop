package com.rg.servlet;

import com.google.gson.Gson;
import com.rg.entity.Gender;
import com.rg.entity.User;
import com.rg.service.UserService;
import com.rg.service.impl.UserServiceImpl;
import com.rg.utils.JavaMailUtils;
import com.rg.utils.RandomUtils;
import com.rg.utils.WebUtils;
import com.rg.utils.htmlText;
import com.sun.deploy.net.HttpRequest;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * @Describe：
 * @Author:ZelongChen
 * @Date:2021/11/12 10:01
 */
@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {

    private static String classname = UserServlet.class.getName();
    private static Logger log = Logger.getLogger(classname);

    UserService userService = new UserServiceImpl();

    /**
     * 检查用户名是否存在
     * @param req
     * @param resp
     * @throws IOException
     */
    protected void ajaxExistUserName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取用户名
        String userName = req.getParameter("uname");

        User user = new User();
        user.setUname(userName);

        //调用服务层
        boolean existUserName = userService.existUserName(user);

        //创建存储结果的Map
        Map<String,Object> resultMap = new HashMap<String,Object>(1);

        //存放结果
        resultMap.put("existsUserName",existUserName);

        //JSon转换
        Gson gson = new Gson();

        //转换成字符串
        String json = gson.toJson(resultMap);

        //输出字符串
        resp.getWriter().write(json);
    }

    /**
     * 登录服务
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) WebUtils.copygetParameterMapToBean(req.getParameterMap(), new User());

        User dbUser = userService.login(user);

        if (dbUser != null){

            log.info("username:"+dbUser.getUname());
            log.info("userId:"+dbUser.getUid());
            System.out.println("username:"+dbUser.getUname());
            System.out.println("userId:"+dbUser.getUid());

            User sessionUser = new User();
            sessionUser.setUid(dbUser.getUid());
            sessionUser.setUname(dbUser.getUname());

            //user信息
            //登录成功的信息存放到session
            req.getSession().setAttribute("user",sessionUser);

            resp.sendRedirect("goodsServlet?action=goodsList");
        } else {
            //回传信息
            req.setAttribute("msg","用户名或者密码错误！");
            req.setAttribute("uname",user.getUname());

            //跳转到登录页面
            req.getRequestDispatcher("bookshop/login.jsp").forward(req,resp);
        }

    }

    /**
     * 用户注销
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //销毁session
        req.getSession().invalidate();

        //跳转到登录页面
        resp.sendRedirect("bookshop/index.jsp");

    }

    /**
     * 获取验证码功能
     * @param req
     * @param resp
     */
    protected void getCode(HttpServletRequest req, HttpServletResponse resp){
        log.info("postEmail!!!");
        try {
            String email = req.getParameter("email");
            JavaMailUtils.receiveMailAccount = email; // 给用户输入的邮箱发送邮件

            // 1、创建参数配置，用于连接邮箱服务器的参数配置
            Properties props = new Properties();
            // 开启debug调试
            props.setProperty("mail.debug", "true");
            // 发送服务器需要身份验证
            props.setProperty("mail.smtp.auth", "true");
            // 设置右键服务器的主机名
            props.setProperty("mail.host", JavaMailUtils.emailSMTPHost);
            // 发送邮件协议名称
            props.setProperty("mail.transport.protocol", "smtp");

            // 2、根据配置创建会话对象，用于和邮件服务器交互
            Session session = Session.getInstance(props);
            // 设置debug，可以查看详细的发送log
            session.setDebug(true);
            // 3、创建一封邮件
            String code = RandomUtils.getRandom();
            log.info("emailCode：" + code);
            String html = htmlText.html(code);
            MimeMessage message = JavaMailUtils.creatMimeMessage(session, JavaMailUtils.emailAccount,
                    JavaMailUtils.receiveMailAccount, html);

            // 4、根据session获取邮件传输对象
            Transport transport = session.getTransport();
            // 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
            transport.connect(JavaMailUtils.emailAccount, JavaMailUtils.emailPassword);
            // 6、发送邮件,发送所有收件人地址
            transport.sendMessage(message, message.getAllRecipients());
            // 7、关闭连接
            transport.close();
            //  写入session
            req.getSession().setAttribute("code", code);
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("error", "postEmailError");
        }
    }

    /**
     * 用测试的验证码
     * 正式使用时记得回到register.jsp中修改
     */
    protected void getCodeForTest(HttpServletRequest req, HttpServletResponse resp){
        String code = RandomUtils.getRandom();
        log.info("emailCode:" + code);
        req.getSession().setAttribute("code", code);
    }

    /**
     * 注册功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取session中的验证码
        String sessionCode = (String) req.getSession().getAttribute("code");
        log.info("sessionCode:"+sessionCode);

        // 获取用户输入的信息
        String uname = req.getParameter("uname");
        String upwd = req.getParameter("upwd");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String sex = req.getParameter("sex");
        log.info("GetParameter--->" + "uname:" + uname + ",upwd:" + upwd + ",email:" + email + ",phone:" + phone + ",sex:" + sex);

        // 对user数据进行封装
        User user = new User();

        user.setUname(uname);
        user.setUpwd(upwd);
        user.setEmail(email);
        user.setPhone(phone);
        user.setRegistDate(new Date());

        if (sex == "male"){
            user.setSex(Gender.MALE);
        } else {
            user.setSex(Gender.FEMALE);
        }

        boolean flag =true;


        if(sessionCode != null) {
            //  获取页面提交的验证码
            String inputCode = req.getParameter("code");
            log.info("GetInputCode:" + inputCode);
            if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
                if (userService.existUserName(user)){
                   flag = false;
                }

                if (flag){
                    flag = userService.addUser(user);
                }

            }else {
                flag = false;
                //错误信息
                req.setAttribute("msg","验证码错误！");
            }
        }else {
            flag = false;
            //错误信息
            req.setAttribute("msg","验证码为空！");
        }

        if (flag){
            //  验证成功，跳转登录页面
            resp.sendRedirect("bookshop/login.jsp");
        } else {
            //错误信息
            req.setAttribute("msg","验证码错误！");
            //回显用户名
            req.setAttribute("uname",user.getUname());
            // 回显示手机号
            req.setAttribute("phone", user.getPhone());
            //回显邮件地址
            req.setAttribute("email",user.getEmail());
            //  验证失败
            req.getRequestDispatcher("bookshop/register.jsp").forward(req, resp);
        }

        //  移除session中的验证码，防止表单重复提交
        req.removeAttribute("code");

    }

}
