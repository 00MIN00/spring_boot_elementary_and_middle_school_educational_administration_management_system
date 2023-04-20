package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
//班
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Team {
    //1、私有化属性
    private String uid;
    private String principal;
    private Date creationTime;
    private String classSchedule;
    private String seatingPlan;
    private String clbumName;
}
