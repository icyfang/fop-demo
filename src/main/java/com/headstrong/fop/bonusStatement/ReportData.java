package com.headstrong.fop.bonusStatement;

import com.headstrong.fop.payment.BrokerItemVO;
import com.headstrong.fop.payment.PaymentDetailVO;
import lombok.extern.java.Log;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

@Log
public class ReportData {

    public static BonusStatementVO data() throws CloneNotSupportedException {
        BonusStatementRecordVO s1 = new BonusStatementRecordVO();
        s1.setAccrualPayment(accrualPayment());
        s1.setAdjustment(adjustment());
        s1.setDetails(details());
        s1.setSummary(summary());
        s1.setBrokerCode("096828");
        s1.setBrokerName("BROKER AGENT NAME OF 096828000");
        s1.setMultiCurrency(true);

        BonusStatementRecordVO s2 = new BonusStatementRecordVO();
        s2.setAccrualPayment(accrualPayment());
        s2.setAdjustment(adjustment());
        DetailsVO details = details();
        details.setSa(false);
        s2.setDetails(details);
        SummaryVO summary = summary();
        summary.setSa(false);
        s2.setSummary(summary);
        s2.setBrokerCode("096829");
        s2.setBrokerName("BROKER AGENT NAME OF 096829000");
        s2.setMultiCurrency(false);

        BonusStatementVO s = new BonusStatementVO();
        s.setStatementRecords(Arrays.asList(s1, s2));
        s.setDate("08-Jun-2021");
        return s;

    }

