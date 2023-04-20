package com.ssm1.service;

import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Student;
import com.ssm1.domain.Team;

import java.util.List;
import java.util.Map;

public interface StudentService {
    /**
     统计所有学生
     @return int 数据总数
     */
    public int queryAllStudentCount();
    /**
     查询所有学生
     @param
     @return  List <Student>              ——对象Teacher（教职员）列表
     */
    public List<Student> queryAllStudent();
    /**
     分页查询所有学生
     @param
     @return  List <Student>              ——对象Teacher（教职员）列表
     */
    public List<Student> queryAllStudentPageModel(PageModel page);
    /**
     * 根据uid查询学生
     *
     * @param uid       学生唯一UID
     * @return List <Student>              ——对象Student（学生）列表
     */
    public List<Student> queryStudent(String uid);

    /**
     查询所有课程
     参数值：null
     返回值：List<String>               ——课程列表
     */
    public List<Team> queryUidclbum(String uid);
    /**
     查询所有课程
     参数值：null
     返回值：List<String>               ——课程列表
     */
    public List<Team> queryAllclbum();
    /**
     查询教职员
     参数值：String                      ——唯一uid
     返回值：Teacher                    ——对象Teacher（教职员）
     */
    Student queryByUid(String uid);
    /**
     增添新的教职员
     参数值：Map< String , Object >     ——浏览器提交的信息
     返回值：boolean                    ——操作是否成功
     */
     boolean upInsertStudent(Map map);
    /**
     * 修改教职员信息
     * 参数值：Map< String , Object >     ——浏览器提交的信息
     * 返回值：boolean                    ——操作是否成功
     *
     */
    boolean upUpdateStudent(Map map);
    /**
     * 删除教职员信息
     * 参数值：Map< String , Object >     ——浏览器提交的信息
     * 返回值：boolean                    ——操作是否成功
     *
     */
    boolean deleteStudent(Map map);
    /**
     * 查询未分配班级的学生
     * @return List<Student>                     ——操作是否成功
     *
     */
    List<Student> queryClassNullStudent();
    /**
     * 查询未分配班级的学生
     * @return List<Student>                     ——操作是否成功
     *
     */
    List<ClbumUid> queryclbumUid();
    /**
     * 查询班级的学生
     * @param ClbumUid                          班级UID
     * @return Map<String,Student>                     ——学生列表
     *
     */
    Map<String,Student> queryClbumStudentByUid(String ClbumUid);
    /**
     * 查询班级的学生
     * @param ClbumUid                          班级UID
     * @return Map<String,Student>                     ——学生列表
     *
     */
    List<Student> queryClbumStudentByUidRList(String ClbumUid);
}
