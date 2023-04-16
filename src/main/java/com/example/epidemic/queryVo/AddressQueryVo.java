package com.example.epidemic.queryVo;

import java.io.Serializable;

/**
 * @author
 * @email
 * @description
 */

public class AddressQueryVo implements Serializable {

    private String id;

    private String name;

    public AddressQueryVo() {
    }

    public AddressQueryVo(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "AddressQueryVo{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
