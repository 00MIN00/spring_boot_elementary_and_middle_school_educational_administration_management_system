package com.ssm1.dao;

import com.ssm1.domain.Performance;
import com.ssm1.domain.Team;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface PerformanceDao {
    /**
     根据学生Uid查询成绩
     * @param studentId                 ——学生唯一uid
     * @return Performance                    ——对象Performance（成绩）
     */
    @Select("select * from performance where studentId = #{studentId}")
    Performance getPerformanceById(String studentId);
    /**
     根据Uid查询成绩
     * @param uid                 ——唯一uid
     * @return Performance                    ——对象Performance（成绩）
     */
    @Select("select * from performance where uid = #{uid}")
    Performance getPerformanceByUid(String uid);
    /**
     查询所有成绩
     * @param
     * @return List <Performance>            ——对象Performance（成绩）列表
     */
    @Select("select * from performance")
    List<Performance> getPerformanceLits();
    /**
     根据Uid查询成绩
     * @param uid                 ——唯一uid
     * @return List <Performance>                   ——对象Performance（成绩）列表
     */
    @Select("select * from performance where studentIdUid = #{uid}")
    List<Performance> getPerformance(String uid);
    /**
     查询班级
     * @param
     * @return List <Team> ——对象Team（班级）列表
     * @deprecated
     */
    @Select("select * from performance order by creationTime")
    List<Team> getclbumList();
    /**
     新添成绩
     * @param teacher                 ——对象Performance（成绩）
     * @return boolean                    ——操作是否成功.
     * @deprecated
     */
    @Insert("insert into " +
            "performance(uid,studentIdUid,courseUid,examinationUid,performance)" +
            "values(#{uid},#{studentIdUid},#{courseUid},#{examinationUid},#{performance})")
    boolean addInsertPerformance(Performance teacher);
    /**
     根据Uid删除成绩
     * @param uid                 ——唯一uid
     * @return boolean                    ——操作是否成功.
     */
    @Delete("delete from performance where uid = #{uid}")boolean deletePerformance(String uid);
    /**
     根据Uid更新成绩
     * @param teacher                 ——对象Performance（成绩）
     * @return boolean                    ——操作是否成功.
     * @deprecated
     */
    @Update("update performance set studentName = #{studentName},studentpassword = #{studentpassword},sex = #{sex}," +
            "birthYear = #{birthYear},studentClass = #{studentClass}" +
            ",studentIdImg = #{studentIdImg} where uid = #{uid}")
    boolean UpdatePerformance(Performance teacher);
}
