package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//成绩
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Performance {
    //1、私有化属性
    private String uid;
    private String studentIdUid;
    private String courseUid;
    private String examinationUid;
    private int performance;
}
