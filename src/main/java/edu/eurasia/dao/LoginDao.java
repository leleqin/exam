package edu.eurasia.dao;

import edu.eurasia.entity.Users;
import edu.eurasia.untils.PageUtils;

import java.util.List;

/**
 * @author:Yang
 * @date:2018/5/30
 */
public interface LoginDao {
    /**
     * 学生登录
     *
     * @param users
     * @return User
     */
    Users studentLogin(Users users);

    /**
     * 教师登录
     * @param users
     * @return
     */
    Users teacherLogin(Users users);
    /**
     * 查询数据总数
     * @return Integer
     */
    Integer queryCount();

    /**
     * 分页查询数据
     * @param pageUtils
     * @return  List<User>
     */
    List<Users> queryProfession(PageUtils pageUtils);
}
