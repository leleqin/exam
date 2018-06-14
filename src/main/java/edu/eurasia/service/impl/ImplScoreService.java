package edu.eurasia.service.impl;

import edu.eurasia.dao.ScoreDao;
import edu.eurasia.entity.Grade;
import edu.eurasia.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImplScoreService implements ScoreService {
    @Autowired
    ScoreDao scoreDao;

    @Override
    public List<Grade> allScore() {
        return scoreDao.allScore();
    }

    @Override
    public Integer scoreCount() {
        return scoreDao.scoreCount();
    }
}
