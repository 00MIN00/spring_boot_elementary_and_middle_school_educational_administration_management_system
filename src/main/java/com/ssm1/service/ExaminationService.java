package com.ssm1.service;

import com.ssm1.domain.Course;
import com.ssm1.domain.examination;

import java.util.List;
import java.util.Map;

public interface ExaminationService {
    /**
     * 查询所有考试
     * @return List <examination>              ——examination（考试）列表
     */
    public List<examination> queryAllExamination();

    /**
     * 查询所有课程
     * @return List <Course>              ——对象Course（课程）列表
     */
    public List<Course> queryAllcourse();

    /**
     * 根据Uid查询考试
     * @param uid 考试唯一Uid
     * @return examination 对象examination(考试)
     */
    examination queryByUid(String uid);

    /**
     *  提交新添考试数据
     * @param examination 对象examination(考试)
     * @return boolean 操作是否成功
     */
     boolean upInsertExamination(examination examination);

    /**
     * 提交考试更新数据
     * @param map 服务器接收用户发送的数据
     * @return boolean 操作是否成功
     * @deprecated
     */
    boolean upUpdateExamination(Map map);
    /**
     * 删除考试
     * @param map 服务器接收用户发送的数据
     * @return boolean 操作是否成功
     */
    boolean deleteExamination(Map map);
}
