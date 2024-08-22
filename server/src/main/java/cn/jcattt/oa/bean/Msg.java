package cn.jcattt.oa.bean;

import cn.jcattt.oa._enum.FileType;
import lombok.Data;

import java.util.Date;

@Data
public class Msg {
    public Integer id;
    public String content;
    public FileType fileType;
    public Integer from;
    public Integer to;
    public Integer isGroup;
    public Date sendTime;
    public Integer isFile;
    public Integer status;
    public byte[] file;
}
