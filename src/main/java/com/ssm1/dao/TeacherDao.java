package com.ssm1.dao;

import com.ssm1.domain.Course;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface TeacherDao {
    /**
     * 根据账号查询
     * @param loginId 登录账号
     * @return Teacher 教师对象
     */
    @Select("select * from Faculty where loginId = #{loginId}")
    Teacher getTeacherById(String loginId);

    /**
     * 统计所有教职员
     * @return int 数据总数
     */
    @Select("select count(uid) from Faculty")
    int queryAllTeacherCount();
    /**
     * 根据uid查询教师
     * @param uid    教师唯一uid
     * @return Teacher 教师对象
     */
    @Select("select * from Faculty where uid = #{uid}")
    Teacher getTeacherByUid(String uid);
    /**
     * 分页查询所有教师
     * @param page 页码对象
     * @return List <Teacher> 教师信息列表
     */
    @Select("select * from Faculty limit #{startIndex},#{pageSize}")
    List<Teacher> getTeacherLitsPageModel(PageModel page);
    /**
     * 查询所有教师
     * @return List <Teacher> 教师信息列表
     */
    @Select("select * from Faculty")
    List<Teacher> getTeacherLits();

    /**
     * 查询课程信息
     * @return  List <Course> 课程信息列表
     */
    @Select("select * from course order by uid")
    List<Course> getCourseList();

    /**
     * 新增教师信息
     * @param teacher 教师对象
     * @return boolean
     */
    @Insert("insert into " +
            "Faculty(uid,loginId,userpassword,jurisdiction,createDate,userName,course,education" +
            ",userRank,userImg,phone,mailbox)" +
            "values(#{uid},#{loginId},#{userpassword},#{jurisdiction},#{createDate},#{userName},#{course},#{education}" +
            ",#{userRank},#{userImg},#{phone},#{mailbox})")
    boolean addInsertTeacher(Teacher teacher);
    /**
     * 修改教师信息
     * @param teacher 教师对象
     * @return boolean
     */
    @Update("update Faculty set userName = #{userName},userpassword = #{userpassword},jurisdiction = #{jurisdiction}," +
            "course = #{course},education = #{education},userRank = #{userRank}" +
            ",phone = #{phone},mailbox = #{mailbox} where uid = #{uid}")
    boolean UpdateTeacher(Teacher teacher);
    /**
     * 删除教师信息
     * @param uid
     * @return boolean
     */
    @Delete("delete from Faculty where uid = #{uid}")boolean deleteTeacher(String uid);


}
