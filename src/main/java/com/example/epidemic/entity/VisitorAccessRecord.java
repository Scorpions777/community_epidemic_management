package com.example.epidemic.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 *  访客出入登记表实体类
 */
public class VisitorAccessRecord implements Serializable {


    private String recordId;

    /**
     *  出入时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:log4j2.xml", timezone = "GMT+8")
    private Date createTime;

    /**
     *  1：进  2：出
     */
    private Byte accessType;

    /**
     *  访客姓名
     */
    private String name;

    /**
     *  访客身份证号码
     */
    private String idCard;

    /**
     *  访客手机号
     */
    private String phone;

    /**
     *  地址id
     */
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
     *  从哪里来
     */
    private String fromPlace;

    /**
     *  体温
     */
    private BigDecimal temperature;

    /**
     *  备注
     */
    private String remark;

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId == null ? null : recordId.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getAccessType() {
        return accessType;
    }

    public void setAccessType(Byte accessType) {
        this.accessType = accessType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard == null ? null : idCard.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

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

    public String getFromPlace() {
        return fromPlace;
    }

    public void setFromPlace(String fromPlace) {
        this.fromPlace = fromPlace == null ? null : fromPlace.trim();
    }

    public BigDecimal getTemperature() {
        return temperature;
    }

    public void setTemperature(BigDecimal temperature) {
        this.temperature = temperature;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}