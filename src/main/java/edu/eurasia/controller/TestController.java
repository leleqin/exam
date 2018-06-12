package edu.eurasia.controller;

import edu.eurasia.entity.Test;
import edu.eurasia.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/select")
public class TestController {
    @Autowired
    TestService testService;

    /**
     * 查询题库
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectAll")
    @ResponseBody
    public List<Test> allTest(Test test){
        List<Test> testList = testService.allTest();
        return testList;
    }

    /**
     * 删除题
     * @param tid
     */
    @RequestMapping("/deleteTest")
    @ResponseBody
    public void deleteTest(int tid){
        testService.deleteTest(tid);
    }

    /**
     * 增加题库
     * @param test
     */
    @RequestMapping("/addTest")
    @ResponseBody
    public void addTest(Test test){
        testService.addTest(test);
    }
}