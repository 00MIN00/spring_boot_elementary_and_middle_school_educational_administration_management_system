package com.ssm1.controllr;

import com.ssm1.domain.PageModel;
import com.ssm1.domain.Student;
import com.ssm1.domain.Team;
import com.ssm1.service.LoginService;
import com.ssm1.service.StudentService;
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
public class StudentControllr {
    @Autowired
    LoginService loginService;
    @Autowired
    StudentService studentService;

    /**
     *
     * @param request
     * @param pageNo 页码
     * @param StudentUid 学生唯一Uid
     * @return
     */
    @RequestMapping("/queryAllStudent"
    )
    public String queryAllStudent(HttpServletRequest request,
                                  @RequestParam(value = "pageNo",required = false)String pageNo,
                                  @RequestParam(value = "StudentUid",required = false)String StudentUid){
        if (pageNo == null||pageNo.equals("")) {
            pageNo="1";
        }
        PageModel page=new PageModel(Integer.parseInt(pageNo),studentService.queryAllStudentCount());
            List<Student> students;
        if (StudentUid == null) {
            students = studentService.queryAllStudentPageModel(page);
        }else {
            students = studentService.queryStudent(StudentUid);
        }
        List<Team>  clbumList = studentService.queryAllclbum();
        for (Student student :
                students) {
            for (Team team :
                    clbumList) {
                if (team.getUid().equals(student.getStudentClass())){
                    student.setStudentClass(team.getClbumName());
                }
            }
        }
        request.setAttribute("pageInfo",page);
        request.setAttribute("StudentList",students);
        return "/module/menu/Administrator/operationPanel/selectStudent";
    }
    @GetMapping("/insertNewStudent")
    public String insertNewStudent(  @RequestParam Map<String,Object> map,HttpServletRequest request){
        Student student =new Student();
        List<Team>  clbumList = studentService.queryAllclbum();
//        student.students(String.valueOf(map.get("username")));
//        Student = loginService.login(Student);
        request.setAttribute("studentClassLits",clbumList);
//        courseList
        return "/module/menu/Administrator/operationPanel/insertStudent";
    }
    @PostMapping("/upInsertStudent")
    public String upInsertStudent(
            @RequestParam Map<String,Object> map,
            @RequestParam(required = false) MultipartFile file
            ){
        if (file!=null && file.getOriginalFilename()!=null && file.getOriginalFilename()!="") {
            map.put("File", file);
        }else {map.put("File",null);}
        studentService.upInsertStudent(map);
        return "forward:/queryAllStudent";
    }
    @GetMapping("/updateStudent")
    public String setupdateStudent(
            @RequestParam Map<String,Object> map,
            HttpServletRequest request
    ){
        List<Team> courses = studentService.queryAllclbum();
        request.setAttribute("studentClassLits",courses);
        Student Student1 = studentService.queryByUid(String.valueOf(map.get("uid")));
        request.setAttribute("userItem",Student1);
        return "/module/menu/Administrator/operationPanel/updateStudent";}
    @PostMapping("/upUpdateStudent")
    public String upUpdateStudent(
            @RequestParam Map<String,Object> map,
            @RequestParam(required = false,value = "setfile") MultipartFile file
    ){
        if (file!=null){map.put("File",file);}else {map.put("File",null);}
        System.out.println(map.toString());
        boolean bool = studentService.upUpdateStudent(map);
        if (bool){
            return "forward:/queryAllStudent";
        }
        return "forward:/updateStudent";
    }
    @GetMapping("/deleteStudent")
    public String deleteStudent(@RequestParam Map<String,Object> map){
        System.out.println(map.toString());
        int userjurisdiction =1000000;
        try {
            userjurisdiction = Integer.valueOf(String.valueOf(map.get("userjurisdiction")));

        }catch (Exception e){
            return "forward:/queryAllStudent";
        }
        if (userjurisdiction<=2){
            studentService.deleteStudent(map);}
        return "forward:/queryAllStudent";
    }
}
