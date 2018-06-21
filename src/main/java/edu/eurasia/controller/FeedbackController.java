package edu.eurasia.controller;

import edu.eurasia.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/feedBack")
public class FeedbackController {

    @Autowired
    FeedbackService feedbackService;

    @RequestMapping("/feedBack")
    @ResponseBody
    public void feedBack(){
        feedbackService.feedback();
    }
}
