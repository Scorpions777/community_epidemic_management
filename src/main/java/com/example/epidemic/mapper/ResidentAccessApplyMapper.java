package com.example.epidemic.mapper;

import com.example.epidemic.entity.ResidentAccessApply;
import com.example.epidemic.entity.ResidentAccessApplyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResidentAccessApplyMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    long countByExample(ResidentAccessApplyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int deleteByExample(ResidentAccessApplyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String applyId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int insert(ResidentAccessApply record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int insertSelective(ResidentAccessApply record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    List<ResidentAccessApply> selectByExample(ResidentAccessApplyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    ResidentAccessApply selectByPrimaryKey(String applyId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") ResidentAccessApply record, @Param("example") ResidentAccessApplyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") ResidentAccessApply record, @Param("example") ResidentAccessApplyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(ResidentAccessApply record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resident_access_apply
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(ResidentAccessApply record);
}