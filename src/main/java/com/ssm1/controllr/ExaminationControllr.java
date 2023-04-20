package com.ssm1.controllr;

import com.ssm1.dao.CourseraDao;
import com.ssm1.domain.Course;
import com.ssm1.domain.examination;
import com.ssm1.service.ExaminationService;
import com.ssm1.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class ExaminationControllr {
    @Autowired
    LoginService loginService;
    @Autowired
    ExaminationService examinationService;
    @Autowired
    CourseraDao courseraDao;

    /**
     * 查询所有考试
     * @param request
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllExamination")
    public String queryAllExamination(HttpServletRequest request){
        List<examination> examinations = examinationService.queryAllExamination();
        request.setAttribute("examinationList",examinations);
        return "/module/menu/Administrator/operationPanel/selectExamination";
    }

    /**
     * 新添考试
     * @param request
     * @return 转发至图像渲染
     */
    @GetMapping("/insertNewExamination")
    public String insertNewExamination(HttpServletRequest request){
        List<Course> courses = courseraDao.queryAllcourse();
        request.setAttribute("courseList",courses);
        return "/module/menu/Administrator/operationPanel/insertExamination";
    }

    /**
     * 接收新建考试的数据
     * @param examinationName 考试名称
     * @param examinationDate 考试时间
     * @param teacherA 监考老师A
     * @param teacherB 监考老师B
     * @param bz 备注
     * @return 转发查询
     */
    @PostMapping("/upInsertExamination")
    public String upInsertExamination(
            @RequestParam(value = "examinationName",required = false) String examinationName,
            @RequestParam(value = "examinationDate",required = false)String examinationDate,
            @RequestParam(value = "teacherA",required = false)String teacherA,
            @RequestParam(value = "teacherB",required = false)String teacherB,
            @RequestParam(value = "bz",required = false) String bz
            ){
        examination examination = new  examination();
        examination.setUid(String.valueOf(UUID.randomUUID()));
        examination.setExaminationName(examinationName);
        examination.setExaminationPrincipal(String.valueOf(UUID.randomUUID()));
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        Date date= null;
        if (examinationDate.getBytes().length>1 ){
            try {
                date = sdf.parse(examinationDate);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        examination.setExaminationDate(date);
        examination.setTeacherA(teacherA);
        examination.setTeacherB(teacherB);
        examination.setBz(bz);
        examinationService.upInsertExamination(examination);
        return "forward:/queryAllExamination";
    }

    /**
     * 删除考试
     * @param map 服务器接收用户发送的数据
     * @return 转发查询
     */
    @GetMapping("/deleteExamination")
    public String deleteExamination(@RequestParam Map<String,Object> map){
        System.out.println(map.toString());
        int userjurisdiction =1000000;
        try {
            userjurisdiction = Integer.valueOf(String.valueOf(map.get("userjurisdiction")));

        }catch (Exception e){
            return "forward:/queryAllExamination";
        }
        if (userjurisdiction<=2){examinationService.deleteExamination(map);}
        return "forward:/queryAllExamination";
    }
}
