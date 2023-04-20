package com.ssm1.controllr;

import com.ssm1.domain.Course;
import com.ssm1.domain.Performance;
import com.ssm1.domain.Student;
import com.ssm1.domain.examination;
import com.ssm1.service.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class PerformanceControllr {
    @Autowired
    LoginService loginService;
    @Autowired
    PerformanceService performanceService;
    @Autowired
    StudentService studentService;
    @Autowired
    ExaminationService examinationService;
    @Autowired
    TeacherService teacherService;

    /**
     *  查询学生成绩
     * @param request
     * @param StudentUid 学生Uid
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllPerformance")
    public String queryAllStudent(HttpServletRequest request,
                                  @RequestParam(value = "StudentUid",required = false)String StudentUid){


        List<Performance> performanceList;
        if (StudentUid == null) {
            performanceList = performanceService.queryAllPerformance();
        }else {
            performanceList = performanceService.queryPerformance(StudentUid);
        }
        request.setAttribute("PerformanceList",performanceList);
        return "/module/menu/Administrator/operationPanel/selectPerformance";
    }

    /**
     * 新建成绩
     * @param map 服务器接收用户发送的数据
     * @param request
     * @param classSchedule
     * @return
     */
    @GetMapping("/insertNewPerformance")
    public String insertNewStudent(  @RequestParam Map<String,Object> map,HttpServletRequest request,
                                     @RequestParam(value = "classSchedule",required = false) String classSchedule)
    {


        List<Student>  studentList = studentService.queryAllStudent();

        List<examination>  examinationList = examinationService.queryAllExamination();
        List<Course>  clbumList = teacherService.queryAllcourse();
        request.setAttribute("studentList",studentList);
        request.setAttribute("examinationList",examinationList);
        request.setAttribute("clbumList",clbumList);
////        courseList
        return "/module/menu/Administrator/operationPanel/insertPerformance";
    }

    /**
     * 接收新建成绩的数据
     * @param studentIdUid 学生Uid
     * @param courseUid 课程Uid
     * @param examinationUid  考试Uid
     * @param performance 成绩
     * @return
     */
    @PostMapping("/upInsertPerformance")
    public String upInsertStudent(
            @RequestParam(value = "studentIdUid",required = false)String studentIdUid,
            @RequestParam(value = "courseUid",required = false)String courseUid,
            @RequestParam(value = "examinationUid",required = false)String examinationUid,
            @RequestParam(value = "performance",required = false)int performance
            ){
//        String.valueOf(UUID.randomUUID()),courseUid,studentIdUid
//            ,examinationUid,performance)
        Performance performance1 = new Performance();
        performance1.setUid(String.valueOf(UUID.randomUUID()));
        performance1.setStudentIdUid(studentIdUid);
        performance1.setCourseUid(courseUid);
        performance1.setExaminationUid(examinationUid);
        performance1.setPerformance(performance);
        performanceService.upInsertPerformance(performance1);
//        loginService.upInsertStudent(map);
        return "forward:/queryAllPerformance";
    }

    /**
     * 删除成绩
     * @param map 服务器接收用户发送的数据
     * @return
     */
    @GetMapping("/deletePerformance")
    public String deletePerformance(@RequestParam Map<String,Object> map){
        System.out.println(map.toString());
        int userjurisdiction =1000000;
        try {
            userjurisdiction = Integer.valueOf(String.valueOf(map.get("userjurisdiction")));

        }catch (Exception e){
            return "forward:/queryAllStudent";
        }
        if (userjurisdiction<=2){
            performanceService.deletePerformance(map);}
        return "forward:/queryAllPerformance";
    }
}
