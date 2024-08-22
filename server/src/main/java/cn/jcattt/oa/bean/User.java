package cn.jcattt.oa.bean;

import lombok.Data;

import java.util.Date;

@Data
public class User {
    public Integer id;
    public String name;
    public String pwd;
    public String email;
    public String phone;
    public Date createTime;
    public Date updateTime;
    public Integer status;
    public Integer role;
    public byte[] avatar;
    public String githubAccount;
    public Integer sex;
    public Integer age;
}
