package com.ssm1.service;

import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Team;

import java.util.List;

public interface ClbumService {
    /**
     查询所有座位表Uid
     @return ：List<ClbumUid>              ——对象ClbumUid（座位表Uid）列表
     */
    public List<ClbumUid> queryAllClbumUid();/**
     查询所有座位表Uid
     @return ：List<ClbumUid>              ——对象ClbumUid（座位表Uid）列表
     */
    public List<ClbumUid> queryClbumUid();

    /**
     * 查询单个座位表
     * 根据座位表uid查询表
     * @param courseUid 课程表uid
     * @return List 课程表列表
     */
    public List<Coursera> queryClbumByUid(String courseUid);
    /**
     根据Uid查询
     @param uuid 班级uuid
     @return ：Team            ——对象Team（班级）列表
     */
    public Team queryClbumById(String uuid);
    /**
     添加新的班级
     @param team ——对象team（班级）
     @return ：boolean          操作是否成功
     */
    public boolean insertNewClbumList(Team team);
    /**
     修改班级
     @param team ——对象team（班级）
     @return ：boolean          操作是否成功
     */
    public boolean updateClbumList(Team team);
    /**
     添加新的座位表
     @param courseraList ——对象courseraList（座位表）数组
     @return ：boolean          操作是否成功
     */
    public boolean insertNewClbum(List<Coursera> courseraList);
    /**
     更新的座位表
     @param courseraList ——对象coursera（座位表）数组
     @return ：boolean          操作是否成功
     */
    public boolean upUpdateClbum(List<Coursera> courseraList);


    /**
     删除班级
     @param team ——对象team（班级）
     @return ：boolean          操作是否成功。
     */
    public boolean deleteclbum(Team team);
}
