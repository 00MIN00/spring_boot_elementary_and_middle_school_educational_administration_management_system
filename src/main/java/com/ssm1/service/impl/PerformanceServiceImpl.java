package com.ssm1.service.impl;

import com.ssm1.dao.ExaminationDao;
import com.ssm1.dao.PerformanceDao;
import com.ssm1.dao.StudentDao;
import com.ssm1.dao.TeacherDao;
import com.ssm1.domain.Course;
import com.ssm1.domain.Performance;
import com.ssm1.domain.Student;
import com.ssm1.domain.examination;
import com.ssm1.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class PerformanceServiceImpl implements PerformanceService {
    @Autowired
    PerformanceDao performanceDao;
    @Autowired
    ExaminationDao examinationDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    TeacherDao teacherDao;

    /**
     查询所有成绩
     * @param
     * @return List <Performance>              ——对象Performance（成绩）列表
     */
    @Override
    public List<Performance> queryAllPerformance() {

        List<Performance>  performanceList = performanceDao.getPerformanceLits();
        List<Student>  studentList = studentDao.getStudentLits();
        List<examination>  examinationList = examinationDao.getExaminationLits();
        List<Course>  clbumList = teacherDao.getCourseList();
        for (Performance performance :
                performanceList) {
            for (Student student :
                    studentList) {
                if (performance.getStudentIdUid().equals(student.getUid())){
                    performance.setStudentIdUid(student.getStudentName());
                }
            }
            for (examination examination :
                    examinationList) {
                if (performance.getExaminationUid().equals(examination.getExaminationPrincipal())){
                    performance.setExaminationUid(examination.getExaminationName());
                }
            }
            for (Course course :
                    clbumList) {
                if (performance.getCourseUid().equals(course.getUid())){
                    performance.setCourseUid(course.getPrincipal());
                }
            }

        }
        return performanceList;

    }

    /**
     根据Uid查询成绩
     * @param  uid                 ——唯一uid
     * @return List <Performance>              ——对象Performance（成绩）列表
     */
    @Override
    public List<Performance> queryPerformance(String uid) {
        List<Performance>  performanceList = performanceDao.getPerformance(uid);
        List<Student>  studentList = studentDao.getStudentLits();
        List<examination>  examinationList = examinationDao.getExaminationLits();
        List<Course>  clbumList = teacherDao.getCourseList();
        for (Performance performance :
                performanceList) {
            for (Student student :
                    studentList) {
                if (performance.getStudentIdUid().equals(student.getUid())){
                    performance.setStudentIdUid(student.getStudentName());
                }
            }
            for (examination examination :
                    examinationList) {
                if (performance.getExaminationUid().equals(examination.getExaminationPrincipal())){
                    performance.setExaminationUid(examination.getExaminationName());
                }
            }
            for (Course course :
                    clbumList) {
                if (performance.getCourseUid().equals(course.getUid())){
                    performance.setCourseUid(course.getPrincipal());
                }
            }

        }
        return performanceList;

    }

    /**
     查询所有课程
     * @param
     * @return List <Course>               ——课程列表
     */
    @Override
    public List<Course> queryAllcourse() {
        return (List<Course>) performanceDao;
    }

    /**
     根据Uid查询成绩
     * @param uid                 ——唯一uid
     * @return Performance                    ——对象Performance（成绩）
     * @deprecated
     */
    @Override
    public Performance queryByUid(String uid) {
        return performanceDao.getPerformanceByUid(uid);
    }

    /**
     增添新的成绩
     * @param  performance Performance     ——对象Performance(成绩)
     * @return boolean                    ——操作是否成功.
     */
    @Override
    @Transactional
    public boolean upInsertPerformance(Performance performance) {

        performanceDao.addInsertPerformance(performance);

        return true;
    }

    /**
     * 修改成绩员信息
     * @param map Map< String , Object >     ——浏览器提交的信息
     * @return boolean                    ——操作是否成功
     * @deprecated
     */
    @Override
    @Transactional
    public boolean upUpdatePerformance(Map map) {
        return false;
    }

    /**
     * 删除教删除
     * @param map Map< String , Object >     ——浏览器提交的信息
     * @return boolean                    ——操作是否成功
     */
    @Override
    @Transactional
    public boolean deletePerformance(Map map) {

        String uid = String.valueOf(map.get("uid"));

        return performanceDao.deletePerformance(uid);
    }
}
