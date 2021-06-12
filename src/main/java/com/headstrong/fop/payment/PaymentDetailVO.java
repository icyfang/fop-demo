package com.headstrong.fop.payment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Hodur
 * @since 2021-05-10
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDetailVO implements Cloneable {

    private BigDecimal overridePayableAmount;
    private BigDecimal saPayableAmount;
    private BigDecimal bonusAdjustment;
    private BigDecimal openingBalance;
    private BigDecimal addition;
    private BigDecimal paymentFromAccrual;
    private BigDecimal writtenOff;
    private BigDecimal closingBalance;
    private BigDecimal totalPayableAmount;

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
