package com.ssm1.dao;

import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.PageModel;
import com.ssm1.domain.Student;
import com.ssm1.domain.Team;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface StudentDao {
    @Select("select count(uid) from studentId")
    int queryAllTeacherCount();
    @Select("select * from studentId where studentId = #{studentId}")
    Student getStudentById(String studentId);
    @Select("select * from studentId limit #{startIndex},#{pageSize}")
    List<Student> queryAllStudentPageModel(PageModel page);
    @Select("select * from studentId where uid = #{uid} ")
    List<Student> querytudent(String uid);
    @Select("select * from studentId where uid = #{uid}")
    Student getStudentByUid(String uid);
    @Select("select * from studentId")
    List<Student> getStudentLits();
    @Select("select * from clbum order by creationTime")
    List<Team> getclbumList();
    @Select("select * from clbum where uid = #{uid}")
    List<Team> getclbumUid(String uid);
//    @Insert("insert into " +
//            "user_inf(ID,loginname,PASSWORD,STATUS,createdate,username,imgname)" +
//            "values(#{id},#{loginname},#{password},#{status},#{createdate},#{username},#{imgname})")
    @Insert("insert into " +
            "studentId(uid,studentId,studentName,sex,birthYear,enrollmentDate,studentClass,studentIdImg" +
            ",studentpassword,jurisdiction)" +
            "values(#{uid},#{studentId},#{studentName},#{sex},#{birthYear},#{enrollmentDate},#{studentClass},#{studentIdImg}" +
            ",#{studentpassword},100)")
    boolean addInsertStudent(Student teacher);
    @Delete("delete from studentId where uid = #{uid}")boolean deleteStudent(String uid);
    @Update("update studentId set studentName = #{studentName},studentpassword = #{studentpassword},sex = #{sex}," +
            "birthYear = #{birthYear},studentClass = #{studentClass}" +
            ",studentIdImg = #{studentIdImg} where uid = #{uid}")
    boolean UpdateStudent(Student teacher);
    @Update("update studentId set studentClass = #{studentClass} where uid = #{uid}")
    boolean UpdateStudentClass(String studentClass,String uid);
    @Select("select uid,studentName from studentId where studentClass=null or studentClass='';")
    List<Student> queryClassNullStudent();
    @Select("select * from clbumUid;")
    List<ClbumUid> queryclbumUid();
    @Select("select * from studentId where studentClass=#{ClbumUid};")
    List<Student> queryClbumStudentByUid(String ClbumUid);

}
