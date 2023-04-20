package com.ssm1.controllr;

import com.ssm1.domain.Student;
import com.ssm1.domain.Teacher;
import com.ssm1.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginControllr {
    /**
     * 自动封装登录服务
     */
    @Autowired
    LoginService loginService;

    /**
     *跳转首页
     * @return 转发至图像渲染
     */
    @GetMapping(value = {"/s","/index","/"})
    public String index() {
        return "index";
    }

    /**
     * 退出登录
     * @param request
     * @return 转发至图像渲染
     */
    @GetMapping(value = {"/logout"})
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("newUser");
        return "index";
    }

    /**
     * 用户登录
     * @param loginId 登录账号
     * @param password 登陆密码
     * @param yzm 验证码
     * @param request
     * @return 转发至图像渲染
     */
    @PostMapping("/login")
    public String login(
            @RequestParam(value = "username",required = false) String loginId,
            @RequestParam(value = "password",required = false) String password,
            @RequestParam(value = "yzm",required = false) String yzm,
            HttpServletRequest request
    ){
        if(yzm.length()<1||password.length()<1||loginId.length()<1){
            request.setAttribute("return","登录失败！！！");
            return "/index";
        }
        if(!loginService.yzmyz(request, Integer.parseInt(yzm))){
            request.setAttribute("return","验证码错误！！！");
            return "/index";
            }

//         loginId ="0200";
//         password = "123456";

//         loginId ="2222";
//         password = "159487";
        if (loginId.charAt(1)=='2' || loginId.equals("root")){
            Teacher teacher = new Teacher();
            teacher.setLoginId(loginId);
            teacher.setUserpassword(password);
            Teacher user = loginService.login(teacher);
//            try {
            if (user.getLoginId()==""|| user.getLoginId()==null){
                request.setAttribute("return","用户不存在！！！");
                return "/index";
            }
            if (!user.getUserpassword().equals(password)){
                request.setAttribute("return","密码错误！！！");

                return "/index";
            }
            request.getSession().setAttribute("newUser",user);
            return "/indexFrame";
//            }catch (Exception e){
//                e.printStackTrace();
//            }
        }
        Student teacher = new Student();
        teacher.setStudentId(loginId);
        teacher.setStudentpassword(password);
        Student user = loginService.loginStudent(teacher);
        if (user.getStudentId()==""|| user.getStudentId()==null){
            request.setAttribute("return","用户不存在！！！");
            return "/index";
        }
        if (!user.getStudentpassword().equals(password)){
            request.setAttribute("return","密码错误！！！");

            return "/index";
        }
        request.getSession().setAttribute("newUser",user);
        return "/indexFrame";
    }

    /**
     * 验证码获取
     * @param request
     * @param response
     */
    @GetMapping("/yzms")
    public void yzms(HttpServletRequest request , HttpServletResponse response){
        loginService.yzm(request,response);
    }
}
