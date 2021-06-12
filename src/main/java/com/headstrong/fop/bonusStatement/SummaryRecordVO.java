package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class SummaryRecordVO {

    String currency;
    BigDecimal override;
    BigDecimal salesAllowance;
    BigDecimal paymentFromAccrual;
    BigDecimal adjustment;
    BigDecimal grandTotal;
    
}
