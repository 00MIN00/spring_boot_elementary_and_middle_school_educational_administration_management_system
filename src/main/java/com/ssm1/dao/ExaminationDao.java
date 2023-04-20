package com.ssm1.dao;

import com.ssm1.domain.Course;
import com.ssm1.domain.examination;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface ExaminationDao {
    /**
     * 无法使用
     * @param loginId 考试唯一Uid
     * @return examination 对象examination(考试)
     * @deprecated
     */
    @Select("select * from examination where loginId = #{loginId}")
    examination getExaminationById(String loginId);
    /**
     * 根据Uid查询考试
     * @param uid 考试唯一Uid
     * @return examination 对象examination(考试)
     */
    @Select("select * from examination where uid = #{uid}")
    examination getExaminationByUid(String uid);
    /**
     * 查询所有考试
     * @return List <examination>              ——examination（考试）列表
     */
    @Select("select * from examination")
    List<examination> getExaminationLits();
    /**
     * 查询所有课程
     * @return List <Course>              ——对象Course（课程）列表
     */
    @Select("select * from course order by uid")
    List<Course> getCourseList();
    /**
     *  提交新添考试数据
     * @param examination 对象examination(考试)
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "examination(uid,examinationName,examinationPrincipal,examinationDate,teacherA,teacherB,bz)" +
            "values(#{uid},#{examinationName},#{examinationPrincipal},#{examinationDate},#{teacherA},#{teacherB},#{bz})")
    boolean addInsertExamination(examination examination);
    /**
     * 根据删除考试
     * @param uid 考试唯一uid
     * @return boolean 操作是否成功
     */
    @Delete("delete from examination where uid = #{uid}")boolean deleteExamination(String uid);
    /**
     * 提交考试更新数据
     * @param examination 对象examination(考试)
     * @return boolean 操作是否成功
     * @deprecated
     */
    @Update("update examination set userName = #{userName},userpassword = #{userpassword},jurisdiction = #{jurisdiction}," +
            "course = #{course},education = #{education},userRank = #{userRank}" +
            ",phone = #{phone},mailbox = #{mailbox} where uid = #{uid}")
    boolean UpdateTeacher(examination examination);
}
