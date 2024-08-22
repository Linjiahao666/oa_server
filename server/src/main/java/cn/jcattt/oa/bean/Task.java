package cn.jcattt.oa.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Task {
    public Integer id;
    public Date beginTime;
    public Integer assign;
    public Date deadline;
    public Date finishTime;
    public String content;
    public String status;
    public Integer userid;
}
