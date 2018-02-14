package com.ssm.dao;

import com.ssm.entity.TbUsers;
import org.apache.ibatis.annotations.Select;

import java.util.Map;


/**
 * Created by Sukiy on 2018/2/10.
 */
public interface TbUsersDao {

    @Select("select * from tb_users u where job_num=#{job_num} and job_pwd=#{job_pwd}")
    TbUsers findUsers(Map<String,Object> param); //查询用户，验证登录
}
