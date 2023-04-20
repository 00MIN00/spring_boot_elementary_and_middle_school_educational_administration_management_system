package com.ssm1.service;

import com.ssm1.domain.Course;
import com.ssm1.domain.Performance;

import java.util.List;
import java.util.Map;

public interface PerformanceService {
    /**
     查询所有成绩
     * @param
     * @return List <Performance>              ——对象Performance（成绩）列表
     */
    public List<Performance> queryAllPerformance();
    /**
     根据Uid查询成绩
     * @param  uid                 ——唯一uid
     * @return List <Performance>              ——对象Performance（成绩）列表
     */
    public List<Performance> queryPerformance(String uid);
    /**
     查询所有课程
     * @param 
     * @return List <Course>               ——课程列表
     */
    public List<Course> queryAllcourse();
    /**
     根据Uid查询成绩
     * @param uid                 ——唯一uid
     * @return Performance                    ——对象Performance（成绩）
     * @deprecated
     */
    Performance queryByUid(String uid);
    /**
     增添新的成绩
     * @param  performance Performance     ——对象Performance(成绩)
     * @return boolean                    ——操作是否成功.
     */
     boolean upInsertPerformance(Performance performance);
    /**
     * 修改成绩员信息
     * @param map Map< String , Object >     ——浏览器提交的信息
     * @return boolean                    ——操作是否成功
     * @deprecated
     */
    boolean upUpdatePerformance(Map map);
    /**
     * 删除教删除
     * @param map Map< String , Object >     ——浏览器提交的信息
     * @return boolean                    ——操作是否成功
     */
    boolean deletePerformance(Map map);
}
