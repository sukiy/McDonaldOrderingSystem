package com.ssm.service;

import com.ssm.dao.TbUsersDao;
import com.ssm.entity.TbUsers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Sukiy on 2018/2/10.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class TbUserService {

    @Resource
    private TbUsersDao usersDao;

    public TbUsers doLogin(Map<String,Object> param){ //用户登录
            return usersDao.findUsers(param);
    }

    public TbUsersDao getUsersDao() {
        return usersDao;
    }

    public void setUsersDao(TbUsersDao usersDao) {
        this.usersDao = usersDao;
    }


}
