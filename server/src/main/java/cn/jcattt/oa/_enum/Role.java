package cn.jcattt.oa._enum;

public enum Role {
    ADMIN(1),
    USER(2),
    Viewer(3);

    private int value;

    Role(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
