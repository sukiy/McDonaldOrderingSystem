package com.ssm.entity;

/**
 * Created by Sukiy on 2018/2/10.
 */
public class TbUsers {

    private String job_num;//工号
    private String job_pwd;//密码
    private int job_status;//状态(1.管理员；2.工作人员；3.餐厅经理)

    public TbUsers() {
    }

    public TbUsers(String job_num, String job_pwd, int job_status) {
        this.job_num = job_num;
        this.job_pwd = job_pwd;
        this.job_status = job_status;
    }

    public String getJob_num() {
        return job_num;
    }

    public void setJob_num(String job_num) {
        this.job_num = job_num;
    }

    public String getJob_pwd() {
        return job_pwd;
    }

    public void setJob_pwd(String job_pwd) {
        this.job_pwd = job_pwd;
    }

    public int getJob_status() {
        return job_status;
    }

    public void setJob_status(int job_status) {
        this.job_status = job_status;
    }
}
