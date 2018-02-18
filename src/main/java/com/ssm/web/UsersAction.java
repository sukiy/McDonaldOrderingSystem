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
    public String doLogin(@Param("job_num") String job_num, @Param("job_pwd") String job_pwd, HttpServletRequest request, Model model){
        HttpSession session=request.getSession();
        session.setAttribute("job_num",job_num);
        session.setAttribute("job_pwd",job_pwd);
        if (job_num==null||job_num.equals("")){
            model.addAttribute("0","用户名不能为空");
            return "index";
        }else if (job_pwd==null||job_pwd.equals("")){
            model.addAttribute("1","密码不能为空");
            return "index";
        }

        HashMap<String,Object> users=new HashMap<String,Object>();
        users.put("job_num",job_num.trim());
        users.put("job_pwd", job_pwd.trim());
        TbUsers user=userService.doLogin(users);
        session.setAttribute("user",user);

        if (user==null){
            model.addAttribute("error","用户名或密码错误");
            return "index";
        }else {
            if (user.getJob_status()==2){
                return "redirect:/main.jsp";
            }else if (user.getJob_status()==3){
                return "redirect:/manager.jsp";
            }
            return "";
        }
    }

    public TbUserService getUserService() {
        return userService;
    }

    public void setUserService(TbUserService userService) {
        this.userService = userService;
    }
}
