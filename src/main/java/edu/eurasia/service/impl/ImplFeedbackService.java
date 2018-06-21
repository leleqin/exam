package edu.eurasia.service.impl;

import edu.eurasia.dao.FeedbackDao;
import edu.eurasia.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImplFeedbackService implements FeedbackService {

    @Autowired
    FeedbackDao feedbackDao;

    @Override
    public void feedback() {
        feedbackDao.feedback();
    }
}
