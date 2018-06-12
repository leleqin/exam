package edu.eurasia.service.impl;

import edu.eurasia.dao.LoginDao;
import edu.eurasia.entity.Users;
import edu.eurasia.service.LoginService;
import edu.eurasia.untils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author:Yang
 * @date:2018/5/30
 */
@Service
public class ImplLoginService implements LoginService {
    @Autowired
    LoginDao loginDao;

    @Override
    public Users studentLogin(Users users) {
        return loginDao.studentLogin(users);
    }

    @Override
    public Users teacherLogin(Users users) {
        return loginDao.teacherLogin(users);
    }
}
