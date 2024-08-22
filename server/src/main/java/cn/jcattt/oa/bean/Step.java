package cn.jcattt.oa.bean;

import cn.jcattt.oa._enum.Status;
import lombok.Data;

import java.util.Date;

@Data
public class Step {
    public Integer id;
    public Integer viewerid;
    public Integer vieweeid;
    public Date time;
    public Status result;
    public String reason;
}
