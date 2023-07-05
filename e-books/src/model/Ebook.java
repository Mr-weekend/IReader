package model;

public class Ebook {
    private int id;         //id
    private String bookname;    //电子书名
    private String author;      //作者
    private String isbn;        //ISBN号
    private String press;       //出版社
    private String image;       //图片地址
    private String file;        //电子书文件地址
    private String introduction;    //介绍
    private int download;       //下载次数

    public int getId() {
        return id;
    }

    public String getBookname() {
        return bookname;
    }

    public String getAuthor() {
        return author;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getPress() {
        return press;
    }

    public String getImage() {
        return image;
    }

    public String getIntroduction() {
        return introduction;
    }

    public int getDownload() {
        return download;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public void setDownload(int download) {
        this.download = download;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }
}
