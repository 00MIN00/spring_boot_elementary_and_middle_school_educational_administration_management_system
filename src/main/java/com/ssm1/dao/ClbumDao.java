package com.ssm1.dao;

import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Team;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ClbumDao {
    /**
     * 查询班级列表
     * @return List <ClbumUid>对象 ClbumUid(班级)列表
     */
    @Select("select * from clbumUid ")
    List<ClbumUid> queryAllClbumUid();

    /**
     * 根据Uid查询班级
     * @param uuid 班级Uid
     * @return Team 对象Team(班级)
     */
    @Select("select * from clbum where uid = #{uuid} ")
    Team queryClbumById(String uuid);

    /**
     *根据班级Uid查询座位表
     * @param uuid 座位表Uid
     * @return List <Coursera> 对象座位表
     */
    @Select("select uid,X,Y,studentUid AS courseName,clbumuid AS courseUid from clbummain where clbumuid = #{uuid} ")
    List<Coursera> queryClbumByUid(String uuid);

    /**
     *新添班级
     * @param team 对象Team
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "clbum(uid,principal,creationTime,classSchedule,seatingPlan,clbumName)" +
            "values(#{uid},#{principal},#{creationTime},#{classSchedule},#{seatingPlan},#{clbumName})")
    boolean insertNewClbumList(Team team);

    /**
     * 新建座位表索引
     * @param team 对象Team
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "clbumUid(uid,clbumUidName)" +
            "values(#{uid},#{classSchedule})")
    boolean insertNewClbumUidList(Team team);

    /**
     *更新班级
     * @param team 对象Team
     * @return boolean 操作是否成功
     */
    @Update("update clbum set principal = #{principal},classSchedule = #{uid},seatingPlan = #{seatingPlan}," +
            "clbumName = #{clbumName} where uid = #{uid} ")
    public boolean updateClbumList(Team team);

    /**
     * 更新座位表索引
     * @param team 对象Team
     * @return boolean 操作是否成功
     */
    @Update("update clbumUid set clbumUidName = #{classSchedule} where uid = #{uid} ")
    public boolean updateClbumListUidName(Team team);

    /**
     *新建座位表
     * @param coursera 座位表单位对象
     * @return boolean 操作是否成功
     */
    @Insert("insert into " +
            "clbummain(uid,X,Y,studentUid,clbumuid)" +
            "values(#{uid},#{X},#{Y},#{courseName},#{courseUid})")
    boolean insertNewClbum(Coursera coursera);

    /**
     *更新座位表
     * @param coursera 座位表单位对象
     * @return boolean 操作是否成功
     */
    @Update("update clbummain set studentUid = #{courseName} where uid = #{uid} ")
    public boolean upUpdateClbum(Coursera coursera);

    /**
     * 删除座位表
     * @param uuid 座位表Uid
     * @return boolean 操作是否成功
     */
    @Delete("delete from clbummain where clbumuid = #{uuid}")
    boolean deleteClbum(String uuid);

    /**
     * 删除班级
     * @param uuid 班级Uid
     * @return boolean 操作是否成功
     */
    @Delete("delete from clbum where uid = #{uuid}")
    boolean deleteClbumList(String uuid);

    /**
     * 删除座位表索引
     * @param uuid 座位表Uid
     * @return boolean 操作是否成功
     */
    @Delete("delete from clbumUid where uid = #{uuid}")
    boolean deleteClbumUid(String uuid);


}
