package com.headstrong.fop.payment;

import lombok.extern.java.Log;
import sun.jvm.hotspot.runtime.aarch64.AARCH64CurrentFrameGuess;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Log
public class ReportData {

    public static PaymentSummaryVO data() throws CloneNotSupportedException {

        PaymentSummaryVO r = new PaymentSummaryVO();

        List<BrokerItemVO> collect = IntStream.range(0, 50)
                .mapToObj(ReportData::getBrokerItem)
                .sorted((o1, o2) -> {

                    if (o1.getUsdPayment() == null) {
                        if (o2.getUsdPayment() != null) {
                            return -1;
                        }
                    }
                    if (o2.getUsdPayment() == null) {
                        if (o1.getUsdPayment() != null) {
                            return 1;
                        }
                    }

                    int i = o1.getBrokerFirmName().compareTo(o2.getBrokerFirmName());
                    if (i == 0) {
                        return o1.getBrokerFirmCode().compareTo(o2.getBrokerFirmCode());
                    } else {
                        return i;
                    }
                }).collect(Collectors.toList());
        r.setDetailList(collect);

        PaymentDetailVO hkd = sum(collect, BrokerItemVO::getHkdPayment);
        PaymentDetailVO usd = sum(collect, BrokerItemVO::getUsdPayment);

        PaymentDetailVO hkdClone = ((PaymentDetailVO) hkd.clone());
        PaymentDetailVO usdClone = ((PaymentDetailVO) usd.clone());
        hkd.setTotalPayableAmount(null);
        usd.setTotalPayableAmount(null);

        setupAmount(hkdClone);
        setupAmount(usdClone);

        r.setGrandTotalHKD(hkdClone);
        r.setGrandTotalUSD(usdClone);
        r.setSubTotalHKD(hkd);
        r.setSubTotalUSD(usd);
        r.setDate("08-Jun-2021");

        return r;
    }

    private static void setupAmount(PaymentDetailVO usdClone) {
        usdClone.setOpeningBalance(null);
        usdClone.setAddition(null);
        usdClone.setWrittenOff(null);
        usdClone.setClosingBalance(null);
        usdClone.setTotalPayableAmount(BigDecimal.valueOf(999999999.99));
        usdClone.setOverridePayableAmount(BigDecimal.valueOf(999999999.99));
        usdClone.setSaPayableAmount(BigDecimal.valueOf(999999999.99));
    }

    static PaymentDetailVO sum(List<BrokerItemVO> c, Function<BrokerItemVO, PaymentDetailVO> f) {
        PaymentDetailVO r = new PaymentDetailVO();
        for (BrokerItemVO brokerItemVO : c) {
            PaymentDetailVO apply = f.apply(brokerItemVO);

            if (apply != null) {
                r.setTotalPayableAmount(Optional.ofNullable(r.getTotalPayableAmount()).orElse(BigDecimal.ZERO)
                        .add(apply.getTotalPayableAmount()));
                r.setOpeningBalance(Optional.ofNullable(r.getOpeningBalance()).orElse(BigDecimal.ZERO)
                        .add(apply.getOpeningBalance()));
                r.setAddition(Optional.ofNullable(r.getAddition()).orElse(BigDecimal.ZERO).add(apply.getAddition()));
                r.setBonusAdjustment(Optional.ofNullable(r.getBonusAdjustment()).orElse(BigDecimal.ZERO)
                        .add(apply.getBonusAdjustment()));
                r.setClosingBalance(Optional.ofNullable(r.getClosingBalance()).orElse(BigDecimal.ZERO)
                        .add(apply.getClosingBalance()));
                r.setOverridePayableAmount(Optional.ofNullable(r.getOverridePayableAmount()).orElse(BigDecimal.ZERO)
                        .add(apply.getOverridePayableAmount()));
                r.setPaymentFromAccrual(Optional.ofNullable(r.getPaymentFromAccrual()).orElse(BigDecimal.ZERO)
                        .add(apply.getPaymentFromAccrual()));
                r.setSaPayableAmount(Optional.ofNullable(r.getSaPayableAmount()).orElse(BigDecimal.ZERO)
                        .add(apply.getSaPayableAmount()));
                r.setWrittenOff(Optional.ofNullable(r.getWrittenOff()).orElse(BigDecimal.ZERO)
                        .add(apply.getWrittenOff()));
            }
        }
        return r;
    }

