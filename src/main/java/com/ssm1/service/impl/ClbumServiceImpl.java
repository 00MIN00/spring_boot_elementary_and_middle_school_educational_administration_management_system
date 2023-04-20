package com.ssm1.service.impl;

import com.ssm1.dao.ClbumDao;
import com.ssm1.dao.StudentDao;
import com.ssm1.domain.ClbumUid;
import com.ssm1.domain.Coursera;
import com.ssm1.domain.Team;
import com.ssm1.service.ClbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class ClbumServiceImpl implements ClbumService

{
    @Autowired
    ClbumDao clbumDao;
    @Autowired
    StudentDao studentDao;

    /**
     * 查询所有座位表Uid
     *
     * @return ：List<ClbumUid>              ——对象ClbumUid（座位表Uid）列表
     */
    @Override
    public List<ClbumUid> queryAllClbumUid() {
        return clbumDao.queryAllClbumUid();
    }

    /**
     * 查询所有座位表Uid
     *
     * @return ：List<ClbumUid>              ——对象ClbumUid（座位表Uid）列表
     */
    @Override
    public List<ClbumUid> queryClbumUid() {
        return null;
    }

    /**
     * 查询单个座位表
     * 根据座位表uid查询表
     *
     * @param courseUid 课程表uid
     * @return List 课程表列表
     */
    @Override
    public List<Coursera> queryClbumByUid(String courseUid) {
        return clbumDao.queryClbumByUid(courseUid);
    }

    /**
     * 根据Uid查询
     * @param uuid 班级uuid
     * @return ：Team            ——对象Team（班级）列表
     */
    @Override
    public Team queryClbumById(String uuid) {
         Team team = clbumDao.queryClbumById(uuid);
         for ( ClbumUid clbumUid :clbumDao.queryAllClbumUid()){
             if(clbumUid.getUid().equals(team.getClassSchedule())){
                 team.setClassSchedule(clbumUid.getClbumUidName());
             }
         }
        return team;
    }

    /**
     * 添加新的班级
     *
     * @param team ——对象team（班级）
     * @return ：boolean          操作是否成功
     */
    @Override
    @Transactional
    public boolean insertNewClbumList(Team team) {
        clbumDao.insertNewClbumUidList(team);
        team.setClassSchedule(team.getUid());
        return clbumDao.insertNewClbumList(team);
    }

    /**
     *添加新的座位表
     *      @param courseraList ——对象courseraList（座位表）数组
     *      @return ：boolean          操作是否成功
     */
    @Override
    @Transactional
    public boolean insertNewClbum(List<Coursera> courseraList) {
        for (Coursera coursera :courseraList) {
            if (!coursera.getCourseName().equals("0")){
                studentDao.UpdateStudentClass(coursera.getCourseUid(),coursera.getCourseName());
            }
            clbumDao.insertNewClbum(coursera);
        }
        return true;
    }

    /**
     * 更新的座位表
     *
     * @param courseraList ——对象coursera（座位表）数组
     * @return ：boolean          操作是否成功
     */
    @Override
    @Transactional
    public boolean upUpdateClbum(List<Coursera> courseraList) {

        List<Coursera> courserasNot0 = new ArrayList<Coursera>();
        List<Coursera> courseraListNotSet = new ArrayList<Coursera>();;
        Set<String> stringSet = new HashSet<>();
        for (Coursera c :
                courseraList) {
            if (!c.getCourseName().equals('0') && !c.getCourseName().equals("0")) {
                courserasNot0.add(c);
            }
        }
        for (Coursera c :
                clbumDao.queryClbumByUid(courseraList.get(0).getCourseUid())) {
            if (!c.getCourseName().equals('0') && !c.getCourseName().equals("0")) {
                courseraListNotSet.add(c);
            }
        }

        for (Coursera c :
                courserasNot0) {
            for (Coursera s :
                    courseraListNotSet) {

                if (c.getUid().equals(s.getUid())&&!c.getCourseName().equals(s.getCourseName())) {
                    if (
                            !studentDao.getStudentByUid(s.getCourseName()).getStudentClass().equals("")
                    && studentDao.getStudentByUid(c.getCourseName()).getStudentClass().equals("")) {
                        studentDao.UpdateStudentClass("",s.getCourseName());
                    }
                }
            }
        }


        for (Coursera coursera :courseraList) {
            if (!coursera.getCourseName().equals("0")){
                studentDao.UpdateStudentClass(coursera.getCourseUid(),coursera.getCourseName());
            }
            clbumDao.upUpdateClbum(coursera);
        }
        return true;
    }

    /**
     * 删除班级
     * @param team ——对象team（班级）
     * @return ：boolean          操作是否成功
     */
    @Override
    @Transactional
    public boolean deleteclbum(Team team) {
        List<Coursera> courserasNot0 = new ArrayList<Coursera>();
        List<Coursera> courseras = clbumDao.queryClbumByUid(team.getUid());
        for (Coursera c :
                courseras) {
            if (!c.getCourseName().equals('0') && !c.getCourseName().equals("0")) {
                courserasNot0.add(c);
            }
        }
        for (Coursera c :
               courserasNot0 ) {
            studentDao.UpdateStudentClass("",c.getCourseName());
        }
        clbumDao.deleteClbumUid(team.getUid());
        clbumDao.deleteClbumList(team.getUid());
        clbumDao.deleteClbum(team.getUid());

        return false;
    }

    /**
     * 修改班级
     *
     * @param team ——对象team（班级）
     * @return ：boolean          操作是否成功
     */
    @Override
    @Transactional
    public boolean updateClbumList(Team team) {
        Team team1 = clbumDao.queryClbumById(team.getUid());
        clbumDao.updateClbumListUidName(team);
        team.setCreationTime(team1.getCreationTime());
        return clbumDao.updateClbumList(team);
    }

}
