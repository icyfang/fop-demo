package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class SummaryVO {

    SummaryRecordVO hkdSummary;
    SummaryRecordVO usdSummary;
    BigDecimal spotRate;
    boolean sa;

}
