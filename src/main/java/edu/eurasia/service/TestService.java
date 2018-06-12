package edu.eurasia.service;

import edu.eurasia.entity.Test;
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
}
