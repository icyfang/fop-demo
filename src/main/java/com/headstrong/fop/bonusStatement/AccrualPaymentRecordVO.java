package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class AccrualPaymentRecordVO {

    String policyNo;
    String policyCurrency;
    BigDecimal accrualAmountNonPayment;
    BigDecimal currentMonthAccrual;
    BigDecimal payableAmount;
    BigDecimal closingBalance;

}
