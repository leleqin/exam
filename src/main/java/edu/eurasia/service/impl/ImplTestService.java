package edu.eurasia.service.impl;

import edu.eurasia.dao.TestDao;
import edu.eurasia.entity.Test;
import edu.eurasia.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImplTestService implements TestService {
    @Autowired
    TestDao testDao;

    @Override
    public List<Test> allTest() {
        return testDao.allTest();
    }

    @Override
    public void deleteTest(int id) {
        testDao.deleteTest(id);
    }

    @Override
    public void addTest(Test test) {
        testDao.addTest(test);
    }
}
