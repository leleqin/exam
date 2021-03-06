package edu.eurasia.controller;

import edu.eurasia.entity.Test;
import edu.eurasia.service.TestService;
import edu.eurasia.untils.PageUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    /**
     * 查询题库总数
     * @return
     */
    @RequestMapping("/testCount")
    @ResponseBody
    public Integer testCount()  throws Exception{
        int conutNum = testService.testCount();
        return conutNum;
    }

    /**
     * 查询单页显示的数据
     * @param pageUtils
     * @return
     */
    @RequestMapping("/singlePageTest")
    @ResponseBody
    public List<Test> singlePageTest(PageUtils pageUtils) throws Exception{
        List<Test> testList = testService.singlePageTest(pageUtils);
        return testList;
    }

    /**
     * 查询C语言题库数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/testCountC")
    @ResponseBody
    public Integer testCountC() throws Exception{
        int contNumC = testService.testCountC();
        return contNumC;
    }

    /**
     * 查询C单页显示的数据
     * @param pageUtils
     * @return
     * @throws Exception
     */
    @RequestMapping("/singlePageTestC")
    @ResponseBody
    public  List<Test> singlePageTestC(PageUtils pageUtils) throws  Exception{
        List<Test> testList = testService.singlePageTestC(pageUtils);
        return testList;
    }

    /**
     * 找出要编辑题库
     * @param id
     */
    @RequestMapping("/editTest")
    @ResponseBody
    public List<Test> editTest(@RequestParam(value = "tid")Integer id){
        List<Test> testList = testService.editTest(id);
        return testList;
    }

    /**
     * 保存更改的题目
     * @param test
     */
    @RequestMapping("/updateTest")
    @ResponseBody
    public void updateTest(Test test){
        testService.updateTest(test);
    }

    /**
     * 随机出题
     * @param test
     * @return
     */
    @RequestMapping("/randomTest")
    @ResponseBody
    public List<Test> randomTest(Test test){
        List<Test> testList = testService.randomTest();
        return testList;
    }

    @RequestMapping("/randomTestC")
    @ResponseBody
    public List<Test> randomTestC(Test test){
        List<Test> testList = testService.randomTestC();
        return testList;
    }

    @RequestMapping("/randomTestData")
    @ResponseBody
    public List<Test> randomTestData(Test test){
        List<Test> testList = testService.randomTestData();
        return testList;
    }
}
