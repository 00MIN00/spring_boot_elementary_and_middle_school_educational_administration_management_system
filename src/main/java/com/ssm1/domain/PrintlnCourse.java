package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PrintlnCourse {
    //1、私有化属性
    private String uid;
    private int X;
    private int Y;
    private String courseUid;
    private String teacherUid;
}