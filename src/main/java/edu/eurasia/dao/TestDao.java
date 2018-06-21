package edu.eurasia.dao;


import edu.eurasia.entity.Test;
import edu.eurasia.untils.PageUtils;

import java.util.List;

public interface TestDao {
    /**
     * 查询所有
     * @return
     */
    List<Test> allTest();

    /**
     * 删除题目
     * @param tid
     */
    void deleteTest(int tid);

    /**
     * 增加题库
     * @param test
     */
    void addTest(Test test);

    /**
     * 查询题库总数
     * @return
     */
    Integer testCount();

    /**
     * 查询单页显示的数据
     * @param pageUtils
     * @return
     */
    List<Test> singlePageTest(PageUtils pageUtils);

    /**
     * 编辑题目
     * @param test
     */
    void updateTest(Test test);

    /**
     *
     * @param id
     */
    List<Test> editTest(Integer id);

    List<Test> randomTest();

    List<Test> randomTestC();

    List<Test> randomTestData();
}
