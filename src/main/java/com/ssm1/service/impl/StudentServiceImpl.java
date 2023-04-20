package com.ssm1.service.impl;

import com.ssm1.dao.StudentDao;
import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Student;
import com.ssm1.domain.Team;
import com.ssm1.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;

    /**
     * 统计所有学生
     *
     * @return int 数据总数
     */
    @Override
    public int queryAllStudentCount() {
        return studentDao.queryAllTeacherCount();
    }

    /**
     查询所有学生
     @param
     @return  List <Student>              ——对象Teacher（教职员）列表
     */
    @Override
    public List<Student> queryAllStudent() {
        return studentDao.getStudentLits();
    }

    /**
     * 分页查询所有学生
     *
     * @param page
     * @return List <Student>              ——对象Student（学生）列表
     */
    @Override
    public List<Student> queryAllStudentPageModel(PageModel page) {
        return studentDao.queryAllStudentPageModel(page);
    }
    /**
     * 根据uid查询学生
     *
     * @param uid       学生唯一UID
     * @return List <Student>              ——对象Student（学生）列表
     */
    @Override
    public List<Student> queryStudent(String uid) {
        return studentDao.querytudent(uid);
    }

    /**
     * 查询所有课程
     * 参数值：null
     * 返回值：List<String>               ——课程列表
     */
    @Override
    public List<Team> queryUidclbum(String uid) {
        List<Team> teams = studentDao.getclbumUid(uid);
        for (Team team :
                teams) {
            String string = team.getClbumName();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
            java.util.Date date=new java.util.Date();
            int str=Integer.valueOf(sdf.format(date))-Integer.valueOf(sdf.format(team.getCreationTime()));
            switch (str){
                case 0 :
                    team.setClbumName("一年级"+string);
                    break;
                case 1 :
                    team.setClbumName("二年级"+string);
                    break;
                case 2 :
                    team.setClbumName("三年级"+string);
                    break;
                case 3 :
                    team.setClbumName("四年级"+string);
                    break;
                case 4 :
                    team.setClbumName("五年级"+string);
                    break;
                case 5 :
                    team.setClbumName("六年级"+string);
                    break;
                default:
                    team.setClbumName("已毕业");
                    break;
            }
        }
        return teams;
    }

    /**
     * 查询所有课程
     * 参数值：null
     * 返回值：List<String>      ——课程列表
     */
    @Override
    public List<Team> queryAllclbum() {
        List<Team> teams = studentDao.getclbumList();
        for (Team team :
                teams) {
            String string = team.getClbumName();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
            java.util.Date date=new java.util.Date();
            int str=Integer.valueOf(sdf.format(date))-Integer.valueOf(sdf.format(team.getCreationTime()));
            switch (str){
                case 0 :
                    team.setClbumName("一年级"+string);
                    break;
                case 1 :
                    team.setClbumName("二年级"+string);
                    break;
                case 2 :
                    team.setClbumName("三年级"+string);
                    break;
                case 3 :
                    team.setClbumName("四年级"+string);
                    break;
                case 4 :
                    team.setClbumName("五年级"+string);
                    break;
                case 5 :
                    team.setClbumName("六年级"+string);
                    break;
                default:
                    team.setClbumName("已毕业");
                    break;
            }
        }
        return teams;
    }

    /**
     * 查询教职员
     * 参数值：String                      ——唯一uid
     * 返回值：Teacher                    ——对象Teacher（教职员）
     *
     * @param uid
     */
    @Override
    public Student queryByUid(String uid) {
        return studentDao.getStudentByUid(uid);
    }

    /**
     * 增添新的教职员
     * 参数值：Map< String , Object >     ——浏览器提交的信息
     * 返回值：boolean                    ——操作是否成功
     *
     * @param map
     */
    @Override
    @Transactional
    public boolean upInsertStudent(Map map) {
        Student student = new Student();
        UUID uuid = UUID.randomUUID();
        student.setUid(String.valueOf(uuid));
        student.setStudentName(String.valueOf(map.get("studentName")));
        student.setSex(Byte.valueOf(String.valueOf(map.get("sex"))));
        student.setStudentIdImg(uuid+".jpg");
        student.setStudentId(String.valueOf(map.get("studentId")));
        student.setStudentpassword(String.valueOf( map.get("studentpassword")));
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        String dstr=String.valueOf(map.get("birthYear"));
        Date date= null;
        try {
            date = sdf.parse(dstr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        student.setBirthYear(date);
        student.setEnrollmentDate(new Date());
        student.setStudentClass(String.valueOf( map.get("studentClass")));
        MultipartFile file = (MultipartFile) map.get("File");
        try {
            file.transferTo( new File(
                    "D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
                            uuid + ".jpg"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        student.setJurisdiction(120);
        studentDao.addInsertStudent(student);

        return true;
    }
    /**
     * 修改教职员信息
     * 参数值：Map< String , Object >     ——浏览器提交的信息
     * 返回值：boolean                    ——操作是否成功
     *
     * @param map
     */
    @Override
    @Transactional
    public boolean upUpdateStudent(Map map) {
        Student setstudent = new Student();
        String uuid = String.valueOf(map.get("uid"));
        setstudent.setUid(String.valueOf(uuid));
        setstudent.setStudentName(String.valueOf(map.get("studentName")));
        setstudent.setSex(Byte.valueOf(String.valueOf(map.get("sex"))));
        setstudent.setStudentIdImg(uuid+".jpg");
        setstudent.setStudentpassword(String.valueOf( map.get("studentpassword")));
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        String dstr=String.valueOf(map.get("birthYear"));
        if (dstr.getBytes().length>1 ){
            Date date= null;
            try {
                date = sdf.parse(dstr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            setstudent.setBirthYear(date);
        }
        setstudent.setStudentClass(String.valueOf( map.get("studentClass")));
        if (map.get("File")!=null) {
            MultipartFile file = (MultipartFile) map.get("File");
            try {
                if (file.getOriginalFilename().getBytes().length>1){
                FileOutputStream outputStream  = new FileOutputStream(new File("D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
                        uuid + ".jpg"));
                outputStream.write(file.getBytes());
                outputStream.close();}
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        Student student = studentDao.getStudentByUid(uuid);
        if (!setstudent.getStudentName()    .equals(student.getStudentName())){    student.setStudentName(       setstudent.getStudentName());}
        if ( setstudent.getSex()!=      student.getSex()){ student.setSex(   setstudent.getSex());}

        if (dstr.getBytes().length>1){
            if (!setstudent.getBirthYear()  .equals(student.getBirthYear())){    student.setBirthYear(       setstudent.getBirthYear());}
        }
        if (!setstudent.getStudentpassword().equals(student.getStudentpassword())){student.setStudentpassword(   setstudent.getStudentpassword());}
        if (!setstudent.getStudentClass()       .equals(student.getStudentClass())){       student.setStudentClass(          setstudent.getStudentClass());}
        studentDao.UpdateStudent(student);
        return true;
    }

    /**
     * 删除教职员信息
     * 参数值：Map< String , Object >     ——浏览器提交的信息
     * 返回值：boolean                    ——操作是否成功
     *
     * @param map
     */
    @Override
    @Transactional
    public boolean deleteStudent(Map map) {

        String uid = String.valueOf(map.get("uid"));
        try {new File(
                "D:\\projct\\SSM1\\src\\main\\resources\\static\\assets\\img\\user\\" +
                        uid + ".jpg").delete();
        }catch (Exception e){

        }
        return studentDao.deleteStudent(uid);
    }

    /**
     * 查询未分配班级的学生
     *
     * @return List<Student>                     ——操作是否成功
     */
    @Override
    public List<Student> queryClassNullStudent() {
        return studentDao.queryClassNullStudent();
    }

    /**
     * 查询座位表uid
     *
     * @return List<Student>                     ——操作是否成功
     */
    @Override
    public List<ClbumUid> queryclbumUid() {
        return studentDao.queryclbumUid();
    }

    /**
     * 查询班级的学生
     *
     * @param ClbumUid 班级UID
     * @return List<Student>                     ——学生列表
     */
    @Override
    public Map<String,Student> queryClbumStudentByUid(String ClbumUid) {
        Map<String,Student> StudentMap = new HashMap<>();
        for (Student s :
                studentDao.queryClbumStudentByUid(ClbumUid)) {
            StudentMap.put(s.getUid(),s);
        }
        return StudentMap;
    }

    /**
     * 查询班级的学生
     *
     * @param ClbumUid 班级UID
     * @return Map<String, Student>                     ——学生列表
     */
    @Override
    public List<Student> queryClbumStudentByUidRList(String ClbumUid) {
        return studentDao.queryClbumStudentByUid(ClbumUid);
    }
}