    static SummaryVO summary() {
        Random random = new Random();
        SummaryRecordVO s1 = new SummaryRecordVO();
        s1.setCurrency("HKD");
        s1.setAdjustment(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s1.setGrandTotal(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s1.setOverride(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s1.setPaymentFromAccrual(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s1.setSalesAllowance(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));

        SummaryRecordVO s2 = new SummaryRecordVO();
        s2.setCurrency("USD");
        s2.setAdjustment(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s2.setGrandTotal(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s2.setOverride(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s2.setPaymentFromAccrual(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        s2.setSalesAllowance(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));

        SummaryVO s = new SummaryVO();
        s.setSpotRate(BigDecimal.valueOf(90.42));
        s.setSa(true);
        s.setHkdSummary(s1);
        s.setUsdSummary(s2);

        return s;
    }

    static List<DetailsRecordVO> detailsRecords() {
        Random random = new Random();
        List<DetailsRecordVO> r = new ArrayList<>();
        for (int i = 0; i < a.length / 2; i++) {

            DetailsRecordVO a1 = new DetailsRecordVO();
            a1.setFyc(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setOverrideBonusRate(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setOverridePayableAmount(BigDecimal.valueOf(random.nextDouble() * 100)
                    .setScale(2, RoundingMode.HALF_UP));
            a1.setOverrideAccrualAmount(BigDecimal.valueOf(random.nextDouble() * 100)
                    .setScale(2, RoundingMode.HALF_UP));
            a1.setSaBonusRate(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setSaPayableAmount(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setSaAccrualAmount(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));

            a1.setPolicyNo(a[i * 2]);
            a1.setPlanName("Plan Name");
            a1.setProductCategory(a[i * 2 + 1]);
            r.add(a1);
        }
        r.sort(Comparator.comparing(DetailsRecordVO::getPolicyNo));
        return r;
    }

    static DetailsVO details() {

        DetailsVO details = new DetailsVO();
        details.setSaGrandTotalHKD(BigDecimal.valueOf(999999999.99));
        details.setSaSubTotalHKD(BigDecimal.valueOf(999999999.99));
        details.setSaSubTotalUSD(BigDecimal.valueOf(999999999.99));
        details.setHkdRecords(detailsRecords());
        details.setUsdRecords(detailsRecords());
        details.setOverrideGrandTotalHKD(BigDecimal.valueOf(999999999.99));
        details.setOverrideSubTotalHKD(BigDecimal.valueOf(999999999.99));
        details.setOverrideSubTotalUSD(BigDecimal.valueOf(999999999.99));
        details.setSa(true);
        return details;
    }

    static List<AdjustmentRecordVO> adjustmentRecords() {
        Random random = new Random();
        List<AdjustmentRecordVO> r = new ArrayList<>();
        for (int i = 0; i < a.length / 2; i++) {

            AdjustmentRecordVO a1 = new AdjustmentRecordVO();
            a1.setAccrualAmountNonPayment(BigDecimal.valueOf(random.nextDouble() * 100)
                    .setScale(2, RoundingMode.HALF_UP));
            a1.setPayableAmount(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setAdjustmentAmount(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            if (random.nextBoolean()) {

                a1.setBonus("Override");
            } else {
                a1.setBonus("Sales Allowance");
            }
            if (random.nextBoolean()) {

                a1.setPolicyCurrency("USD");
            } else {
                a1.setPolicyCurrency("HKD");
            }
            a1.setPolicyNo(a[i * 2]);
            r.add(a1);
        }
        r.sort(Comparator.comparing(AdjustmentRecordVO::getPolicyNo));
        return r;
    }

    static AdjustmentVO adjustment() {
        Random random = new Random();
        AdjustmentVO a = new AdjustmentVO();
        a.setGrandTotalHKD(BigDecimal.valueOf(999999999.99));
        a.setSubTotalHKD(BigDecimal.valueOf(999999999.99));
        a.setSubTotalUSD(BigDecimal.valueOf(999999999.99));
        a.setAdjustmentRecords(adjustmentRecords());
        return a;
    }

    static List<AccrualPaymentRecordVO> accrualPaymentRecords() {
        Random random = new Random();
        List<AccrualPaymentRecordVO> r = new ArrayList<>();
        for (int i = 0; i < a.length / 2; i++) {

            AccrualPaymentRecordVO a1 = new AccrualPaymentRecordVO();
            a1.setCurrentMonthAccrual(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setAccrualAmountNonPayment(BigDecimal.valueOf(random.nextDouble() * 100)
                    .setScale(2, RoundingMode.HALF_UP));
            a1.setPayableAmount(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            a1.setClosingBalance(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
            if (random.nextBoolean()) {

                a1.setPolicyCurrency("USD");
            } else {
                a1.setPolicyCurrency("HKD");
            }
            a1.setPolicyNo(a[i * 2]);
            r.add(a1);
        }
        r.sort(Comparator.comparing(AccrualPaymentRecordVO::getPolicyNo));
        return r;

    }

    static AccrualPaymentVO accrualPayment() {
        Random random = new Random();
        AccrualPaymentVO a = new AccrualPaymentVO();
        a.setAccrualPaymentRecords(accrualPaymentRecords());
        a.setGrandTotalHKD(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        a.setSubTotalHKD(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        a.setSubTotalUSD(BigDecimal.valueOf(random.nextDouble() * 100).setScale(2, RoundingMode.HALF_UP));
        return a;
    }

    private static BrokerItemVO getBrokerItem(Integer i) {
        BrokerItemVO item = new BrokerItemVO();
        item.setBrokerFirmCode(a[i * 2]);
        item.setBrokerFirmName(a[i * 2 + 1]);
        item.setHkdPayment(getPaymentDetail());
        if (i % 3 == 0) {
            item.setUsdPayment(getPaymentDetail());
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
            "0135965466", "Other DESC",
            "0156315070", "Medical DESC",
            "0182196890", "Medical DESC",
            "0182711268", "Medical DESC",
            "0188772058", "Critical Illness DESC",
            "2800132159", "Medical DESC",
            "2800157123", "Medical DESC",
            "2804467197", "Critical Illness DESC",
            "2804467197", "ILAS DESC",
            "2804467197", "Other DESC",
            "2804467288", "Critical Illness DESC",
            "2804467288", "ILAS DESC",
            "2804467288", "Medical DESC",
            "2804467288", "Other DESC",
            "2804467312", "Critical Illness DESC",
            "2804467312", "Medical DESC",
            "2804467312", "Other DESC",
            "2870136189", "Medical DESC",
            "2870143912", "Life Protection DESC",
            "2870143912", "Medical DESC",
            "2870145420", "Critical Illness DESC",
            "2870149158", "Medical DESC",
            "2870149356", "Medical DESC",
            "2870900014", "Medical DESC",
            "2870933551", "Medical DESC",
            "2870936265", "Medical DESC",
            "2870948575", "Medical DESC",
            "2870953864", "Other DESC",
            "2870959366", "ILAS DESC",
            "2870965421", "Medical DESC",
            "2871005466", "Life Protection DESC",
            "2871006068", "Medical DESC",
            "2871006076", "Medical DESC",
            "2871006191", "Medical DESC",
            "2871006308", "Medical DESC"
    };

}
