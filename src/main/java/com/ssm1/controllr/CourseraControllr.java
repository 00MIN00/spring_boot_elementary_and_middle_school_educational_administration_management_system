package com.ssm1.controllr;

import com.ssm1.domain.Course;
import com.ssm1.domain.CourseUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Teacher;
import com.ssm1.service.CourseraService;
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
public class CourseraControllr {
    @Autowired
    CourseraService courseraService;
    @Autowired
    TeacherService teacherService;
    /**
     * 查询所有课程表
     * @param  uuid courseUid 课表主Uid
     * @param  request HttpServletRequest
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllCoursera")
    public String queryAllCoursera(
            @RequestParam(value = "courseUid",required = false)String uuid,
            HttpServletRequest request
    ){
        List<com.ssm1.domain.CourseUid> courseUidList = courseraService.queryAllCourseUid();
        request.setAttribute("courseUid",uuid);
        if (uuid==null||uuid==""){
            uuid = courseUidList.get(0).getUid();
        }
        List<Coursera> courseraList = courseraService.queryAllCoursera(uuid);
        if (courseraList.size()<1){
            return "forward:/queryAllCourseUid";
        }
        for (Coursera s:courseraList){
            request.setAttribute("teacher_"+s.getY()+"_"+s.getX(),s.getFacultyUid());
            request.setAttribute("course_"+ s.getY()+"_"+s.getX(),s.getCourseName());
        }
        request.setAttribute("courseUidList",courseUidList);
        return "/module/menu/Administrator/operationPanel/selelctCoursera";
    }
    /**
     * 查询课程表
     * @apiNote 查询课程表改良方法，返回数组
     * @param  uuid courseUid 课表主Uid
     * @param  request HttpServletRequest
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryCourseraByUid")
    public String queryCourseraByUid(
            @RequestParam(value = "CourseUid",required = false)String uuid,
            HttpServletRequest request
    ){
        List<com.ssm1.domain.CourseUid> courseUidList = courseraService.queryAllCourseUid();
        request.setAttribute("courseUid",uuid);
        if (uuid==null||uuid==""){
            uuid = courseUidList.get(0).getUid();
        }
        List<Coursera> courseraList = courseraService.queryAllCoursera(uuid);
        if (courseraList.size()<1){
            return "forward:/queryAllCourseUid";
        }
        List<List<Map<String,Object>>> courseUidList_List_Map=new ArrayList();
        List<Map<String,Object>> courseUidList_Map;
        Map<String,Object> courseUid_Map ;

        String strings[]= new String[]{"8:40~9:20","9:30~10:10","10:20~11:00","2:00~2:40","2:50~3:30","3:40~4:20"};
        for (int i = 1 ;i <=6 ; i++){
            courseUidList_Map = new ArrayList<>();
            for (int j = 1 ;j <=8 ; j++){
                courseUid_Map =  new HashMap<>() ;
                courseUid_Map.put("course","");
                courseUid_Map.put("teacher","");
                courseUidList_Map.add(courseUid_Map);
            }
            courseUid_Map =  courseUidList_Map.get(0);
            courseUid_Map.replace("course",strings[i-1]);
            courseUid_Map.replace("teacher","0");
            courseUidList_List_Map.add(courseUidList_Map);
        }
        for (Coursera s:courseraList){
            courseUidList_Map = courseUidList_List_Map.get(s.getY()-1);
            courseUid_Map = courseUidList_Map.get(s.getX());
            courseUid_Map.replace("course",s.getCourseName());
            courseUid_Map.replace("teacher",s.getFacultyUid());
        }

        request.setAttribute("courseUidList_List_Map",courseUidList_List_Map);
        return "/module/menu/Administrator/operationPanel/selelctClbum_Coursera";
    }
    /**
     *查看所有课程表
     * @param request HttpServletRequest
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllCourseUid")
    public String queryAllCourseUid(
HttpServletRequest request
    ){
        List<CourseUid> teachers = courseraService.queryAllCourseUid();
        request.setAttribute("teacherList",teachers);
        return "/module/menu/Administrator/operationPanel/selelctCourseraList";
    }
    /**
     *查看所有课程表
     * @param request HttpServletRequest
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllCourse")
    public String queryAllCourse(
            HttpServletRequest request
    ){
        List<Course> teachers = courseraService.queryAllcourse();

        request.setAttribute("teacherList",teachers);
        return "/module/menu/Administrator/operationPanel/selectCourse";
    }
    /**
     * 接收新建课程表数据
     * @param principal 课程表名字
     * @param uid 课程表uid
     * @return 转发至查询
     */
    @GetMapping("/upInsertNewCourse")
    public String insertNewCourse(
            @RequestParam(value = "CourseName",required = false)String principal,
            @RequestParam(value = "CourseUid",required = false)String uid

    ){
        courseraService.upInsertNewCourse(new Course(uid,principal));


        return "forward:/queryAllCourse";}

