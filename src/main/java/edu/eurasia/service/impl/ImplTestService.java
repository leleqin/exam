package edu.eurasia.service.impl;

import edu.eurasia.dao.TestDao;
import edu.eurasia.entity.Test;
import edu.eurasia.service.TestService;
import edu.eurasia.untils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImplTestService implements TestService {
    @Autowired
    TestDao testDao;

    /**
     * 查询题库
     * @return
     */
    @Override
    public List<Test> allTest() {
        return testDao.allTest();
    }

    /**
     * 删除题库
     * @param id
     */
    @Override
    public void deleteTest(int id) {
        testDao.deleteTest(id);
    }

    /**
     * 增加题目
     * @param test
     */
    @Override
    public void addTest(Test test) {
        testDao.addTest(test);
    }

    /**
     * 查询题库总数
     * @return
     */
    @Override
    public Integer testCount() {
        return testDao.testCount();
    }

    /**
     * 查询单页显示的数据
     * @param page
     * @return
     */
    @Override
    public List<Test> singlePageTest(PageUtils page) {
        PageUtils pageUtils = new PageUtils();
        pageUtils.setCurrentIndex((page.getCurrentIndex() - 1) * page.getLimitIndex());
        pageUtils.setLimitIndex(page.getLimitIndex());
        System.out.println(pageUtils.getCurrentIndex());
        System.out.println(pageUtils.getLimitIndex());
        return testDao.singlePageTest(pageUtils);
    }

    /**
     * 编辑题目
     * @param id
     */
    @Override
    public void updateTest(int id) {
        testDao.updateTest(id);
    }
}
