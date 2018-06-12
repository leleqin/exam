package edu.eurasia.service;

import edu.eurasia.entity.Users;
import edu.eurasia.untils.PageUtils;

import java.util.List;

/**
 * @author:Yang
 * @date:2018/5/30
 */
public interface LoginService {
    /**
     *学生登录
     * @param users
     * @return
     */
    Users studentLogin(Users users);

    /**
     * 老师登录
     * @param users
     * @return
     */
    Users teacherLogin(Users users);
}