    /**
     * 删除课程表
     * @param uid 课程表uid
     * @param jurisdiction 当前用户权限等级
     * @return  转发至查询
     */
    @GetMapping("/deleteCourse")
    public String deleteCourse(
            @RequestParam(value = "courseUid",required = false)String uid,
            @RequestParam(value = "jurisdiction",required = false)String jurisdiction
            ){
        if (uid==null||jurisdiction==null||uid==""||jurisdiction==""||Integer.valueOf(jurisdiction)>2){
            return "/module/menu/Administrator/operationPanel/selectCourse";
        }
        courseraService.deleteCourse(uid);

        return "forward:/queryAllCourse";
    }

    /**
     *新建课程表导航
     * @return 转发至图像渲染
     */
    @GetMapping("/insertNewCoursera")
    public String insertNewCoursera(){return "/module/menu/Administrator/operationPanel/insertCourseraList";}
    /**
     * 接收新建课程表导航
     * @param map 服务器接收用户发送的数据
     * @return 转发至查询
     */
    @PostMapping("/upInsertCourseraList")
    public String upInsertCourseraList(@RequestParam(required = false)Map map
    ){

        CourseUid courseUid = new CourseUid();
        courseUid.setUid(String.valueOf(UUID.randomUUID()));
        courseUid.setCourseUidName(String.valueOf(map.get("CourseraList")));
        courseraService.upInsertCourseraList(courseUid);
        return "forward:/queryAllCourseUid";
    }

