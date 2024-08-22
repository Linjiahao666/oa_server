package cn.jcattt.oa._enum;

public enum Status {
    PASS("PASS"),
    REJECT("REJECT"),
    PENDING("PENDING");

    private final String value;

    Status(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
