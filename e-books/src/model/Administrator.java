package model;

public class Administrator {
    private int id;
    private String adname;
    private String adpassword;

    public int getId() {
        return id;
    }

    public String getAdname() {
        return adname;
    }

    public String getAdpassword() {
        return adpassword;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public void setAdpassword(String adpassword) {
        this.adpassword = adpassword;
    }
}
