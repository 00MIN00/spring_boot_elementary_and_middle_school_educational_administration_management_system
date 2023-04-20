package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coursera {
    private String uid;
    private int X;
    private int Y;
    private String courseName;
    private String FacultyUid;
    private String courseUid;
}
