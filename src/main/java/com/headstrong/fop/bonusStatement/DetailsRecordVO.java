package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class DetailsRecordVO {

    String policyNo;
    String planName;
    String productCategory;
    BigDecimal fyc;
    BigDecimal overrideBonusRate;
    BigDecimal overridePayableAmount;
    BigDecimal overrideAccrualAmount;

    BigDecimal saBonusRate;
    BigDecimal saPayableAmount;
    BigDecimal saAccrualAmount;
}
