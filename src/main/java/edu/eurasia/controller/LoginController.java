package edu.eurasia.controller;

import edu.eurasia.entity.Users;
import edu.eurasia.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    LoginService loginService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    /**
     * 学生登录
     * @param session
     * @param users
     * @return
     * @throws Exception
     */
    @RequestMapping("/studentLogin")
    @ResponseBody
    public Map<String, Object> studentLogin(HttpSession session, Users users) throws  Exception{
        Map<String, Object> result = new HashMap<String, Object>();
        Users userInfo = loginService.studentLogin(users);
        if (userInfo != null ){
            String name = userInfo.getUname();
            session.setAttribute("userInfo", name);
            result.put("success",true);
        }else{
            result.put("success",false);
        }
        return result;
    }

    /**
     * 老师登录
     * @param session
     * @param users
     * @return
     * @throws Exception
     */
    @RequestMapping("/teacherLogin")
    @ResponseBody
    public Map<String, Object> teacherLogin(HttpSession session, Users users) throws  Exception{
        Map<String, Object> result = new HashMap<String, Object>();
        Users userInfo = loginService.teacherLogin(users);
        if (userInfo != null ){
            String name = userInfo.getUname();
            System.out.println(name);
            session.setAttribute("userInfo", name);
            result.put("success",true);
        }else{
            result.put("success",false);
        }
        return result;
    }

    @RequestMapping("/exit")
    @ResponseBody
    public String exit(HttpSession session){
        if (session != null){
            session.removeAttribute("userInfo");
        return "ok";
        }
        return null;
    }

}
