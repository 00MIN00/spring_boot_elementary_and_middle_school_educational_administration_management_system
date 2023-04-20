package com.ssm1.service.impl;

import com.ssm1.dao.TeacherDao;
import com.ssm1.domain.Course;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Teacher;
import com.ssm1.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class TeacherServiceImpl implements TeacherService{
    @Autowired
    TeacherDao teacherDao;

    /**
     * 统计所有教职员
     * @return int 数据总数
     */
    @Override
    public int queryAllTeacherCount() {
        return teacherDao.queryAllTeacherCount();
    }

    /**
     查询所有教职员
     @return  List<Teacher>      ——对象Teacher（教职员）列表
     */
    @Override
    public List<Teacher> getTeacherLitsPageModel(PageModel page) {
        return teacherDao.getTeacherLitsPageModel(page);

    }

    /**
     * 查询所有教职员
     * @return List<Teacher>              ——对象Teacher（教职员）列表
     */
    @Override
    public List<Teacher> queryAllTeacher() {
        return teacherDao.getTeacherLits();
    }

    /**
     * 查询所有课程
     * @return  List<String>      ——课程列表
     */
    @Override
    public List<Course> queryAllcourse() {
        return teacherDao.getCourseList();
    }

    /**
     * 查询教职员
     * @param uid   ——教师唯一uid
     * @return  Teacher                    ——对象Teacher（教职员）
     */
    @Override
    public Teacher queryByUid(String uid) {
        return teacherDao.getTeacherByUid(uid);
    }

    /**
     * 增添新的教职员
     * @return  boolean                    ——操作是否成功
     * @param map Map< String , Object >     ——浏览器提交的信息
     */
    @Override
    @Transactional
    public boolean upInsertTeacher(Map map) {
        Teacher teacher = new Teacher();
        UUID uuid = UUID.randomUUID();
        teacher.setUid(String.valueOf(uuid));
        teacher.setCreateDate(new Date());
        teacher.setUserName((String) map.get("userName"));
        teacher.setJurisdiction(Integer.valueOf(String.valueOf( map.get("userRank"))));
        teacher.setUserRank(String.valueOf(map.get("userRank")));
        teacher.setLoginId((String) map.get("loginId"));
        teacher.setUserpassword((String) map.get("userpassword"));
        teacher.setPhone((String) map.get("phone"));
        teacher.setMailbox((String) map.get("mailbox"));
        String sre="";
        List list= (List) map.get("course");
        for(Object s:list){
            sre=sre+String.valueOf(s);
        }
        teacher.setCourse(sre);
        teacher.setEducation( Integer.valueOf(String.valueOf(map.get("education"))));
        MultipartFile file = (MultipartFile) map.get("File");
        try {
            file.transferTo( new File(
                    "D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
                            uuid + ".jpg"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        teacher.setUserImg(uuid + ".jpg");
        teacherDao.addInsertTeacher(teacher);

        return true;
    }
    /**
     * 修改教职员信息
     * @return  boolean                    ——操作是否成功
     * @param map Map< String , Object >     ——浏览器提交的信息
     */
    @Override
    @Transactional
    public boolean upUpdateTeacher(Map map) {
        Teacher setteacher = new Teacher();
        String uuid = String.valueOf(map.get("uid"));
        setteacher.setUid(uuid);
        setteacher.setCreateDate(new Date());
        setteacher.setUserName((String) map.get("userName"));
        setteacher.setJurisdiction(Integer.valueOf(String.valueOf( map.get("userRank"))));
        setteacher.setUserRank(String.valueOf(map.get("userRank")));
        setteacher.setLoginId((String) map.get("loginId"));
        setteacher.setUserpassword((String) map.get("userpassword"));
        setteacher.setPhone((String) map.get("phone"));
        setteacher.setMailbox((String) map.get("mailbox"));
        if (map.get("course")!=null) {
            String sre = "";
            List list = (List) map.get("course");
            for (Object s : list) {
                sre = sre + String.valueOf(s);
            }
            setteacher.setCourse(sre);
        }
        setteacher.setEducation( Integer.valueOf(String.valueOf(map.get("education"))));
        if (map.get("File")!=null) {
            MultipartFile file = (MultipartFile) map.get("File");
            try {
                FileOutputStream outputStream  = new FileOutputStream(new File("D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
                        uuid + ".jpg"));
                outputStream.write(file.getBytes());
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            setteacher.setUserImg(uuid + ".jpg");
        }
        Teacher teacher = teacherDao.getTeacherByUid(uuid);
        if (!setteacher.getUserName()    .equals(teacher.getUserName())){    teacher.setUserName(       setteacher.getUserName());}
        if ( setteacher.getJurisdiction()!=      teacher.getJurisdiction()){ teacher.setJurisdiction(   setteacher.getJurisdiction());}
        if (!setteacher.getUserRank()    .equals(teacher.getUserRank())){    teacher.setUserRank(       setteacher.getUserRank());}
        if (!setteacher.getUserpassword().equals(teacher.getUserpassword())){teacher.setUserpassword(   setteacher.getUserpassword());}
        if (!setteacher.getPhone()       .equals(teacher.getPhone())){       teacher.setPhone(          setteacher.getPhone());}
        if (!setteacher.getMailbox()     .equals(teacher.getMailbox())){     teacher.setMailbox(        setteacher.getMailbox());}
        if (!setteacher.getCourse()      .equals(teacher.getCourse())){      teacher.setCourse(         setteacher.getCourse());}
        if ( setteacher.getEducation()   !=      teacher.getEducation()){    teacher.setEducation(      setteacher.getEducation());}
        if (!setteacher.getCourse()      .equals(teacher.getCourse())){      teacher.setCourse(         setteacher.getCourse());}
        teacherDao.UpdateTeacher(teacher);
        return true;
    }

    /**
     * 删除教职员信息
     * @return  boolean                    ——操作是否成功
     * @param map Map< String , Object >     ——浏览器提交的信息
     */
    @Override
    @Transactional
    public boolean deleteTeacher(Map map) {

        String uid = String.valueOf(map.get("uid"));
        try {new File(
                "D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
                        uid + ".jpg").delete();
        }catch (Exception e){

        }
        return teacherDao.deleteTeacher(uid);
    }
}
