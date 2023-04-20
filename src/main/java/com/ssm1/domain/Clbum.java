package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Clbum {
    private String uid;
    private String ClbumX;
    private String ClbumY;
    private String courseName;
    private String FacultyUid;
    private String courseUid;
}
