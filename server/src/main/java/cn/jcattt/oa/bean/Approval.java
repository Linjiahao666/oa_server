package cn.jcattt.oa.bean;

import cn.jcattt.oa._enum.Status;
import lombok.Data;

import java.util.Date;

@Data
public class Approval {
    public Integer id;
    public Integer from;
    public Date finishTime;
    public Status status;
}
