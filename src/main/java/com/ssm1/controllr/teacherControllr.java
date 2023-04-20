package com.ssm1.controllr;

import com.ssm1.domain.Course;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Teacher;
import com.ssm1.service.TeacherService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Controller
public class teacherControllr {
    @Autowired
    TeacherService teacherService;

    /**
     * 查询所有教师
     * @param request
     * @param pageNo 页码
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryAllTeacher")
    public String queryAllTeacher(HttpServletRequest request,
                                  @RequestParam(value = "pageNo",required = false)String pageNo
    ){
        if (pageNo == null||pageNo.equals("")) {
            pageNo="1";
        }
        PageModel page=new PageModel(Integer.parseInt(pageNo),teacherService.queryAllTeacherCount());

        List<Teacher> teachers = teacherService.getTeacherLitsPageModel(page);
        List<Course> courses = teacherService.queryAllcourse();
        request.setAttribute("courseList",courses);
        request.setAttribute("teacherList",teachers);
        request.setAttribute("pageInfo",page);
        return "/module/menu/Administrator/operationPanel/selectTeacher";
    }

    /**
     *
     * @param TeacherUid 教师唯一uid
     * @param request
     * @return 转发至图像渲染
     */
    @RequestMapping("/queryTeacherById")
    public String queryTeacherById(
            @RequestParam (value = "TeacherUid" ,required = false)String TeacherUid
                                   ,HttpServletRequest request){
        Teacher teachers = teacherService.queryByUid(TeacherUid);
        List<Course> courses = teacherService.queryAllcourse();
        request.setAttribute("courseList",courses);
        request.setAttribute("userItem",teachers);
        return "/module/menu/Administrator/operationPanel/selectClbum_Teacher";
    }

    /**
     * 新建教师信息
     * @param map 服务器接收用户发送的数据
     * @param request
     * @return 转发至图像渲染
     */
    @GetMapping("/insertNewTeacher")
    public String insertNewTeacher(  @RequestParam Map<String,Object> map,HttpServletRequest request){
        List<Course> courses = teacherService.queryAllcourse();
        Teacher teacher =new Teacher();
        teacher.setLoginId(String.valueOf(map.get("username")));
//        teacher = loginService.login(teacher);
        request.setAttribute("courseList",courses);
//        request.setAttribute("newUser",teacher);
//        courseList
        return "/module/menu/Administrator/operationPanel/insertTeacher";
    }

    /**
     * 新建教师信息数据接收
     * @param parkingList 任教科目(多选框)
     * @param map 服务器接收用户发送的数据
     * @param file 用户头像文件数据
     * @return 转发至查询sh教师
     */
    @PostMapping("/upInsertTeacher")
    public String upInsertTeacher(
            @RequestParam("course")List parkingList,
            @RequestParam Map<String,Object> map,
            MultipartFile file
            ){
//        System.out.println(file.getOriginalFilename());
        map.put("course",parkingList);
        map.put("File",file);
        teacherService.upInsertTeacher(map);
        return "forward:/queryAllTeacher";
    }

    /**
     * 修改教师信息
     * @param map 服务器接收用户发送的数据
     * @param request
     * @return 转发至图像渲染
     */
    @GetMapping("/updateTeacher")
    public String setupdateTeacher(
            @RequestParam Map<String,Object> map,
            HttpServletRequest request
    ){
        List<Course> courses = teacherService.queryAllcourse();
        request.setAttribute("courseList",courses);
        Teacher teacher1 = teacherService.queryByUid(String.valueOf(map.get("uid")));
        request.setAttribute("userItem",teacher1);
        return "/module/menu/Administrator/operationPanel/updateTeacher";}

    /**
     * 修改教师信息数据接收
     * @param course 任教科目(多选框)
     * @param map 服务器接收用户发送的数据
     * @param file 用户头像文件数据
     * @return 转发查询
     */
    @PostMapping("/upUpdateTeacher")
    public String upUpdateTeacher(
            @RequestParam(required = false) List course,
            @RequestParam Map<String,Object> map,
            @RequestParam(required = false,value = "setfile") MultipartFile file
    ){
        if (course!=null){map.put("course",course);}else {map.put("course",null);}
        if (file!=null){map.put("File",file);}else {map.put("File",null);}
        System.out.println(map.toString());
        boolean bool = teacherService.upUpdateTeacher(map);
        if (bool){
            return "forward:/queryAllTeacher";
        }
        return "forward:/updateTeacher";
    }

    /**
     * 删除教师
     * @param map 服务器接收用户发送的数据
     * @return 转发查询
     */
    @GetMapping("/deleteTeacher")
    public String deleteTeacher(@RequestParam Map<String,Object> map){
        System.out.println(map.toString());
        int userjurisdiction =1000000;
        try {
            userjurisdiction = Integer.valueOf(String.valueOf(map.get("userjurisdiction")));

        }catch (Exception e){
            return "forward:/queryAllTeacher";
        }
        if (userjurisdiction<=2){teacherService.deleteTeacher(map);}
        return "forward:/queryAllTeacher";
    }
}
