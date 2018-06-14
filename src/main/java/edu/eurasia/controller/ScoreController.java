package edu.eurasia.controller;

import edu.eurasia.entity.Grade;
import edu.eurasia.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/score")
public class ScoreController {
    @Autowired
    ScoreService scoreService;

    /**
     * 查询学生成绩信息
     * @param grade
     * @return
     */
    @RequestMapping("/selectAllScore")
    @ResponseBody
    public List<Grade> allScore(Grade grade){
        List<Grade> gradeList = scoreService.allScore();
        return gradeList;
    }

    @RequestMapping("/scoreCount")
    @ResponseBody
    public Integer scoreCount() throws Exception{
        int countNum = scoreService.scoreCount();
        return countNum;
    }
}
