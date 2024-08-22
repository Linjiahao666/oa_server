package cn.jcattt.oa._enum;

public enum FileType {
    TXT("TXT"),
    PDF("PDF"),
    DOCS("DOCS");

    private final String extension;
    FileType(String extension) {
        this.extension = extension;
    }
    public String getExtension() {
        return extension;
    }
}
