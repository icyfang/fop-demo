package com.headstrong.fop.payment;

import lombok.Data;

/**
 * @author Hodur
 * @since 2021-05-10
 */
@Data
public class BrokerItemVO {

    private String brokerFirmName;
    private String brokerFirmCode;
    private Boolean multiCurrency;
    private PaymentDetailVO hkdPayment;
    private PaymentDetailVO usdPayment;
}
