package edu.eurasia.service;

import edu.eurasia.entity.Grade;

import java.util.List;

public interface ScoreService {
    List<Grade> allScore();

    Integer scoreCount();
}
