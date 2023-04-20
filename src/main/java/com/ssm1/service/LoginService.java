package com.ssm1.service;

import com.ssm1.domain.Student;
import com.ssm1.domain.Teacher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public interface LoginService {
    /**
     * 验证码获取
     * @param request
     * @param response
     */
    public void yzm(HttpServletRequest request , HttpServletResponse response);

    /**
     * 验证码验证
     * @param request
     * @param c 用户输入的验证码
     * @return boolean
     */
    public boolean yzmyz(HttpServletRequest request,Integer c );

    /**
     * 教师登录
     * @param userteacher 教师对象(只带有用户账号和密码)
     * @return Teacher 教师对象
     */

    public Teacher login(Teacher userteacher);

    /**
     * 学生登录
     * @param userteacher 学生对象(只带有用户账号和密码)
     * @return Student 教师对象
     */
    public Student loginStudent(Student userteacher);

}