    /**
     *接收课程表数据
     * @param map 服务器接收用户发送的数据
     * @param uuid  uid 课程表uid
     * @return 转发至查询
     */
    @PostMapping("/upInsertCoursera")
    public String upInsertCoursera(
            @RequestParam(required = false)Map map,
            @RequestParam(value ="courseUid",required = false ) String uuid
                                   ){
        if (uuid==null||uuid==""){
            uuid =String.valueOf(map.get("courseUid"));
        }
        List<Coursera> courseraList = new ArrayList<>();
        for (int  y=1;y <=map.keySet().size()/2/7;y++){
            for (int  x=1;x-1 <=map.keySet().size()/2/7;x++){
                Coursera coursera = new Coursera();
                coursera.setUid(String.valueOf(UUID.randomUUID()));
                coursera.setX(x);
                coursera.setY(y);
                coursera.setFacultyUid(String.valueOf(map.get("teacher_"+y+"_"+x)));
                coursera.setCourseName(String.valueOf(map.get("course_"+y+"_"+x)));
                coursera.setCourseUid(uuid);
//                System.out.println("course_"+y+"_"+x+"====="+map.get("course_"+y+"_"+x));
//                System.out.println("teacher_"+y+"_"+x+"====="+map.get("teacher_"+y+"_"+x));
                if (!coursera.getCourseName().equals('0')||!coursera.getFacultyUid().equals('0')){
                courseraList.add(coursera);
                }
            }
        }
        courseraService.upInsertCoursera(courseraList);
        return "forward:/queryAllCoursera";
    }
    /**
     *修改课程表
     * @param map 服务器接收用户发送的数据
     * @param uuid  课程表uid
     * @param request
     * @return 转发至图像渲染
     */
    @GetMapping("/updateCoursera")
    public String setupdateCoursera(
            @RequestParam(required = false)Map map,
            @RequestParam(value ="courseUid",required = false ) String uuid,
            HttpServletRequest request
    ){
        List<Course> courses = courseraService.queryAllcourse();
        List<Teacher> teachers = courseraService.queryAllTeacher();
        if (uuid==null||uuid==""){
            uuid =String.valueOf(map.get("courseUid"));
        }
        request.setAttribute("courseUid",uuid);
        List<Coursera> courseraList1 = courseraService.queryAllCoursera(uuid);
        if (courseraList1.size()<1){
            request.setAttribute("courseList",courses);
            request.setAttribute("teacherList",teachers);
            return "/module/menu/Administrator/operationPanel/insertCoursera";
        }
        List<com.ssm1.domain.CourseUid> courseUidList = courseraService.queryAllCourseUid();

        List<Coursera> courseraList = courseraService.queryAllCoursera(uuid);
        for (Coursera s:courseraList) {
            request.setAttribute("teacher_" + s.getY() + "_" + s.getX(), s.getFacultyUid());
            request.setAttribute("course_" + s.getY() + "_" + s.getX(), s.getCourseName());
        }
        request.setAttribute("courseList",courses);
        request.setAttribute("teacherList",teachers);

        return "/module/menu/Administrator/operationPanel/updateCoursera";
    }

    /**
     *接收修改课程表数据
     * @param map 服务器接收用户发送的数据
     * @param uuid  课程表uid
     * @return 转发至查询
     */
    @PostMapping("/upUpdateCoursera")
    public String upUpdateCoursera(
            @RequestParam(value ="courseUid",required = false ) String uuid,
            @RequestParam Map<String,Object> map
    ){
        List<Coursera> courseraList = new ArrayList<>();
        if (uuid==null||uuid==""){
            uuid =String.valueOf(map.get("courseUid"));
        }
        for (int  y=1;y <=map.keySet().size()/2/7;y++){
            for (int  x=1;x-1 <=map.keySet().size()/2/7;x++){
                Coursera coursera = new Coursera();
                coursera.setUid(String.valueOf(UUID.randomUUID()));
                coursera.setX(x);
                coursera.setY(y);
                coursera.setFacultyUid(String.valueOf(map.get("teacher_"+y+"_"+x)));
                coursera.setCourseName(String.valueOf(map.get("course_"+y+"_"+x)));
                coursera.setCourseUid(uuid);
//                System.out.println("course_"+y+"_"+x+"====="+map.get("course_"+y+"_"+x));
//                System.out.println("teacher_"+y+"_"+x+"====="+map.get("teacher_"+y+"_"+x));
                if (!coursera.getCourseName().equals('0')||!coursera.getFacultyUid().equals('0')){
                    courseraList.add(coursera);
                }
            }
        }
        courseraService.UpdateCoursera(courseraList);
        return "forward:/queryAllCoursera";
    }

    /**
     *删除课程表
     * @param map 服务器接收用户发送的数据
     * @return 转发至查询
     */
    @GetMapping("/deleteCoursera")
    public String deleteCoursera(@RequestParam Map<String,Object> map){
        if (Integer.valueOf(String.valueOf(map.get("jurisdiction")))>2||String.valueOf(map.get("jurisdiction"))==""){
            return "forward:/queryAllCourseUid";
        }
        courseraService.deleteCoursera(String.valueOf(map.get("courseUid")));

        return "forward:/queryAllCourseUid";
    }
}
