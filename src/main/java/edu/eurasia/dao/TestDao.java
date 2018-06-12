package edu.eurasia.dao;


import edu.eurasia.entity.Test;

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
}
