package com.example.epidemic.entity;

import java.io.Serializable;

/**
 *  地址表实体类
 */
public class Address  implements Serializable {

    private String addressId;

    /**
     *  小区名称
     */
    private String communityName;

    /**
     *  楼号
     */
    private String buildingNumber;

    /**
     *  门牌号
     */
    private String roomNumber;

    /**
     *  住户人数
     */
    private Byte count;
    /**
     *  户主
     */
    private String houser;

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId == null ? null : addressId.trim();
    }

    public String getCommunityName() {
        return communityName;
    }

    public void setCommunityName(String communityName) {
        this.communityName = communityName == null ? null : communityName.trim();
    }

    public String getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(String buildingNumber) {
        this.buildingNumber = buildingNumber == null ? null : buildingNumber.trim();
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber == null ? null : roomNumber.trim();
    }

    public Byte getCount() {
        return count;
    }

    public void setCount(Byte count) {
        this.count = count;
    }
    public String getHouser() {
        return houser;
    }

    public void setHouser(String houser) {
        this.houser = houser == null ? null : houser.trim();
    }
}