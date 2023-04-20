package com.ssm1.service.impl;

import com.ssm1.dao.CourseraDao;
import com.ssm1.dao.TeacherDao;
import com.ssm1.domain.Course;
import com.ssm1.domain.CourseUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Teacher;
import com.ssm1.service.CourseraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
public class CourseraServiceImpl implements CourseraService{

    @Autowired
    CourseraDao courseraDao;
    @Autowired
    TeacherDao teacherDao;

    /**
     * 查询所有课程表<br>
     * 根据课程表uid查询表
     * @param courseUid 课程表uid
     * @return List 课程表列表
     */
    @Override
    public List<Coursera> queryAllCoursera(String courseUid) {
        List<Coursera> courseraList = courseraDao.queryAllCoursera(courseUid);
        List<Course> courseList = teacherDao.getCourseList();
        List<Teacher> teacherLits = teacherDao.getTeacherLits();
        for (Coursera coursera:courseraList){
            for (Course course: courseList){
                if (coursera.getCourseName().equals(course.getUid())){
                    coursera.setCourseName(course.getPrincipal());
                }
            }
            for (Teacher teacher: teacherLits){
                if (coursera.getFacultyUid().equals(teacher.getUid())){
                    coursera.setFacultyUid(teacher.getUserName());
                }
            }
        }
        return  courseraList;
    }

    /**
     * 查询所有课程表 <br>
     * 根据课程表uid查询表
     * @return List 课程表Uid列表
     */
    @Override
    public List<CourseUid> queryAllCourseUid() {
        Set<CourseUid>  courseUidSet = courseraDao.queryAllCourseUid();
        return List.copyOf(courseUidSet);
    }

    /**
     * 查询所有课程<br>
     * 根据课程uid排列查询表
     * @param
     * @return List 课程列表
     */
    @Override
    public List<Course> queryAllcourse() {
        return courseraDao.queryAllcourse();
    }

    /**
     *查询所有所有教师的uid，userName
     *@param
     *@return List Lis(uid，userName)课程列表
     */
    @Override
    public List<Teacher> queryAllTeacher() {
        return courseraDao.queryAllTeacher();
    }

    /**
     * 增添新的课程表
     * @param courseraList Courserac课程表信息对象列表
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean upInsertCoursera(List<Coursera> courseraList) {
        for (Coursera coursera :courseraList) {
            courseraDao.upInsertCoursera(coursera);
        }
        return true;
    }

    /**
     * 新增课程表列表查询对象
     * @param courseUid CourseUid 课程表列表对象
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean upInsertCourseraList(CourseUid courseUid) {
        return courseraDao.InsertCourseraList(courseUid);
    }

    /**
     * 新增课程
     * @param course course 课程对象
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean upInsertNewCourse(Course course) {
        return courseraDao.upInsertNewCourse(course);
    }

    /**
     * 更新课程表
     *
     * @param courseraList List (Coursera) 课程表列表对象
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean UpdateCoursera(List<Coursera> courseraList) {
        List<Coursera> courseraList0 = courseraDao.queryAllCoursera(courseraList.get(0).getCourseUid());
        for (Coursera coursera :
                courseraList) {
            for (Coursera coursera0 :
                    courseraList0) {
                if (coursera.getX()==coursera0.getX()&&coursera.getY()==coursera0.getY()){
                    boolean ft = false;
                    if (!coursera0.getCourseName().equals(coursera.getCourseName())){
                        coursera0.setCourseName(coursera.getCourseName());
                        ft = true;
                    }
                    if (!coursera0.getFacultyUid().equals(coursera.getFacultyUid())){
                        coursera0.setFacultyUid(coursera.getFacultyUid());
                        ft = true;
                    }
                    if (ft){
                        courseraDao.UpdateCoursera(coursera0);
                    }
                }
            }

        }
        return true;
    }

    /**
     * 删除课程表及其索引
     * @param uuid 课成表主键UUid
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean deleteCoursera(String uuid) {
        courseraDao.deleteCoursera(uuid);
        courseraDao.deleteCourseraList(uuid);
        return true;
    }

    /**
     * 删除课程
     * @param uuid 课程UUid
     * @return boolean 操作是否成功
     */
    @Override
    public boolean deleteCourse(String uuid) {
        return courseraDao.deleteCourse(uuid);
    }
}
