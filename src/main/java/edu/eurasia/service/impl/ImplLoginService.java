package edu.eurasia.service.impl;

import edu.eurasia.dao.LoginDao;
import edu.eurasia.entity.Users;
import edu.eurasia.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImplLoginService implements LoginService {
    @Autowired
    LoginDao loginDao;

    /**
     * 学生登录
     * @param users
     * @return
     */
    @Override
    public Users studentLogin(Users users) {
        return loginDao.studentLogin(users);
    }

    /**
     * 老师登录
     * @param users
     * @return
     */
    @Override
    public Users teacherLogin(Users users) {
        return loginDao.teacherLogin(users);
    }
}