    private static BrokerItemVO getBrokerItem(Integer i) {
        BrokerItemVO item = new BrokerItemVO();
        item.setBrokerFirmCode(a[i * 2]);
        item.setBrokerFirmName(a[i * 2 + 1]);
        item.setHkdPayment(getPaymentDetail());
        item.setMultiCurrency(false);
        if (i % 3 == 0) {
            item.setUsdPayment(getPaymentDetail());
            item.setMultiCurrency(true);
        }
        return item;
    }

    private static PaymentDetailVO getPaymentDetail() {
        Random random = new Random();
        PaymentDetailVO detail = new PaymentDetailVO(
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP),
                BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, RoundingMode.HALF_UP)
        );
        detail.setTotalPayableAmount(detail.getOverridePayableAmount().add(detail.getSaPayableAmount())
                .add(detail.getBonusAdjustment()).add(detail.getPaymentFromAccrual()));
        detail.setClosingBalance(detail.getOpeningBalance().add(detail.getAddition())
                .subtract(detail.getPaymentFromAccrual()).add(detail.getWrittenOff()));
        return detail;
    }

    static String[] a = new String[]{
            "094237", "BROKER AGENT NAME OF 094237",
            "094293", "BROKER AGENT NAME OF 094293",
            "094584", "BROKER AGENT NAME OF 094584",
            "096737", "BROKER AGENT NAME OF 096737",
            "096738", "BROKER AGENT NAME OF 096738",
            "096742", "BROKER AGENT NAME OF 096742",
            "096756", "BROKER AGENT NAME OF 096756",
            "096759", "BROKER AGENT NAME OF 096759",
            "096760", "BROKER AGENT NAME OF 096760",
            "096776", "BROKER AGENT NAME OF 096776",
            "096777", "BROKER AGENT NAME OF 096777",
            "096778", "BROKER AGENT NAME OF 096778",
            "096779", "BROKER AGENT NAME OF 096779",
            "096784", "BROKER AGENT NAME OF 096784",
            "096787", "BROKER AGENT NAME OF 096787",
            "096788", "BROKER AGENT NAME OF 096788",
            "096791", "BROKER AGENT NAME OF 096791",
            "096793", "BROKER AGENT NAME OF 096793",
            "096794", "BROKER AGENT NAME OF 096794",
            "096797", "BROKER AGENT NAME OF 096797",
            "096799", "BROKER AGENT NAME OF 096799",
            "096800", "BROKER AGENT NAME OF 096800",
            "096802", "BROKER AGENT NAME OF 096802",
            "096803", "BROKER AGENT NAME OF 096803",
            "096806", "BROKER AGENT NAME OF 096806",
            "096809", "BROKER AGENT NAME OF 096809",
            "096810", "BROKER AGENT NAME OF 096810",
            "096811", "BROKER AGENT NAME OF 096811",
            "096814", "BROKER AGENT NAME OF 096814",
            "096815", "BROKER AGENT NAME OF 096815",
            "096816", "BROKER AGENT NAME OF 096816",
            "096817", "BROKER AGENT NAME OF 096817",
            "096818", "BROKER AGENT NAME OF 096818",
            "096819", "BROKER AGENT NAME OF 096819",
            "096820", "BROKER AGENT NAME OF 096820",
            "096822", "BROKER AGENT NAME OF 096822",
            "096825", "BROKER AGENT NAME OF 096825",
            "096826", "BROKER AGENT NAME OF 096826",
            "096827", "BROKER AGENT NAME OF 096827",
            "096828", "BROKER AGENT NAME OF 096828",
            "096830", "BROKER AGENT NAME OF 096830",
            "096832", "BROKER AGENT NAME OF 096832",
            "096834", "BROKER AGENT NAME OF 096834",
            "096835", "BROKER AGENT NAME OF 096835",
            "096839", "BROKER AGENT NAME OF 096839",
            "096843", "BROKER AGENT NAME OF 096843",
            "096846", "BROKER AGENT NAME OF 096846",
            "096857", "BROKER AGENT NAME OF 096857",
            "096859", "BROKER AGENT NAME OF 096859",
            "097520", "BROKER AGENT NAME OF 097520"};

}
