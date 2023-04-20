package com.ssm1.dao;

import com.ssm1.domain.Course;
import com.ssm1.domain.CourseUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Set;


@Mapper
public interface CourseraDao {
    /**
     * 查询所有课程表<br>
     * 根据课程表uid查询表
     * @param courseUid 课程表uid
     * @return List 课程表列表
     */
    @Select("select * from coursemain where courseUid  = #{courseUid}")
    List<Coursera> queryAllCoursera(String courseUid);
    /**
     * 查询所有课程<br>
     * 根据课程uid排列查询表
     * @param
     * @return List 课程列表
     */
    @Select("select * from course  order by uid")
    List<Course> queryAllcourse();
    /**
     *查询所有所有教师的uid，userName
     *@param
     *@return List Lis(uid，userName)课程列表
     */
    @Select("select uid,userName from Faculty order by uid")
    List<Teacher> queryAllTeacher();
    /**
     * 查询所有课程表 <br>
     * 根据课程表uid查询表
     * @return List 课程表Uid列表
     */
    @Select("select * from courseUid")
    Set<CourseUid> queryAllCourseUid();
    /**
     *查询所有所有教师的uid，userName
     *@param
     *@return List Lis(uid，userName)课程列表
     * @deprecated
     */
    @Select("select uid,userName from Faculty order by uid")
    List<Teacher> getTeacherList();
    /**
     * 增添新的课程表
     * @param coursera Courserac课程表信息对象
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "coursemain(uid,X,Y,courseName,FacultyUid,courseUid)" +
            "values(#{uid},#{X},#{Y},#{courseName},#{FacultyUid},#{courseUid})")
    boolean upInsertCoursera(Coursera coursera);
    /**
     * 新增课程
     * @param course course 课程对象
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "course(uid,principal)" +
            "values(#{uid},#{principal})")
    boolean upInsertNewCourse(Course course);
    /**
     * 新增课程表列表查询对象
     * @param courseUid CourseUid 课程表列表对象
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "courseUid(uid,courseUidName)" +
            "values(#{uid},#{courseUidName})")
    boolean InsertCourseraList(CourseUid courseUid);
    /**
     * 更新课程表
     * @param coursera List (Coursera) 课程表列表对象
     * @return boolean 操作是否成功
     */
    @Update("update coursemain set courseName = #{courseName},FacultyUid = #{FacultyUid} where uid = #{uid}")
    boolean UpdateCoursera(Coursera coursera);
    /**
     * 删除课程表
     * @param courseUid 课成表主键UUid
     * @return boolean 操作是否成功
     */
    @Delete("delete from coursemain where courseUid = #{courseUid}")
    boolean deleteCoursera(String courseUid);
    /**
     * 删除课程表索引
     * @param courseUid 课成表主键UUid
     * @return boolean 操作是否成功
     */
    @Delete("delete from courseUid where uid = #{courseUid}")
    boolean deleteCourseraList(String courseUid);

    /**
     * 删除课程
     * @param uuid 课程UUid
     * @return boolean 操作是否成功
     */
    @Delete("delete from course where uid = #{uuid}")
    boolean deleteCourse(String uuid);
}
