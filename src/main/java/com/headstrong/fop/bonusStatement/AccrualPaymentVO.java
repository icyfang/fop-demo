package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class AccrualPaymentVO {

    List<AccrualPaymentRecordVO> accrualPaymentRecords;
    BigDecimal subTotalHKD;
    BigDecimal subTotalUSD;
    BigDecimal GrandTotalHKD;
    
}
