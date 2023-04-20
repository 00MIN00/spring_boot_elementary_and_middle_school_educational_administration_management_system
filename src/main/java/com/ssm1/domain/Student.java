package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    //1、私有化属性
    private String uid;
    private String studentId;
    private String studentName;
    private byte sex;
    private Date birthYear;
    private Date enrollmentDate;
    private String studentClass;
    private  String studentpassword;
    private  String studentIdImg;
    private int jurisdiction;

    @Override
    public String toString() {
        return "Student{" +
                "学生uid唯一码='" + uid + '\'' +
                ", 学生学号='" + studentId + '\'' +
                ", 学生姓名='" + studentName + '\'' +
                ", 性别=" + sex +
                ", 出生年份=" + birthYear +
                ", 入学时间=" + enrollmentDate +
                ", 班级关联='" + studentClass + '\'' +
                ", 学生头像='" + studentIdImg + '\'' +
                '}';
    }

}
