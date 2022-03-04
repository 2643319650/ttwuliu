package com.ambow.entity;

public class Customer {
    private int customer_id;
    private String customer_name; //辅导员姓名
    private String customer_no; //辅导员工号
    private String customer_sex; //辅导员性别
    private String customer_college;//辅导员学院
    private String customer_tel;//辅导员电话
    private String customer_username; //用户名
    private String customer_password; //密码

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_no(){ return customer_no;}

    public void setCustomer_no(String customer_no){this.customer_no = customer_no;}

    public String getCustomer_sex(){ return customer_sex;}

    public void setCustomer_sex(String customer_sex){this.customer_sex = customer_sex;}

    public String getCustomer_college(){ return customer_college;}

    public void setCustomer_college(String customer_college){this.customer_college = customer_college;}

    public String getCustomer_tel() {
        return customer_tel;
    }

    public void setCustomer_tel(String customer_tel) {
        this.customer_tel = customer_tel;
    }

    public String getCustomer_username() {
        return customer_username;
    }

    public void setCustomer_username(String customer_username) {
        this.customer_username = customer_username;
    }

    public String getCustomer_password() {
        return customer_password;
    }

    public void setCustomer_password(String customer_password) {
        this.customer_password = customer_password;
    }

    public Customer(int customer_id, String customer_name, String customer_no,String customer_sex,String customer_college,String customer_tel, String customer_username, String customer_password) {
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.customer_no = customer_no;
        this.customer_sex = customer_sex;
        this.customer_college = customer_college;
        this.customer_tel = customer_tel;
        this.customer_username = customer_username;
        this.customer_password = customer_password;
    }

    public Customer(String customer_name, String customer_no,String customer_sex,String customer_college,String customer_tel, String customer_username, String customer_password) {
        this.customer_name = customer_name;
        this.customer_no = customer_no;
        this.customer_sex = customer_sex;
        this.customer_college = customer_college;
        this.customer_tel = customer_tel;
        this.customer_username = customer_username;
        this.customer_password = customer_password;
    }

    public Customer() {
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customer_id=" + customer_id +
                ", customer_name='" + customer_name + '\'' +
                ", customer_no='" + customer_no + '\'' +
                ", customer_sex='" + customer_sex + '\'' +
                ", customer_college='" + customer_college + '\'' +
                ", customer_tel='" + customer_tel + '\'' +
                ", customer_username='" + customer_username + '\'' +
                ", customer_password='" + customer_password + '\'' +
                '}';
    }
}
