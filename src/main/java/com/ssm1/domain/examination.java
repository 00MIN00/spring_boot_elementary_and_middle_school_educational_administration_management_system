package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class examination {
    //1、私有化属性
    private String uid;
    private String examinationName;
    private String examinationPrincipal;
    private Date examinationDate;
    private String teacherA;
    private String teacherB;
    private String bz;
}
