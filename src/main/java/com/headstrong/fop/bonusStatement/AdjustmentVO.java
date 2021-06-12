package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class AdjustmentVO {


    List<AdjustmentRecordVO> adjustmentRecords;
    BigDecimal subTotalHKD;
    BigDecimal subTotalUSD;
    BigDecimal GrandTotalHKD;
}
