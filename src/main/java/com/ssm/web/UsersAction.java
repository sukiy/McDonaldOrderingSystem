package com.ssm.web;

import com.ssm.entity.TbUsers;
import com.ssm.service.TbUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * Created by Sukiy on 2018/2/11.
 */
@Controller
@RequestMapping("/usersAction")
public class UsersAction {

    @Resource(name = "userService")
    private TbUserService userService;

    @RequestMapping("/doLogin")
    @ResponseBody
    public int doLogin(@Param("job_num") String job_num, @Param("job_pwd") String job_pwd, HttpServletRequest request){
        HttpSession session=request.getSession();
        session.setAttribute("job_num",job_num);
        session.setAttribute("job_pwd",job_pwd);

        HashMap<String,Object> users=new HashMap<String,Object>();
        users.put("job_num",job_num.trim());
        users.put("job_pwd", job_pwd.trim());
        TbUsers user=userService.doLogin(users);
        session.setAttribute("user",user);

        if (user.getJob_status()==1){
            return 1;
        }
        if (user.getJob_status()==2){
            return 2;
        }
        if (user.getJob_status()==3){
            return 3;
        }
        return 0;

    }

    public TbUserService getUserService() {
        return userService;
    }

    public void setUserService(TbUserService userService) {
        this.userService = userService;
    }
}
