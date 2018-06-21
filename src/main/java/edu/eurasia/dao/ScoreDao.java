package edu.eurasia.dao;

import edu.eurasia.entity.Grade;

import java.util.List;

public interface ScoreDao {

    List<Grade> allScore();

    Integer scoreCount();

    void updateScore(Grade grade);
}
