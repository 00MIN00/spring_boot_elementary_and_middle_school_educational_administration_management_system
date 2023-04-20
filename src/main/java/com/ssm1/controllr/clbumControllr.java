package com.ssm1.controllr;

import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Student;
import com.ssm1.domain.Team;
import com.ssm1.service.ClbumService;
import com.ssm1.service.CourseraService;
import com.ssm1.service.StudentService;
import com.ssm1.service.TeacherService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class clbumControllr {
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;

    @Autowired
    CourseraService courseraService;
    @Autowired
    ClbumService clbumService;

    /**
     *  查询班级<br>
     *  教师:可以查询全部班级<br>
     *  学生:只可以查询到自己的班级
     * @param request HttpServletRequest
     * @param studentClass 学生班级Uid
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllClbumUid")
    public String queryAllClbumUid(
            HttpServletRequest request,
            @RequestParam(value = "studentClass",required = false)String studentClass
    ){
        List<Team> clbumList;
        Map clbumMapClass = new HashMap();
        for (ClbumUid clbumUid : studentService.queryclbumUid()
        ) {
            clbumMapClass.put(clbumUid.getUid(),clbumUid);
        }
        if (studentClass == null) {
            clbumList = studentService.queryAllclbum();
        }else {
            clbumList = studentService.queryUidclbum(studentClass);
        }
        request.setAttribute("clbumList",clbumList);
        request.setAttribute("teacherList",teacherService.queryAllTeacher());
        request.setAttribute("courseUidList",courseraService.queryAllCourseUid());
        request.setAttribute("clbumUidList",clbumService.queryAllClbumUid());
        return "/module/menu/Administrator/operationPanel/selectClbumList";
    }

    /**
     *查看所有班级
     * @param request HttpServletRequest
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllClbum")
    public String queryAllClbum(
            HttpServletRequest request
    ){
        List<Team> clbumListClass = studentService.queryAllclbum();
        request.setAttribute("clbumListClass",clbumListClass);
        return "/module/menu/Administrator/operationPanel/selectClbum";
    }

    /**
     *根据班级uid查看座位表
     * @param ClbumUid 座位表uid
     * @param request HttpServletRequest
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryClbumByUid")
    public String queryClbumByUid(
            @RequestParam(value = "clbumUid",required = false)String ClbumUid,
            HttpServletRequest request
    ){

        Map<String,Student> studentMap = studentService.queryClbumStudentByUid(ClbumUid);
        List<Coursera> clbumListClass = clbumService.queryClbumByUid(ClbumUid);
        if (clbumListClass.size()<2){
            return "forward:/insertNewClbum";
        }
        List<Coursera> courseraList = new ArrayList<>();
        List<List<Student>> studentUidList_List=new ArrayList();
        List<Student> courseUidList;
        for (int i = 1 ;i <=10 ; i++){
            courseUidList = new ArrayList<>();
            for (int j = 1 ;j <=5 ; j++){
                courseUidList.add(new Student());
            }
            studentUidList_List.add(courseUidList);
        }
        for (Coursera s:clbumListClass){
            courseUidList = studentUidList_List.get(s.getY()-1);
            courseUidList.get(s.getX()-1);
            courseUidList.set(s.getX()-1,studentMap.get(s.getCourseName()));
        }
        request.setAttribute("studentUidList_List",studentUidList_List);
        request.setAttribute("clbumUid",ClbumUid);
        return "/module/menu/Administrator/operationPanel/selectClbum";
    }

    /**
     * 新建班级
     * @param request HttpServletRequest
     * @return 转发至图像渲染
     */
    @GetMapping("/insertNewClbumList")
    public String insertNewClbumList(HttpServletRequest request){
        request.setAttribute("teacherList",teacherService.queryAllTeacher());
        request.setAttribute("courseUidList",courseraService.queryAllCourseUid());
        request.setAttribute("clbumUidList",clbumService.queryAllClbumUid());
        return "/module/menu/Administrator/operationPanel/insertClbumList";
    }

    /**
     * 接收新建班级数据
     * @param className 班级名称 例:1班，2班，尖子班，卓越班。
     * @param teacher 班主任(教师Uid)
     * @param clbumUid 座位表Uid(班级uid)
     * @param courseUid 课程表Uid
     * @return 转发至查询
     */
    @PostMapping("/upInsertNewClbumList")
    public String insertNewClbumList(
            @RequestParam(value ="className",required = false ) String className,
            @RequestParam(value ="teacher",required = false ) String teacher,
            @RequestParam(value ="clbumUid",required = false ) String clbumUid,
            @RequestParam(value ="courseUid",required = false ) String courseUid
    ){

        clbumService.insertNewClbumList(new Team(String.valueOf(UUID.randomUUID()),teacher,new Date(),clbumUid,courseUid,className));
        return "forward:/queryAllClbumUid";
    }

    /**
     * 修改座位表数据
     * @param clbumUid 座位表Uid(班级uid)
     * @param request HttpServletRequest
     * @return 转发至图像渲染
     */
    @GetMapping("/updateClbum")
    public String setupdateClbum(
            @RequestParam(value = "clbumUid",required = false)String clbumUid,
            HttpServletRequest request
    ){

        Map<String,Student> studentMap = studentService.queryClbumStudentByUid(clbumUid);
        List<Coursera> clbumListClass = clbumService.queryClbumByUid(clbumUid);
        List<Coursera> courseraList;
        List<List<Coursera>> studentUidList_List=new ArrayList();
        List<Coursera> courseUidList;
        for (int i = 1 ;i <=10 ; i++){
            courseUidList = new ArrayList<>();
            for (int j = 1 ;j <=5 ; j++){
                courseUidList.add(new Coursera());
            }
            studentUidList_List.add(courseUidList);
        }
        for (Coursera s:clbumListClass){
            courseUidList = studentUidList_List.get(s.getY()-1);
            if (!s.getCourseName().equals("0")&& s.getCourseName()!=null ){
            Student student = studentMap.get(s.getCourseName());
            s.setFacultyUid(student.getStudentName());
            }
//            courseUidList.get(s.getX()-1);
            courseUidList.set(s.getX()-1,s);
        }
        request.setAttribute("studentList_List",studentUidList_List);
        List<Student> studentList = studentService.queryClbumStudentByUidRList(clbumUid);
        request.setAttribute("studentsList",studentList);
        request.setAttribute("studentNotList",studentService.queryClassNullStudent());
        request.setAttribute("clbumUid",clbumUid);
        return "/module/menu/Administrator/operationPanel/updateClbum";
    }

    /**
     *接收修改座位表数据
     * @param map 服务器接收用户发送的数据
     * @param uuid 座位表Uid(班级uid)
     * @return 转发至查询
     */
    @PostMapping("/upUpdateClbum")
    public String upUpdateClbum(
            @RequestParam(required = false)Map map,
            @RequestParam(value ="clbumUid",required = false ) String uuid
    ){
        if (uuid==null||uuid==""){
            uuid =String.valueOf(map.get("clbumUid"));
        }

        List<Coursera> courseraList = clbumService.queryClbumByUid(uuid);
        for (int  y=1;y <=10;y++){
            for (int  x=1;x-1 <5;x++){
                for (Coursera coursera: courseraList){
                    if(x==coursera.getX() &&y==coursera.getY()) {
                        coursera.setCourseName(String.valueOf(map.get("student_" + (y - 1) + "_" + (x - 1))));
                    }
                }

            }
        }
        clbumService.upUpdateClbum(courseraList);
        return "forward:/queryClbumByUid";
    }

    /**
     * 修改班级
     * @param request HttpServletRequest
     * @param clbumUid 座位表Uid(班级uid)
     * @return 转发至图像渲染
     */
    @GetMapping("/updateClbumList")
    public String updateClbumList(HttpServletRequest request,
    @RequestParam(value = "clbumUid" ,required = false) String clbumUid
    ){

        request.setAttribute("teacherList",teacherService.queryAllTeacher());
        request.setAttribute("courseUidList",courseraService.queryAllCourseUid());
        request.setAttribute("clbumClass",clbumService.queryClbumById(clbumUid));
        return "/module/menu/Administrator/operationPanel/updateClbumList";
    }

    /**
     *接收修改班级数据
     * @param uuid 班级uid
     * @param courseUid 课程表Uid
     * @param clbumUid 座位表Uid
     * @param principal 教师Uid
     * @param className 班级名称
     * @return 转发至查询
     */
    @PostMapping("/upUpdateClbumList")
    public String upUpdateClbumList(
            @RequestParam(value ="classUid",required = false ) String uuid,
            @RequestParam(value ="courseUid",required = false ) String courseUid,
            @RequestParam(value ="clbumUid",required = false ) String clbumUid,
            @RequestParam(value ="principal",required = false ) String principal,
            @RequestParam(value ="className",required = false ) String className
    ){

        clbumService.updateClbumList(new Team(uuid,principal,new Date(),clbumUid,courseUid,className));
        return "forward:/queryAllClbumUid";
    }

    /**
     * 删除班级
     * @param clbumUid  班级uid
     * @param jurisdiction 当前用户权限等级
     * @return 转发至查询
     */
    @GetMapping("/deleteClbumList")
    public String deleteClbumList(
            @RequestParam(value ="clbumUid",required = false ) String clbumUid,
            @RequestParam(value ="jurisdiction",required = false ) String jurisdiction){

        int userjurisdiction =1000000;
        try {
            userjurisdiction = Integer.valueOf(jurisdiction);

        }catch (Exception e){
            return "forward:/queryAllClbumUid";
        }
        if (userjurisdiction<=10){
            clbumService.deleteclbum(clbumService.queryClbumById(clbumUid));}
        return "forward:/queryAllClbumUid";
    }

    /**
     *新建座位表
     * @param modelMap HttpServletRequest
     * @param ClbumUid 班级uid
     * @return 转发至图像渲染
     */
    @GetMapping("/insertNewClbum")
    public String insertNewClbum(
            HttpServletRequest modelMap,
            @RequestParam(value = "clbumUid",required = false)String ClbumUid

    ){
        List<Student> studentList = studentService.queryClassNullStudent();
        modelMap.setAttribute("studentList",studentList);
        modelMap.setAttribute("clbumUid",ClbumUid);
        return "/module/menu/Administrator/operationPanel/insertClbum";
    }

    /**
     *接收新建课程表数据
     * @param map 服务器接收用户发送的数据
     * @param uuid 班级uid
     * @return 转发至查询
     */
    @PostMapping("/upInsertClbum")
    public String upInsertClbum(
            @RequestParam(required = false)Map map,
            @RequestParam(value ="clbumUid",required = false ) String uuid
    ){
        if (uuid==null||uuid==""){
            uuid =String.valueOf(map.get("clbumUid"));
        }
        List<Coursera> courseraList = new ArrayList<>();
        for (int  y=1;y <=10;y++){
            for (int  x=1;x-1 <5;x++){
                Coursera coursera = new Coursera();
                coursera.setUid(String.valueOf(UUID.randomUUID()));
                coursera.setX(x);
                coursera.setY(y);
                coursera.setCourseName(String.valueOf(map.get("student_"+y+"_"+x)));
                coursera.setCourseUid(uuid);
//                System.out.println("course_"+y+"_"+x+"====="+map.get("course_"+y+"_"+x));
//                System.out.println("teacher_"+y+"_"+x+"====="+map.get("teacher_"+y+"_"+x));
                if (coursera.getCourseName()==null){
                    coursera.setCourseName("0");
                }
                if (!coursera.getCourseName().equals('0')){
                    courseraList.add(coursera);
                }
            }
        }
        clbumService.insertNewClbum(courseraList);
        return "forward:/queryAllClbumUid";
    }
}
