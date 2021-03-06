package model;

import java.io.Serializable;

public class Category implements Serializable {

    private int id;
    private String name;
    private String sex;

    public Category() {
        super();
    }

    
    public Category(int id, String name, String sex) {
        super();
        this.id = id;
        this.name = name;
        this.sex = sex;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

}
