package com.ssm1.service.impl;

import com.ssm1.dao.StudentDao;
import com.ssm1.dao.TeacherDao;
import com.ssm1.domain.Student;
import com.ssm1.domain.Teacher;
import com.ssm1.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
@Service
public class LoginServiceimpl implements LoginService {
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private StudentDao studentDao;

    /**
     * 验证码获取
     * @param request
     * @param response
     */
    @Override
    public void yzm(HttpServletRequest request, HttpServletResponse response) {
        int width = 100;
        int hinght = 50;
        BufferedImage img = new BufferedImage(width,hinght,BufferedImage.TYPE_INT_RGB);
        Graphics graphics = img.getGraphics();
        graphics.setColor(new Color(255,255,255));
        graphics.fillRect(0,0,width,hinght);
        graphics.setColor(new Color(0, 0, 0));
        graphics.drawRect(0,0,width-1,hinght-1);
        Random random = new Random();
        int a, b, c;
        a=random.nextInt(100);
        b=random.nextInt(100);
        c=a+b;
        request.getSession().setAttribute("C",c);
        graphics.setColor(new Color(0, 0, 0));
        graphics.setFont(new Font("黑体",1,16));
        graphics.drawString(a+" + "+b+" = X",10,30 );
        for (int i = 5 ;i<random.nextInt(10)+10;i++){
            graphics.setColor(new Color(109, 255, 65, 254));
            graphics.drawLine(  random.nextInt(width),
                    random.nextInt(hinght),
                    random.nextInt(width),
                    random.nextInt(hinght));
        }
        try {
            ImageIO.write(img,"jpg",response.getOutputStream());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * 验证码验证
     * @param request
     * @param ca 用户输入的验证码
     * @return boolean
     */
    @Override
    public boolean yzmyz(HttpServletRequest request,Integer ca) {
        System.out.println(request.getSession().getAttribute("C"));
        Integer cb = (Integer) request.getSession().getAttribute("C");
        if(cb==null || ca ==null){
            return false;
        }
        return ca-cb==0? true: false;
    }
    /**
     * 教师登录
     * @param userteacher 教师对象(只带有用户账号和密码)
     * @return Teacher 教师对象
     */
    @Override
    public Teacher login(Teacher userteacher) {
        Teacher user1 = teacherDao.getTeacherById(userteacher.getLoginId());
        if (user1!=null&&user1.getUid()!=null&&user1.getUid()!="" ){
            return user1;
        }
        return new Teacher();
    }
    /**
     * 学生登录
     * @param userteacher 学生对象(只带有用户账号和密码)
     * @return Student 教师对象
     */
    @Override
    public Student loginStudent(Student userteacher) {
        Student user1 = studentDao.getStudentById(userteacher.getStudentId());
        if (user1!=null&&user1.getUid()!=null&&user1.getUid()!="" ){
            return user1;
        }
        return new Student();
    }
}
