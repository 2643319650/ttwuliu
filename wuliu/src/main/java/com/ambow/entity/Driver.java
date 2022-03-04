package com.ambow.entity;

public class Driver {
    private int driver_id;
    private String driver_name; //学生姓名
    private String driver_no; //学生学号
    private String driver_sex; //学生性别
    private String driver_college;//学生学院
    private String driver_major; //学生专业
    private String driver_class; //学生班级
    private String driver_username; //账号
    private String driver_password; //密码
    private int driver_state; //学生状态：0无寝室，1有寝室
    private String driver_label; //学生标签

    public int getDriver_id() {
        return driver_id;
    }

    public void setDriver_id(int driver_id) {
        this.driver_id = driver_id;
    }

    public String getDriver_name() {
        return driver_name;
    }

    public void setDriver_name(String driver_name) {
        this.driver_name = driver_name;
    }

    public String getDriver_no() {
        return driver_no;
    }

    public void setDriver_no(String driver_no) {
        this.driver_no = driver_no;
    }

    public String getDriver_sex() {
        return driver_sex;
    }

    public void setDriver_sex(String driver_sex) {
        this.driver_sex = driver_sex;
    }

    public String getDriver_college() {
        return driver_college;
    }

    public void setDriver_college(String driver_college) {
        this.driver_college = driver_college;
    }

    public String getDriver_major() {
        return driver_major;
    }

    public void setDriver_major(String driver_major) {
        this.driver_major = driver_major;
    }

    public String getDriver_class() {
        return driver_class;
    }

    public void setDriver_class(String driver_class) {
        this.driver_major = driver_class;
    }

    public String getDriver_username() {
        return driver_username;
    }

    public void setDriver_username(String driver_username) {
        this.driver_username = driver_username;
    }

    public String getDriver_password() {
        return driver_password;
    }

    public void setDriver_password(String driver_password) {
        this.driver_password = driver_password;
    }

    public int getDriver_state() {
        return driver_state;
    }

    public void setDriver_state(int driver_state) {
        this.driver_state = driver_state;
    }

    public String getDriver_label() {
        return driver_label;
    }

    public void setDriver_label(String driver_label) {
        this.driver_label = driver_label;
    }

    public Driver(int driver_id, String driver_name, String driver_no,String driver_sex, String driver_college, String driver_major, String driver_class, String driver_username, String driver_password, int driver_state, String driver_label) {
        this.driver_id = driver_id;
        this.driver_name = driver_name;
        this.driver_no = driver_no;
        this.driver_sex = driver_sex;
        this.driver_college = driver_college;
        this.driver_major = driver_major;
        this.driver_class = driver_class;
        this.driver_username = driver_username;
        this.driver_password = driver_password;
        this.driver_state = driver_state;
        this.driver_label = driver_label;
    }

    public Driver(String driver_name, String driver_no,String driver_sex, String driver_college, String driver_major, String driver_class, String driver_username, String driver_password, int driver_state, String driver_label) {
        this.driver_name = driver_name;
        this.driver_no = driver_no;
        this.driver_sex = driver_sex;
        this.driver_college = driver_college;
        this.driver_major = driver_major;
        this.driver_class = driver_class;
        this.driver_username = driver_username;
        this.driver_password = driver_password;
        this.driver_state = driver_state;
        this.driver_label = driver_label;
    }

    public Driver() {
    }

    @Override
    public String toString() {
        return "Driver{" +
                "driver_id=" + driver_id +
                ", driver_name='" + driver_name + '\'' +
                ", driver_no='" + driver_no + '\'' +
                ", driver_sex='" + driver_sex + '\'' +
                ", driver_college='" + driver_college + '\'' +
                ", driver_major='" + driver_major + '\'' +
                ", driver_class='" + driver_class + '\'' +
                ", driver_username='" + driver_username + '\'' +
                ", driver_password='" + driver_password + '\'' +
                ", driver_state=" + driver_state + '\'' +
                ", driver_label=" + driver_label +
                '}';
    }
}
