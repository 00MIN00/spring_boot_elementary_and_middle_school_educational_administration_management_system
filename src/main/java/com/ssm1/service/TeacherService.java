package com.ssm1.service;

import com.ssm1.domain.Course;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Teacher;

import java.util.List;
import java.util.Map;

public interface TeacherService {
    /**
     统计所有教职员
     @return int 数据总数
     select count(uid) from Faculty
     */
    public int queryAllTeacherCount();
    /**
     查询所有教职员
     @param page 页码
     @return List<Teacher>              ——对象Teacher（教职员）列表
     */
    public List<Teacher> getTeacherLitsPageModel(PageModel page);
    /**
     查询所有教职员
     @param
     @return List<Teacher>              ——对象Teacher（教职员）列表
     */
    public List<Teacher> queryAllTeacher();
    /**
     查询所有课程
     @param
     @return  List < String >               ——课程列表
     */
    public List<Course> queryAllcourse();
    /**
     查询教职员
     @param uid                      唯一uid
     @return Teacher                    —对象Teacher（教职员）
     */
    Teacher queryByUid(String uid);
    /**
     增添新的教职员
     @param map Map< String , Object >     ——浏览器提交的信息
     @return boolean                    ——操作是否成功
     */
     boolean upInsertTeacher(Map map);
    /**
     * 修改教职员信息
     * @param map Map< String , Object >     ——浏览器提交的信息
     * @return boolean                    ——操作是否成功
     *
     */
    boolean upUpdateTeacher(Map map);
    /**
     * 删除教职员信息
     * @param map Map< String , Object >     ——浏览器提交的信息
     * @return boolean                    ——操作是否成功
     *
     */
    boolean deleteTeacher(Map map);
}
