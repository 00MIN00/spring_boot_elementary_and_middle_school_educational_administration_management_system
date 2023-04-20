package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher {
    //1、私有化属性
    private String uid;
    private String loginId;
    private String userpassword;
    //权限状态-管理员
    private int jurisdiction;
    //时间：创建时间
    private Date createDate;
    private String userName;
    private String course;
    private int education;
    private String userRank;
    private String userImg;
    private String phone;
    private String mailbox;

    Teacher(String loginId ,String userpassword){
        this.loginId = loginId;
        this.userpassword = userpassword;
    }
    @Override
    public String toString() {
        return "Teacher{" +
                "uid=" + uid +
                ", 账号='" + loginId + '\'' +
                ", 密码='" + userpassword + '\'' +
                ", 职称=" + jurisdiction +
                ", 注册时间=" + createDate +
                ", 姓名='" + userName + '\'' +
                ", 任教课程=" + course +
                ", 当前学历=" + education +
                ", 职称='" + userRank + '\'' +
                ", 头像='" + userImg + '\'' +
                ", 电话='" + phone + '\'' +
                ", 邮箱='" + mailbox + '\'' +
                '}';
    }
}
