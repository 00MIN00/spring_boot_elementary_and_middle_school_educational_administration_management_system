package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClbumUid {
    //1、私有化属性
    private String uid;
    private String clbumUidName;
}
