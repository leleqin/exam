package edu.eurasia.service;

import edu.eurasia.entity.Test;
import edu.eurasia.untils.PageUtils;

import java.util.List;

public interface TestService {
    /**
     * 查询所有题目
     * @param
     * @return
     */
    List<Test> allTest();

    /**
     * 删除题目
     * @param id
     */
    void deleteTest(int id);

    /**
     * 增加题库
     * @param test
     */
    void addTest(Test test);

    /**
     * 题库总数
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
     * 查询要编辑的题目
     * @param id
     */
    List<Test> editTest(Integer id);
}
