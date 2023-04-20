package com.ssm1.service;

import com.ssm1.domain.Course;
import com.ssm1.domain.CourseUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Teacher;

import java.util.List;

public interface CourseraService {
    /**
     * 查询所有课程表<br>
     * 根据课程表uid查询表
     * @param courseUid 课程表uid
     * @return List 课程表列表
     */
    public List<Coursera> queryAllCoursera(String courseUid);
    /**
     * 查询所有课程表<br>
     * 根据课程表uid查询表
     * @param
     * @return List 课程表Uid列表
     */

    public List<CourseUid> queryAllCourseUid();
    /**
     * 查询所有课程<br>
     * 根据课程uid排列查询表
     * @param
     * @return List 课程列表
     *
     */
    public List<Course> queryAllcourse();
    /**
     *查询所有所有教师的uid，userName
     *@param
     *@return List Lis(uid，userName)课程列表
     */
    public List<Teacher> queryAllTeacher();
    /**
     增添新的课程表
     *@param courseraList Courserac课程表信息对象列表
     *@return boolean 操作是否成功
     */
     boolean upInsertCoursera(List<Coursera> courseraList);
    /**
     * 新增课程表列表查询对象
     *@param courseUid CourseUid 课程表列表对象
     *@return boolean 操作是否成功
     */
    boolean upInsertCourseraList(CourseUid courseUid);
    /**
     * 新增课程
     *@param course course 课程对象
     *@return boolean 操作是否成功
     */
    boolean upInsertNewCourse(Course course);
    /**
     * 更新课程表
     *@param courseraList List (Coursera) 课程表列表对象
     *@return boolean 操作是否成功
     */
    boolean UpdateCoursera(List<Coursera> courseraList);
    /**
     *删除课程表及其索引
     * @param uuid 课程表主键UUid
     * @return boolean 操作是否成功
     */
    boolean deleteCoursera(String uuid);
    /**
     *删除课程
     * @param uuid 课程UUid
     * @return boolean 操作是否成功
     */
    boolean deleteCourse(String uuid);


}
