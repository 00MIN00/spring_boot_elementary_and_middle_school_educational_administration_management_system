package com.ssm1.service.impl;

import com.ssm1.dao.CourseraDao;
import com.ssm1.dao.ExaminationDao;
import com.ssm1.domain.Course;
import com.ssm1.domain.examination;
import com.ssm1.service.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ExaminationServiceImpl implements ExaminationService {
    @Autowired
    ExaminationDao examinationDao;
    @Autowired
    CourseraDao courseraDao;
    /**
     * 查询所有考试
     * @return List <examination>              ——examination（考试）列表
     */
    @Override
    public List<examination> queryAllExamination() {
        List<examination> examinations = examinationDao.getExaminationLits();
        List<Course> courseList =courseraDao.queryAllcourse();
        for (examination student :
                examinations) {
            for (Course team :
                    courseList) {
                if (team.getUid().equals(student.getExaminationPrincipal())){
                    student.setExaminationPrincipal(team.getPrincipal());
                }
            }
        }
        return examinations;

    }
    /**
     * 查询所有课程
     * @return List <Course>              ——对象Course（课程）列表
     */
    @Override
    public List<Course> queryAllcourse() {
        return examinationDao.getCourseList();
    }
    /**
     * 根据Uid查询考试
     * @param uid 考试唯一Uid
     * @return examination 对象examination(考试)
     */
    @Override
    public examination queryByUid(String uid) {
        return examinationDao.getExaminationByUid(uid);
    }
    /**
     *  提交新添考试数据
     * @param examination 对象examination(考试)
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean upInsertExamination(examination examination) {return examinationDao.addInsertExamination(examination);}
    /**
     * 提交考试更新数据
     * @param map 服务器接收用户发送的数据
     * @return boolean 操作是否成功
     * @deprecated
     */
    @Override
    @Transactional
    public boolean upUpdateExamination(Map map) {
//        Teacher setteacher = new Teacher();
//        String uuid = String.valueOf(map.get("uid"));
//        setteacher.setUid(uuid);
//        setteacher.setCreateDate(new Date());
//        setteacher.setUserName((String) map.get("userName"));
//        setteacher.setJurisdiction(Integer.valueOf(String.valueOf( map.get("userRank"))));
//        setteacher.setUserRank(String.valueOf(map.get("userRank")));
//        setteacher.setLoginId((String) map.get("loginId"));
//        setteacher.setUserpassword((String) map.get("userpassword"));
//        setteacher.setPhone((String) map.get("phone"));
//        setteacher.setMailbox((String) map.get("mailbox"));
//        if (map.get("course")!=null) {
//            String sre = "";
//            List list = (List) map.get("course");
//            for (Object s : list) {
//                sre = sre + String.valueOf(s);
//            }
//            setteacher.setCourse(sre);
//        }
//        setteacher.setEducation( Integer.valueOf(String.valueOf(map.get("education"))));
//        if (map.get("File")!=null) {
//            MultipartFile file = (MultipartFile) map.get("File");
//            try {
//                FileOutputStream outputStream  = new FileOutputStream(new File("D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
//                        uuid + ".jpg"));
//                outputStream.write(file.getBytes());
//                outputStream.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//                return false;
//            }
//            setteacher.setUserImg(uuid + ".jpg");
//        }
//        Teacher teacher = examinationDao.getTeacherByUid(uuid);
//        if (!setteacher.getUserName()    .equals(teacher.getUserName())){    teacher.setUserName(       setteacher.getUserName());}
//        if ( setteacher.getJurisdiction()!=      teacher.getJurisdiction()){ teacher.setJurisdiction(   setteacher.getJurisdiction());}
//        if (!setteacher.getUserRank()    .equals(teacher.getUserRank())){    teacher.setUserRank(       setteacher.getUserRank());}
//        if (!setteacher.getUserpassword().equals(teacher.getUserpassword())){teacher.setUserpassword(   setteacher.getUserpassword());}
//        if (!setteacher.getPhone()       .equals(teacher.getPhone())){       teacher.setPhone(          setteacher.getPhone());}
//        if (!setteacher.getMailbox()     .equals(teacher.getMailbox())){     teacher.setMailbox(        setteacher.getMailbox());}
//        if (!setteacher.getCourse()      .equals(teacher.getCourse())){      teacher.setCourse(         setteacher.getCourse());}
//        if ( setteacher.getEducation()   !=      teacher.getEducation()){    teacher.setEducation(      setteacher.getEducation());}
//        if (!setteacher.getCourse()      .equals(teacher.getCourse())){      teacher.setCourse(         setteacher.getCourse());}
//        teacherDao.UpdateTeacher(teacher);
        return true;
    }

    /**
     * 删除考试
     * @param map 服务器接收用户发送的数据
     * @return boolean 操作是否成功
     */
    @Override
    @Transactional
    public boolean deleteExamination(Map map) {

        String uid = String.valueOf(map.get("uid"));
        return examinationDao.deleteExamination(uid);
    }
}
