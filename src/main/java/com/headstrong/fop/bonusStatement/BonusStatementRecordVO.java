package com.headstrong.fop.bonusStatement;

import lombok.Data;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class BonusStatementRecordVO {

    SummaryVO summary;
    DetailsVO details;
    AccrualPaymentVO accrualPayment;
    AdjustmentVO adjustment;

    String brokerName;
    String brokerCode;
    boolean multiCurrency;
}
