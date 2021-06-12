package com.headstrong.fop.payment;

import lombok.Data;

import java.util.List;

/**
 * @author Hodur
 * @since 2021-05-10
 */
@Data
public class PaymentSummaryVO {

    List<BrokerItemVO> detailList;

    PaymentDetailVO subTotalHKD;
    PaymentDetailVO subTotalUSD;
    PaymentDetailVO grandTotalHKD;
    PaymentDetailVO grandTotalUSD;

    String date;
}
